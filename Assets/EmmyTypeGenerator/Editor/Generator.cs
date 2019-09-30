#define ToLuaVersion
//todo xlua version
//#define XLuaVersion

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Text;
using System.Text.RegularExpressions;
using DG.Tweening;
using LuaInterface;
using UnityEditor;
using UnityEngine;

namespace EmmyTypeGenerator
{
    public static class Generator
    {
        /// <summary>
        /// 该文件只用来给ide进行lua类型提示的,不要在运行时require该文件或者打包到版本中.
        /// </summary>
        private static string TypeDefineFilePath
        {
            get { return Application.dataPath + "/EmmyTypeGenerator/EmmyTypeDefine.lua"; }
        }

        /// <summary>
        /// 该文件需要在运行时require到lua虚拟机中,主要存放了大部分导出类型以及委托的全局引用
        /// </summary>
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

        public static StringBuilder sb = new StringBuilder(1024);
        private static StringBuilder tempSb = new StringBuilder(1024);
        private static List<Type> exportTypeList = new List<Type>();

        private static Dictionary<Type, List<MethodInfo>>
            extensionMethodsDic = new Dictionary<Type, List<MethodInfo>>();

        [MenuItem("Lua/EmmyTypeGenerate")]
        public static void GenerateEmmyTypeFiles()
        {
            for (int i = 0; i < CustomSettings.customTypeList.Length; i++)
            {
                ToLuaMenu.BindType bindType = CustomSettings.customTypeList[i];
                RecordTypeAndBaseType(bindType.type);
                if (bindType.extendList.Count > 0)
                {
                    for (var j = 0; j < bindType.extendList.Count; j++)
                    {
                        RecordTypeAndBaseType(bindType.extendList[j]);
                    }
                }
            }

#if ToLuaVersion
            for (int i = 0; i < ToLuaFacility.toluaBaseTypes.Count; i++)
            {
                RecordType(ToLuaFacility.toluaBaseTypes[i]);
            }
#endif

            HandleExtensionMethods();
            //如果没有使用DOTween，屏蔽这一句
            UnRecordType(typeof(ShortcutExtensions));
            
            GenerateTypeDefines();
            GenerateExportTypeGlobalVariable();

            AssetDatabase.Refresh();
        }


        private static void RecordTypeAndBaseType(Type type)
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

            if (ToLuaExport.IsMemberFilter(type))
            {
                return;
            }

            exportTypeList.Add(type);
            if (type.BaseType != null && !type.IsEnum)
            {
                RecordTypeAndBaseType(type.BaseType);
            }
        }

        private static void RecordType(Type type)
        {
            if (exportTypeList.Contains(type))
            {
                return;
            }

            if (ToLuaExport.IsMemberFilter(type))
            {
                return;
            }

            exportTypeList.Add(type);
        }

        private static void UnRecordType(Type type)
        {
            if (exportTypeList.Contains(type))
            {
                exportTypeList.Remove(type);
            }
        }

        private static void HandleExtensionMethods()
        {
            for (var i = 0; i < exportTypeList.Count; i++)
            {
                Type type = exportTypeList[i];

                MethodInfo[] publicStaticMethodInfos =
                    type.GetMethods(BindingFlags.Public | BindingFlags.Static | BindingFlags.DeclaredOnly);
                for (var j = 0; j < publicStaticMethodInfos.Length; j++)
                {
                    MethodInfo methodInfo = publicStaticMethodInfos[j];
                    if (methodInfo.IsDefined(typeof(ExtensionAttribute), false))
                    {
                        Type extensionType = methodInfo.GetParameters()[0].ParameterType;
                        if (extensionMethodsDic.TryGetValue(extensionType, out List<MethodInfo> extensionMethodList))
                        {
                            extensionMethodList.Add(methodInfo);
                        }
                        else
                        {
                            List<MethodInfo> methodList = new List<MethodInfo> {methodInfo};
                            extensionMethodsDic.Add(extensionType, methodList);
                        }
                    }
                }
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

                keepStringTypeName = type == typeof(string);

                WriteClassDefine(type);
                WriteClassFieldDefine(type);
                sb.AppendLine(string.Format("local {0} = {{}}", type.ToLuaTypeName().ReplaceDotOrPlusWithUnderscore()));

                WriteClassConstructorDefine(type);
                WriteClassMethodDefine(type);

                sb.AppendLine("");
            }

            File.WriteAllText(TypeDefineFilePath, sb.ToString());
        }

        private static void GenerateExportTypeGlobalVariable()
        {
            sb.Clear();

            for (int i = 0; i < exportTypeList.Count; i++)
            {
                Type exportType = exportTypeList[i];
                keepStringTypeName = exportType == typeof(string);

                sb.AppendLine(string.Format("---@type {0}", exportType.ToLuaTypeName()));
                sb.AppendLine(string.Format("{0} = {1}", exportType.ToLuaTypeName().ReplaceDotOrPlusWithUnderscore(),
                    exportType.ToLuaTypeName()));
            }

            //generate delegates
            WriteDelegateTypeDefine();

            File.WriteAllText(LuaGlobalVariableFilePath, sb.ToString());
        }

        #region TypeDefineFileGenerator

        public static void WriteClassDefine(Type type)
        {
            if (type.BaseType != null && !type.IsEnum)
            {
                sb.AppendLine(string.Format("---@class {0} : {1}", type.ToLuaTypeName(),
                    type.BaseType.ToLuaTypeName()));
            }
            else
            {
                sb.AppendLine(string.Format("---@class {0}", type.ToLuaTypeName()));
            }
        }

        public static void WriteClassFieldDefine(Type type)
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
                if (fieldInfo.IsMemberObsolete(type))
                {
                    continue;
                }

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
                if (propertyInfo.IsMemberObsolete(type))
                {
                    continue;
                }

                Type propertyType = propertyInfo.PropertyType;
                sb.AppendLine(string.Format("---@field {0} {1}", propertyInfo.Name, propertyType.ToLuaTypeName()));
            }
        }

        public static void WriteClassConstructorDefine(Type type)
        {
            if (type == typeof(MonoBehaviour) || type.IsSubclassOf(typeof(MonoBehaviour)))
            {
                return;
            }

            string className = type.ToLuaTypeName().ReplaceDotOrPlusWithUnderscore();
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

        public static void WriteClassMethodDefine(Type type)
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

                if (methodInfo.GetCustomAttributes(typeof(NoToLuaAttribute), false).Length > 0)
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
                if (methodInfo.IsMemberObsolete(type))
                {
                    continue;
                }

                recordMethodGroup(methodInfo);
            }

            for (int i = 0; i < publicInstanceMethodInfos.Length; i++)
            {
                MethodInfo methodInfo = publicInstanceMethodInfos[i];
                if (methodInfo.IsMemberObsolete(type))
                {
                    continue;
                }

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
                WriteMethodFunctionDeclare(lastMethodInfo.GetParameters(), lastMethodInfo.ReturnType,
                    lastMethodInfo.Name,
                    classNameWithNameSpace, lastMethodInfo.IsStatic);
            }

            WriteExtensionMethodFunctionDecalre(type);
        }

        public static void WriteOverloadMethodCommentDecalre(ParameterInfo[] parameterInfos, Type returnType)
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

        public static void WriteMethodFunctionDeclare(ParameterInfo[] parameterInfos, Type returnType,
            string methodName,
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
                sb.Append(string.Format(",{0}",
                    outOrRefParameterInfoList[i].ParameterType.GetElementType().ToLuaTypeName()));
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

        private static void WriteExtensionMethodFunctionDecalre(Type type)
        {
            if (extensionMethodsDic.TryGetValue(type, out List<MethodInfo> extensionMethodList))
            {
                for (var i = 0; i < extensionMethodList.Count; i++)
                {
                    MethodInfo methodInfo = extensionMethodList[i];
                    ParameterInfo[] parameterInfos = methodInfo.GetParameters();
                    if (parameterInfos.Length > 0)
                    {
                        //第一个param是拓展类型，去掉
                        parameterInfos = parameterInfos.ToList().GetRange(1, parameterInfos.Length - 1).ToArray();
                    }

                    Type returnType = methodInfo.ReturnType;
                    string methodName = methodInfo.Name;
                    string classNameWithNameSpace = type.ToLuaTypeName().Replace(".", "_");

                    WriteMethodFunctionDeclare(parameterInfos, returnType, methodName, classNameWithNameSpace, false);
                }
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
                    if (ToLuaExport.IsMemberFilter(type))
                    {
                        return;
                    }

                    if (!exportDelegateTypeList.Contains(type))
                    {
                        exportDelegateTypeList.Add(type);
                    }
                }
            };

            for (int i = 0; i < exportTypeList.Count; i++)
            {
                Type exportType = exportTypeList[i];
#if ToLuaVersion
                //tolua基础类型的委托事件好像都没有被导出来
                if (ToLuaFacility.toluaBaseTypes.Contains(exportType))
                {
                    continue;
                }
#endif
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

                    if (string.IsNullOrEmpty(delegateType.FullName))
                    {
                        continue;
                    }

                    tempSb.Clear();
                    tempSb.Append(delegateType.GetGenericTypeFullName().ReplaceDotOrPlusWithUnderscore());

                    Type[] genericTypes = delegateType.GetGenericArguments();
                    for (int j = 0; j < genericTypes.Length; j++)
                    {
//                        Debug.Log("包含泛型参数类型: " + genericTypes[j].FullName);
                        tempSb.AppendFormat("_{0}",
                            genericTypes[j].ToCSharpTypeFullName().ReplaceDotOrPlusWithUnderscore());
                    }

                    tempSb.AppendFormat(" = {0}", delegateType.GetGenericTypeFullName());
                    for (int j = 0; j < genericTypes.Length; j++)
                    {
                        tempSb.AppendFormat("_{0}",
                            genericTypes[j].ToCSharpTypeFullName().ReplaceDotOrPlusWithUnderscore());
                    }

                    sb.AppendLine(tempSb.ToString());
                }
                else
                {
                    sb.AppendLine(string.Format("{0} = {1}", delegateType.FullName.ReplaceDotOrPlusWithUnderscore(),
                        delegateType.FullName.ReplacePlusWithDot()));
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
            if (invokeMethodInfo == null)
            {
                return;
            }

            ParameterInfo[] parameterInfos = invokeMethodInfo.GetParameters();
            for (int i = 0; i < parameterInfos.Length; i++)
            {
                ParameterInfo parameterInfo = parameterInfos[i];
                tempSb.AppendFormat("{0} : {1}", parameterInfo.Name, parameterInfo.ParameterType.ToLuaTypeName());
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
            return ToLuaFacility.toluaRewriteTypes.Contains(type) || exportTypeList.Contains(type) ||
                   type == typeof(string) ||
                   luaNumberTypeSet.Contains(type) || type == typeof(bool);
#else
            return exportTypeList.Contains(type) || type == typeof(string) ||
                   luaNumberTypeSet.Contains(type) || type == typeof(bool);
#endif
        }

        private static bool keepStringTypeName;

        public static string ToLuaTypeName(this Type type)
        {
            if (!TypeIsExport(type))
            {
                if (type.IsEnum)
                {
                    return "NotExportEnum";
                }

                if (type == typeof(LuaFunction))
                {
                    return "fun()";
                }

                return "NotExportType";
            }

            if (luaNumberTypeSet.Contains(type))
            {
                return "number";
            }

            if (type == typeof(string))
            {
                return keepStringTypeName ? "System.String" : "string";
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

            //去除泛型后缀
            typeName = typeName.EscapeGenericTypeSuffix();

            int bracketIndex = typeName.IndexOf("[[");
            if (bracketIndex > 0)
            {
                typeName = typeName.Substring(0, bracketIndex);
                Type[] genericTypes = type.GetGenericArguments();
                for (int i = 0; i < genericTypes.Length; i++)
                {
                    Type genericArgumentType = genericTypes[i];
                    string genericArgumentTypeName;
                    if (CSharpTypeNameDic.ContainsKey(genericArgumentType))
                    {
                        genericArgumentTypeName = CSharpTypeNameDic[genericArgumentType];
                    }
                    else
                    {
                        genericArgumentTypeName = genericArgumentType.ToLuaTypeName();
                    }

                    typeName = typeName + "_" + genericArgumentTypeName.ReplaceDotOrPlusWithUnderscore();
                }
            }

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


        public static string EscapeLuaKeyword(string s)
        {
            if (luaKeywordSet.Contains(s))
            {
                return "_" + s;
            }

            return s;
        }

        public static string ToCSharpTypeFullName(this Type type)
        {
            if (CSharpTypeNameDic.ContainsKey(type))
            {
                return CSharpTypeNameDic[type];
            }

            return type.FullName;
        }

        public static string GetGenericTypeFullName(this Type type)
        {
            string fullName = type.FullName;
            int backquoteIndex = fullName.IndexOf("`");
            return fullName.Substring(0, backquoteIndex);
        }

        public static string ReplaceDotOrPlusWithUnderscore(this string s)
        {
            return s.Replace(".", "_").Replace("+", "_");
        }

        public static string ReplacePlusWithDot(this string s)
        {
            return s.Replace("+", ".");
        }

        public static string EscapeGenericTypeSuffix(this string s)
        {
            string result = Regex.Replace(s, @"\`[0-9]+", "").Replace("+", ".");
            return result;
        }

        public static bool IsMemberObsolete(this MemberInfo memberInfo, Type type)
        {
            return memberInfo.GetCustomAttributes(typeof(ObsoleteAttribute), false).Length > 0 ||
                   IsMemberFilter(memberInfo, type);
        }

        public static bool IsMemberFilter(MemberInfo mi, Type type)
        {
            if (type.IsGenericType)
            {
                Type genericType = type.GetGenericTypeDefinition();

                if (genericType == typeof(Dictionary<,>) && mi.Name == "Remove")
                {
                    MethodBase mb = (MethodBase) mi;
                    return mb.GetParameters().Length == 2;
                }

                if (genericType == typeof(Dictionary<,>) || genericType == typeof(KeyValuePair<,>))
                {
                    string str = genericType.Name;
                    str = str.Substring(0, str.IndexOf("`"));
                    return ToLuaExport.memberFilter.Contains(str + "." + mi.Name);
                }
            }

            return ToLuaExport.memberInfoFilter.Contains(mi) ||
                   ToLuaExport.memberFilter.Contains(type.Name + "." + mi.Name);
        }
    }
}