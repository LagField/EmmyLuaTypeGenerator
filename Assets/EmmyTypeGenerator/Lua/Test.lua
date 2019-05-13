require('ExportTypeGlobalVariables')

--UnityEngine.Debug.Log('hello world')
--local newGameobject = UnityEngine.GameObject.New('New GameObject From Lua')
--TestExportScript.PrintGameobject(newGameobject)
--
--TestExportScript.TestDelegate(System.Action_float(function(number)
--    UnityEngine.Debug.Log('delegate print ' .. number)
--end), 100)
--
--TestExportScript.TestDelegate(TestExportScript.CustomDelegate(function(content)
--    UnityEngine.Debug.Log('custom delegate ' .. content)
--end), 'yes')
--
--local dic = TestExportScript.GetDictionary()
--UnityEngine.Debug.Log('dictionary count: ' .. dic.Count)
--UnityEngine.Debug.Log('dictionary element: ' .. dic:get_Item(1))
--UnityEngine.Debug.Log('dictionary element: ' .. dic[1])

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