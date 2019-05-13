using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class TestExportScript
{
    public static void PrintGameobject(this GameObject go)
    {
        Debug.Log(go.name);
    }
}