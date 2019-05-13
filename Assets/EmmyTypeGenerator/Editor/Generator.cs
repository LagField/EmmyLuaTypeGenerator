﻿#define ToLuaVersion
//#define XLuaVersion

using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Text;
using UnityEditor;
using UnityEngine;

namespace EmmyTypeGenerator
{
    public static class Generator
    {
        private static string TypeDefineFilePath
        {
            get { return Application.dataPath + "/EmmyTypeGenerator/EmmyTypeDefine.lua"; }
        }

        private static string LuaGlobalVariableFilePath
        {
            get { return Application.dataPath + "/EmmyTypeGenerator/Lua/ExportTypeGlobalVariables.lua"; }
        }

        private static HashSet<Type> luaNumberTypeSet = new HashSet<Type>
        {
            typeof(byte),
            typeof(sbyte),
            typeof(short),
            typeof(ushort),
            typeof(int),
            typeof(uint),
            typeof(long),
            typeof(ulong),
            typeof(float),
            typeof(double)
        };

        private static HashSet<string> luaKeywordSet = new HashSet<string>
        {
            "and",
            "break",
            "do",
            "else",
            "elseif",
            "end",
            "false",
            "for",
            "function",
            "if",
            "in",
            "local",
            "nil",
            "not",
            "or",
            "repeat",
            "return",
            "then",
            "true",
            "until",
            "while"
        };

        private static StringBuilder sb = new StringBuilder(1024);
        private static StringBuilder tempSb = new StringBuilder(1024);
        private static List<Type> exportTypeList = new List<Type>();

        [MenuItem("Lua/EmmyTypeGenerate")]
        public static void GenerateEmmyTypeFiles()
        {
            for (int i = 0; i < CustomSettings.customTypeList.Length; i++)
            {
                RecordType(CustomSettings.customTypeList[i].type);
            }

            GenerateTypeDefines();
            GenerateExportTypeGlobalVariable();

            AssetDatabase.Refresh();
        }

        private static void RecordType(Type type)
        {
#if ToLuaVersion
            if (ToLuaFacility.toluaRewriteTypes.Contains(type))
            {
                return;
            }
#endif

            if (exportTypeList.Contains(type))
            {
                return;
            }

            exportTypeList.Add(type);
            if (type.BaseType != null && !type.IsEnum)
            {
                RecordType(type.BaseType);
            }
        }

        private static void GenerateTypeDefines()
        {
            sb.Clear();
            sb.AppendLine("---@class NotExportType @表明该类型未导出");
            sb.AppendLine("");
            sb.AppendLine("---@class NotExportEnum @表明该枚举未导出");
            sb.AppendLine("");

            for (int i = 0; i < exportTypeList.Count; i++)
            {
                Type type = exportTypeList[i];

                WriteClassDefine(type);
                WriteClassFieldDefine(type);
                sb.AppendLine(string.Format("local {0} = {{}}", type.FullName.Replace(".", "_")));

                WriteClassConstructorDefine(type);
                WriteClassMethodDefine(type);

                sb.AppendLine("");
            }

            File.WriteAllText(TypeDefineFilePath, sb.ToString());
        }

        private static void GenerateExportTypeGlobalVariable()
        {
            List<Type> globalVariableTypes = new List<Type>();
            for (int i = 0; i < exportTypeList.Count; i++)
            {
                Type exportType = exportTypeList[i];

                if (exportType == typeof(MonoBehaviour) || exportType.IsSubclassOf(typeof(MonoBehaviour)))
                {
                    //检查mono脚本是否有静态方法或属性
                    MethodInfo[] methodInfos = exportType.GetMethods(BindingFlags.Public | BindingFlags.Static);
                    FieldInfo[] fieldInfos = exportType.GetFields(BindingFlags.Public | BindingFlags.Static);
                    PropertyInfo[] propertyInfos = exportType.GetProperties(BindingFlags.Public | BindingFlags.Static);

                    if (methodInfos.Length == 0 && fieldInfos.Length == 0 && propertyInfos.Length == 0)
                    {
                        continue;
                    }
                }

                globalVariableTypes.Add(exportType);
            }

            sb.Clear();

            for (int i = 0; i < globalVariableTypes.Count; i++)
            {
                Type exportType = globalVariableTypes[i];

                sb.AppendLine(string.Format("---@type {0}", exportType.FullName));
                sb.AppendLine(string.Format("{0} = {1}", exportType.FullName.Replace(".", "_"), exportType.FullName));
            }

            //generate delegates
            WriteDelegateTypeDefine();

            File.WriteAllText(LuaGlobalVariableFilePath, sb.ToString());
        }

        #region TypeDefineFileGenerator

        private static void WriteClassDefine(Type type)
        {
            if (type.BaseType != null && !type.IsEnum)
            {
                sb.AppendLine(string.Format("---@class {0} : {1}", type.ToLuaTypeName(), type.BaseType.ToLuaTypeName()));
            }
            else
            {
                sb.AppendLine(string.Format("---@class {0}", type.ToLuaTypeName()));
            }
        }

        private static void WriteClassFieldDefine(Type type)
        {
            FieldInfo[] publicInstanceFieldInfos =
                type.GetFields(BindingFlags.Public | BindingFlags.Instance | BindingFlags.DeclaredOnly);
            FieldInfo[] publicStaticFieldInfos =
                type.GetFields(BindingFlags.Public | BindingFlags.Static | BindingFlags.DeclaredOnly);
            List<FieldInfo> fieldInfoList = new List<FieldInfo>();
            fieldInfoList.AddRange(publicStaticFieldInfos);
            if (!type.IsEnum)
            {
                fieldInfoList.AddRange(publicInstanceFieldInfos);
            }

            for (int i = 0; i < fieldInfoList.Count; i++)
            {
                FieldInfo fieldInfo = fieldInfoList[i];
                Type fieldType = fieldInfo.FieldType;
                sb.AppendLine(string.Format("---@field {0} {1}", fieldInfo.Name, fieldType.ToLuaTypeName()));
            }

            PropertyInfo[] publicInstancePropertyInfo =
                type.GetProperties(BindingFlags.Public | BindingFlags.Instance | BindingFlags.DeclaredOnly);
            PropertyInfo[] publicStaticPropertyInfo =
                type.GetProperties(BindingFlags.Public | BindingFlags.Static | BindingFlags.DeclaredOnly);
            List<PropertyInfo> propertyInfoList = new List<PropertyInfo>();
            propertyInfoList.AddRange(publicStaticPropertyInfo);
            if (!type.IsEnum)
            {
                propertyInfoList.AddRange(publicInstancePropertyInfo);
            }

            for (int i = 0; i < propertyInfoList.Count; i++)
            {
                PropertyInfo propertyInfo = propertyInfoList[i];
                Type propertyType = propertyInfo.PropertyType;
                sb.AppendLine(string.Format("---@field {0} {1}", propertyInfo.Name, propertyType.ToLuaTypeName()));
            }
        }

        private static void WriteClassConstructorDefine(Type type)
        {
            if (type == typeof(MonoBehaviour) || type.IsSubclassOf(typeof(MonoBehaviour)))
            {
                return;
            }

            string className = type.FullName.Replace(".", "_");
            ConstructorInfo[] constructorInfos = type.GetConstructors();
            if (constructorInfos.Length == 0)
            {
                return;
            }

            for (int i = 0; i < constructorInfos.Length - 1; i++)
            {
                ConstructorInfo ctorInfo = constructorInfos[i];
                if (ctorInfo.IsStatic || ctorInfo.IsGenericMethod)
                {
                    continue;
                }

                WriteOverloadMethodCommentDecalre(ctorInfo.GetParameters(), type);
            }

            ConstructorInfo lastCtorInfo = constructorInfos[constructorInfos.Length - 1];
            WriteMethodFunctionDeclare(lastCtorInfo.GetParameters(), type, "New", className, true);
        }

        private static void WriteClassMethodDefine(Type type)
        {
            string classNameWithNameSpace = type.ToLuaTypeName().Replace(".", "_");

            Dictionary<string, List<MethodInfo>> methodGroup = new Dictionary<string, List<MethodInfo>>();
            MethodInfo[] publicInstanceMethodInfos =
                type.GetMethods(BindingFlags.Public | BindingFlags.Instance | BindingFlags.DeclaredOnly);
            MethodInfo[] publicStaticMethodInfos =
                type.GetMethods(BindingFlags.Public | BindingFlags.Static | BindingFlags.DeclaredOnly);

            Action<MethodInfo> recordMethodGroup = methodInfo =>
            {
                string methodName = methodInfo.Name;

                if (methodInfo.IsGenericMethod)
                {
                    return;
                }

                if (methodName.StartsWith("get_") || methodName.StartsWith("set_") || methodName.StartsWith("op_"))
                {
                    return;
                }

                if (methodName.StartsWith("add_") || methodName.StartsWith("remove_"))
                {
                    return;
                }

                if (methodInfo.MemberType == MemberTypes.Event)
                {
                    Debug.Log(methodInfo.Name);
                }

                if (methodGroup.ContainsKey(methodName))
                {
                    List<MethodInfo> methodInfoList = methodGroup[methodName];
                    if (methodInfoList == null)
                    {
                        methodInfoList = new List<MethodInfo>();
                    }

                    methodInfoList.Add(methodInfo);
                    methodGroup[methodName] = methodInfoList;
                }
                else
                {
                    methodGroup.Add(methodName, new List<MethodInfo> {methodInfo});
                }
            };

            for (int i = 0; i < publicStaticMethodInfos.Length; i++)
            {
                MethodInfo methodInfo = publicStaticMethodInfos[i];
                recordMethodGroup(methodInfo);
            }

            for (int i = 0; i < publicInstanceMethodInfos.Length; i++)
            {
                MethodInfo methodInfo = publicInstanceMethodInfos[i];
                recordMethodGroup(methodInfo);
            }

            foreach (var oneGroup in methodGroup)
            {
                List<MethodInfo> methodInfoList = oneGroup.Value;
                //前面的方法都是overload
                for (int i = 0; i < methodInfoList.Count - 1; i++)
                {
                    WriteOverloadMethodCommentDecalre(methodInfoList[i].GetParameters(), methodInfoList[i].ReturnType);
                }

                MethodInfo lastMethodInfo = methodInfoList[methodInfoList.Count - 1];
                WriteMethodFunctionDeclare(lastMethodInfo.GetParameters(), lastMethodInfo.ReturnType, lastMethodInfo.Name,
                    classNameWithNameSpace, lastMethodInfo.IsStatic);
            }
        }

        private static void WriteOverloadMethodCommentDecalre(ParameterInfo[] parameterInfos, Type returnType)
        {
            List<ParameterInfo> outOrRefParameterInfoList = new List<ParameterInfo>();

            tempSb.Clear();
            for (int i = 0; i < parameterInfos.Length; i++)
            {
                ParameterInfo parameterInfo = parameterInfos[i];
                string parameterName = parameterInfo.Name;
                string parameterTypeName = parameterInfo.ParameterType.ToLuaTypeName();
                if (parameterInfo.IsOut)
                {
                    parameterName = "out_" + parameterName;
                    outOrRefParameterInfoList.Add(parameterInfo);

                    parameterTypeName = parameterInfo.ParameterType.GetElementType().ToLuaTypeName();
                }
                else if (parameterInfo.ParameterType.IsByRef)
                {
                    parameterName = "ref_" + parameterName;
                    outOrRefParameterInfoList.Add(parameterInfo);

                    parameterTypeName = parameterInfo.ParameterType.GetElementType().ToLuaTypeName();
                }

                parameterName = EscapeLuaKeyword(parameterName);
                if (i == parameterInfos.Length - 1)
                {
                    tempSb.Append(string.Format("{0} : {1}", parameterName, parameterTypeName));
                }
                else
                {
                    tempSb.Append(string.Format("{0} : {1}, ", parameterName, parameterTypeName));
                }
            }

            //return
            List<Type> returnTypeList = new List<Type>();
            if (returnType != null && returnType != typeof(void))
            {
                returnTypeList.Add(returnType);
            }

            for (int i = 0; i < outOrRefParameterInfoList.Count; i++)
            {
                returnTypeList.Add(outOrRefParameterInfoList[i].ParameterType.GetElementType());
            }

            string returnTypeString = "";
            for (int i = 0; i < returnTypeList.Count; i++)
            {
                if (i == returnTypeList.Count - 1)
                {
                    returnTypeString += returnTypeList[i].ToLuaTypeName();
                }
                else
                {
                    returnTypeString += returnTypeList[i].ToLuaTypeName() + ", ";
                }
            }

            if (returnTypeList.Count > 0)
            {
                sb.AppendLine(string.Format("---@overload fun({0}) : {1}", tempSb, returnTypeString));
            }
            else
            {
                sb.AppendLine(string.Format("---@overload fun({0})", tempSb));
            }
        }

        private static void WriteMethodFunctionDeclare(ParameterInfo[] parameterInfos, Type returnType, string methodName,
            string className, bool isStaticMethod)
        {
            List<ParameterInfo> outOrRefParameterInfoList = new List<ParameterInfo>();

            tempSb.Clear();
            for (int i = 0; i < parameterInfos.Length; i++)
            {
                ParameterInfo parameterInfo = parameterInfos[i];
                string parameterName = parameterInfo.Name;
                string parameterTypeName = parameterInfo.ParameterType.ToLuaTypeName();
                if (parameterInfo.IsOut)
                {
                    parameterName = "out_" + parameterName;
                    outOrRefParameterInfoList.Add(parameterInfo);

                    parameterTypeName = parameterInfo.ParameterType.GetElementType().ToLuaTypeName();
                }
                else if (parameterInfo.ParameterType.IsByRef)
                {
                    parameterName = "ref_" + parameterName;
                    outOrRefParameterInfoList.Add(parameterInfo);

                    parameterTypeName = parameterInfo.ParameterType.GetElementType().ToLuaTypeName();
                }

                parameterName = EscapeLuaKeyword(parameterName);

                if (i == parameterInfos.Length - 1)
                {
                    tempSb.Append(parameterName);
                }
                else
                {
                    tempSb.Append(string.Format("{0}, ", parameterName));
                }

                sb.AppendLine(string.Format("---@param {0} {1}", parameterName, parameterTypeName));
            }

            //return
            bool haveReturen = returnType != null && returnType != typeof(void) || outOrRefParameterInfoList.Count > 0;

            if (haveReturen)
            {
                sb.Append("---@return ");
            }

            if (returnType != null && returnType != typeof(void))
            {
                sb.Append(returnType.ToLuaTypeName());
            }

            for (int i = 0; i < outOrRefParameterInfoList.Count; i++)
            {
                sb.Append(string.Format(",{0}", outOrRefParameterInfoList[i].ParameterType.GetElementType().ToLuaTypeName()));
            }

            if (haveReturen)
            {
                sb.AppendLine("");
            }

            if (isStaticMethod)
            {
                sb.AppendLine(string.Format("function {0}.{1}({2}) end", className, methodName, tempSb));
            }
            else
            {
                sb.AppendLine(string.Format("function {0}:{1}({2}) end", className, methodName, tempSb));
            }
        }

        #endregion

        private static void WriteDelegateTypeDefine()
        {
            List<Type> exportDelegateTypeList = new List<Type>();
            for (int i = 0; i < CustomSettings.customDelegateList.Length; i++)
            {
                exportDelegateTypeList.Add(CustomSettings.customDelegateList[i].type);
            }

            //查找所有导出类型中,是否有用到了委托的
            Action<Type> recordDelegateTypeToList = type =>
            {
                if (typeof(Delegate).IsAssignableFrom(type))
                {
                    if (!exportDelegateTypeList.Contains(type))
                    {
                        exportDelegateTypeList.Add(type);
                    }
                }
            };

            for (int i = 0; i < exportTypeList.Count; i++)
            {
                Type exportType = exportTypeList[i];
                MethodInfo[] methodInfos = exportType.GetMethods(BindingFlags.Public | BindingFlags.Static);
                FieldInfo[] fieldInfos = exportType.GetFields(BindingFlags.Public | BindingFlags.Static);
                PropertyInfo[] propertyInfos = exportType.GetProperties(BindingFlags.Public | BindingFlags.Static);

                for (int j = 0; j < methodInfos.Length; j++)
                {
                    MethodInfo methodInfo = methodInfos[j];
                    ParameterInfo[] parameterInfos = methodInfo.GetParameters();
                    for (int k = 0; k < parameterInfos.Length; k++)
                    {
                        ParameterInfo parameterInfo = parameterInfos[k];
                        if (parameterInfo.IsOut || parameterInfo.ParameterType.IsByRef)
                        {
                            recordDelegateTypeToList(parameterInfo.ParameterType.GetElementType());
                        }
                        else
                        {
                            recordDelegateTypeToList(parameterInfo.ParameterType);
                        }
                    }

                    ParameterInfo returnInfo = methodInfo.ReturnParameter;
                    recordDelegateTypeToList(returnInfo.ParameterType);
                }

                for (int j = 0; j < fieldInfos.Length; j++)
                {
                    FieldInfo fieldInfo = fieldInfos[j];
                    recordDelegateTypeToList(fieldInfo.FieldType);
                }

                for (int j = 0; j < propertyInfos.Length; j++)
                {
                    PropertyInfo propertyInfo = propertyInfos[j];
                    recordDelegateTypeToList(propertyInfo.PropertyType);
                }
            }

//            Debug.Log("以下Delegate类型需要导出:");
//            for (int i = 0; i < exportDelegateTypeList.Count; i++)
//            {
//                Debug.Log(exportDelegateTypeList[i].FullName);
//            }

            for (int i = 0; i < exportDelegateTypeList.Count; i++)
            {
                Type delegateType = exportDelegateTypeList[i];
                WriteDelegateTypeComment(delegateType);
                if (delegateType.IsGenericType)
                {
//                    Debug.Log("泛型委托: " + delegateType.FullName);

                    tempSb.Clear();
                    tempSb.Append(delegateType.GetGenericTypeFullName().ReplaceDotOrPlusWithUnderscore());
                    Type[] genericTypes = delegateType.GetGenericArguments();
                    for (int j = 0; j < genericTypes.Length; j++)
                    {
//                        Debug.Log("包含泛型参数类型: " + genericTypes[j].FullName);
                        tempSb.AppendFormat("_{0}", genericTypes[j].ToCSharpTypeFullName().ReplaceDotOrPlusWithUnderscore());
                    }

                    tempSb.AppendFormat(" = {0}", delegateType.GetGenericTypeFullName());
                    for (int j = 0; j < genericTypes.Length; j++)
                    {
                        tempSb.AppendFormat("_{0}", genericTypes[j].ToCSharpTypeFullName().ReplaceDotOrPlusWithUnderscore());
                    }

                    sb.AppendLine(tempSb.ToString());
                }
                else
                {
                    sb.AppendLine(string.Format("{0} = {1}", delegateType.FullName.ReplaceDotOrPlusWithUnderscore(),
                        delegateType.FullName.Replace("+", ".")));
                }
            }
        }

        private static void WriteDelegateTypeComment(Type type)
        {
            //不是delegate类型
            if (!typeof(Delegate).IsAssignableFrom(type))
            {
                return;
            }

            tempSb.Clear();
            MethodInfo invokeMethodInfo = type.GetMethod("Invoke");
            ParameterInfo[] parameterInfos = invokeMethodInfo.GetParameters();
            for (int i = 0; i < parameterInfos.Length; i++)
            {
                ParameterInfo parameterInfo = parameterInfos[i];
                tempSb.AppendFormat("param{0} : {1}", i + 1, parameterInfo.ParameterType.ToLuaTypeName());
                if (i != parameterInfos.Length - 1)
                {
                    tempSb.Append(", ");
                }
            }

            Type returnType = invokeMethodInfo.ReturnType;
            if (returnType != typeof(void))
            {
                sb.AppendLine(string.Format("---@type fun(f : fun({0}) : {1})", tempSb, returnType.ToLuaTypeName()));
            }
            else
            {
                sb.AppendLine(string.Format("---@type fun(f : fun({0}))", tempSb));
            }
        }

        private static bool TypeIsExport(Type type)
        {
#if ToLuaVersion
            return ToLuaFacility.toluaRewriteTypes.Contains(type) || exportTypeList.Contains(type) || type == typeof(string) ||
                   luaNumberTypeSet.Contains(type) || type == typeof(bool);
#else
            return exportTypeList.Contains(type) || type == typeof(string) ||
                   luaNumberTypeSet.Contains(type) || type == typeof(bool);
#endif
        }

        private static string ToLuaTypeName(this Type type)
        {
            if (!TypeIsExport(type))
            {
                if (type.IsEnum)
                {
                    return "NotExportEnum";
                }

                return "NotExportType";
            }

            if (luaNumberTypeSet.Contains(type))
            {
                return "number";
            }

            if (type == typeof(string))
            {
                return "string";
            }

            if (type == typeof(bool))
            {
                return "boolean";
            }

            if (type.IsEnum)
            {
                return type.FullName.Replace("+", ".");
            }

            string typeName = type.FullName;
            return typeName;
        }

        private static Dictionary<Type, string> CSharpTypeNameDic = new Dictionary<Type, string>
        {
            {typeof(byte), "byte"},
            {typeof(sbyte), "sbyte"},
            {typeof(short), "short"},
            {typeof(ushort), "ushort"},
            {typeof(int), "int"},
            {typeof(uint), "uint"},
            {typeof(long), "long"},
            {typeof(ulong), "ulong"},
            {typeof(float), "float"},
            {typeof(double), "double"},
            {typeof(bool), "bool"},
            {typeof(string), "string"},
        };

        private static string ToCSharpTypeFullName(this Type type)
        {
            if (CSharpTypeNameDic.ContainsKey(type))
            {
                return CSharpTypeNameDic[type];
            }

            return type.FullName;
        }

        private static string GetGenericTypeFullName(this Type type)
        {
            string fullName = type.FullName;
            int backquoteIndex = fullName.IndexOf("`");
            return fullName.Substring(0, backquoteIndex);
        }

        private static string ReplaceDotOrPlusWithUnderscore(this string s)
        {
            return s.Replace(".", "_").Replace("+", "_");
        }

        private static string EscapeLuaKeyword(string s)
        {
            if (luaKeywordSet.Contains(s))
            {
                return "_" + s;
            }

            return s;
        }
    }
}