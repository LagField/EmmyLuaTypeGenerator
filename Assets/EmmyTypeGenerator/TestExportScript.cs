using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class TestExportScript
{
    public delegate void CustomDelegate(string custom);

    public static CustomDelegate myDelegate;

    public static Action<int> intDelegate;
    public static Action<Camera> cameraDelegate;
    
    static Dictionary<int,string> testDictionary = new Dictionary<int, string>
    {
        {1,"first element"},
        {100,"one hundred element"}
    };

    public static void TestDelegate(Action<float> callback, float number)
    {
        callback(number);
    }

    public static void TestDelegate(CustomDelegate customDelegate, string content)
    {
        customDelegate(content);
    }

    public static void PrintGameobject(this GameObject go)
    {
        Debug.Log(go.name);
    }

    public static Dictionary<int, string> GetDictionary()
    {
        return testDictionary;
    }
}