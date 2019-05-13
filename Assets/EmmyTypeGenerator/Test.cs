using System;
using System.Collections;
using System.Collections.Generic;
using LuaInterface;
using UnityEngine;

public class Test : MonoBehaviour
{
    private void Start()
    {
        var lua = new LuaState();                
        lua.Start();        
        string fullPath = Application.dataPath + "\\EmmyTypeGenerator/Lua";
        lua.AddSearchPath(fullPath);   
        
        DelegateFactory.Init();
        LuaBinder.Bind(lua);
        
        lua.Require("Test");
    }
}
