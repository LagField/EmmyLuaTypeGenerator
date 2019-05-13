require('ExportTypeGlobalVariables')

UnityEngine_Debug.Log('hello world')
local newGameobject = UnityEngine_GameObject.New('New GameObject From Lua')
TestExportScript.PrintGameobject(newGameobject)

TestExportScript.TestDelegate(System.Action_float(function(number)
    UnityEngine_Debug.Log('delegate print ' .. number)
end), 100)