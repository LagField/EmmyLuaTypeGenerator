require('ExportTypeGlobalVariables')

UnityEngine_Debug.Log('hello world')
local newGameobject = UnityEngine_GameObject.New('New GameObject From Lua')
TestExportScript.PrintGameobject(newGameobject)

TestExportScript.TestDelegate(System_Action_float(function(number)
    UnityEngine_Debug.Log('delegate print ' .. number)
end), 100)

TestExportScript.TestDelegate(TestExportScript_CustomDelegate(function(content)
    UnityEngine_Debug.Log('custom delegate ' .. content)
end), 'yes')

local dic = TestExportScript.GetDictionary()
UnityEngine_Debug.Log('dictionary count: ' .. dic.Count)
UnityEngine_Debug.Log('dictionary element: ' .. dic:get_Item(1))
UnityEngine_Debug.Log('dictionary element: ' .. dic[1])

local csharpString = System_String.New('123_456')
UnityEngine_Debug.Log('csharp string ' .. tostring(csharpString))
UnityEngine_Debug.Log('csharp string replace ' .. tostring(csharpString:Replace('123','000')))

if System_Collections_Generic_List_UnityEngine_GameObject ~= nil then
    UnityEngine_Debug.Log('System_Collections_Generic_List_UnityEngine_GameObject not nil')
end
if System_Collections_Generic_Dictionary_int_UnityEngine_GameObject ~= nil then
    UnityEngine_Debug.Log('System_Collections_Generic_Dictionary_int_UnityEngine_GameObject not nil')
end
if System_Collections_Generic_List_System_Collections_Generic_List_UnityEngine_GameObject ~= nil then
    UnityEngine_Debug.Log('System_Collections_Generic_List_System_Collections_Generic_List_UnityEngine_GameObject not nil')
end

