using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace EmmyTypeGenerator
{
    public static class Generator
    {
        private static string TypeDefineFilePath
        {
            get { return Application.dataPath + "/EmmyTypeGenerator/EmmyTypeDefine"; }
        }

        public static List<Type> exportTypeList;

        [MenuItem("Lua/EmmyTypeGenerate")]
        public static void GenerateEmmyTypeFiles()
        {

            exportTypeList = new List<Type>();
            for (int i = 0; i < CustomSettings.customTypeList.Length; i++)
            {
                exportTypeList.Add(CustomSettings.customTypeList[i].type);
                
            }
        }
    }
}