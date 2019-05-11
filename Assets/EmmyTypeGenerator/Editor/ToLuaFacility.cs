using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace EmmyTypeGenerator
{
    public static class ToLuaFacility 
    {
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
        
    }
}

