using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Text;
using LuaInterface;
using UnityEngine;
using Object = System.Object;

namespace EmmyTypeGenerator
{
    public static class ToLuaFacility
    {
        private static StringBuilder sb;
        private static StringBuilder tempSb = new StringBuilder();
        /// <summary>
        /// 这部分类型,Tolua在Lua侧实现
        /// </summary>
        public static HashSet<Type> toluaRewriteTypes = new HashSet<Type>
        {
            typeof(Bounds),
            typeof(Color),
            typeof(LayerMask),
            typeof(Mathf),
            typeof(Plane),
            typeof(Quaternion),
            typeof(Ray),
            typeof(RaycastHit),
            typeof(Time),
            typeof(Touch),
            typeof(Vector2),
            typeof(Vector3),
            typeof(Vector3)
        };

        public static List<Type> toluaBaseTypes = new List<Type>
        {
            typeof(EventObject),
            typeof(LuaConstructor),
            typeof(LuaField),
            typeof(LuaMethod),
            typeof(LuaOut<>),
            typeof(LuaProperty),
            typeof(Array),
            typeof(Dictionary<,>.KeyCollection),
            typeof(Dictionary<,>.ValueCollection),
            typeof(Dictionary<,>),
            typeof(KeyValuePair<,>),
            typeof(List<>),
            typeof(IEnumerator),
            typeof(ReadOnlyCollection<>),
            typeof(Delegate),
            typeof(Enum),
            typeof(NullObject),
            typeof(Object),
            typeof(string),
            typeof(Type),
            typeof(Coroutine),
            typeof(UnityEngine.Object)
        };
    }
}