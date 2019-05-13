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