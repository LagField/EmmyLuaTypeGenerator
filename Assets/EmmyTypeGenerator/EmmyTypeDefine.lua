---@class NotExportType @表明该类型未导出

---@class NotExportEnum @表明该枚举未导出

---@class LuaInterface.LuaInjectionStation : System.Object
---@field NOT_INJECTION_FLAG number
---@field INVALID_INJECTION_FLAG number
local LuaInterface_LuaInjectionStation = {}
---@return LuaInterface.LuaInjectionStation
function LuaInterface_LuaInjectionStation.New() end
---@param index number
---@return number
function LuaInterface_LuaInjectionStation.GetInjectFlag(index) end
---@param index number
---@return NotExportType
function LuaInterface_LuaInjectionStation.GetInjectionFunction(index) end
---@param index number
---@param injectFlag number
---@param func NotExportType
function LuaInterface_LuaInjectionStation.CacheInjectFunction(index, injectFlag, func) end
function LuaInterface_LuaInjectionStation.Clear() end

---@class System.Object
local System_Object = {}
---@return System.Object
function System_Object.New() end
---@overload fun(objA : System.Object, objB : System.Object) : boolean
---@param obj System.Object
---@return boolean
function System_Object:Equals(obj) end
---@param objA System.Object
---@param objB System.Object
---@return boolean
function System_Object.ReferenceEquals(objA, objB) end
---@return number
function System_Object:GetHashCode() end
---@return NotExportType
function System_Object:GetType() end
---@return string
function System_Object:ToString() end

---@class LuaInterface.InjectType
---@field None LuaInterface.InjectType
---@field After LuaInterface.InjectType
---@field Before LuaInterface.InjectType
---@field Replace LuaInterface.InjectType
---@field ReplaceWithPreInvokeBase LuaInterface.InjectType
---@field ReplaceWithPostInvokeBase LuaInterface.InjectType
local LuaInterface_InjectType = {}

---@class LuaInterface.Debugger : System.Object
---@field useLog boolean
---@field threadStack string
---@field logger NotExportType
local LuaInterface_Debugger = {}
---@overload fun(str : string)
---@overload fun(message : System.Object)
---@overload fun(str : string, arg0 : System.Object)
---@overload fun(str : string, arg0 : System.Object, arg1 : System.Object)
---@overload fun(str : string, arg0 : System.Object, arg1 : System.Object, arg2 : System.Object)
---@param str string
---@param param NotExportType
function LuaInterface_Debugger.Log(str, param) end
---@overload fun(str : string)
---@overload fun(message : System.Object)
---@overload fun(str : string, arg0 : System.Object)
---@overload fun(str : string, arg0 : System.Object, arg1 : System.Object)
---@overload fun(str : string, arg0 : System.Object, arg1 : System.Object, arg2 : System.Object)
---@param str string
---@param param NotExportType
function LuaInterface_Debugger.LogWarning(str, param) end
---@overload fun(str : string)
---@overload fun(message : System.Object)
---@overload fun(str : string, arg0 : System.Object)
---@overload fun(str : string, arg0 : System.Object, arg1 : System.Object)
---@overload fun(str : string, arg0 : System.Object, arg1 : System.Object, arg2 : System.Object)
---@param str string
---@param param NotExportType
function LuaInterface_Debugger.LogError(str, param) end
---@overload fun(e : NotExportType)
---@param str string
---@param e NotExportType
function LuaInterface_Debugger.LogException(str, e) end

---@class UnityEngine.Component : UnityEngine.Object
---@field transform UnityEngine.Transform
---@field gameObject UnityEngine.GameObject
---@field tag string
local UnityEngine_Component = {}
---@return UnityEngine.Component
function UnityEngine_Component.New() end
---@overload fun(type : NotExportType) : UnityEngine.Component
---@param type string
---@return UnityEngine.Component
function UnityEngine_Component:GetComponent(type) end
---@overload fun(t : NotExportType, includeInactive : boolean) : UnityEngine.Component
---@param t NotExportType
---@return UnityEngine.Component
function UnityEngine_Component:GetComponentInChildren(t) end
---@overload fun(t : NotExportType, includeInactive : boolean) : NotExportType
---@param t NotExportType
---@return NotExportType
function UnityEngine_Component:GetComponentsInChildren(t) end
---@param t NotExportType
---@return UnityEngine.Component
function UnityEngine_Component:GetComponentInParent(t) end
---@overload fun(t : NotExportType, includeInactive : boolean) : NotExportType
---@param t NotExportType
---@return NotExportType
function UnityEngine_Component:GetComponentsInParent(t) end
---@overload fun(type : NotExportType) : NotExportType
---@param type NotExportType
---@param results NotExportType
function UnityEngine_Component:GetComponents(type, results) end
---@param tag string
---@return boolean
function UnityEngine_Component:CompareTag(tag) end
---@overload fun(methodName : string, value : System.Object, options : NotExportEnum)
---@overload fun(methodName : string, value : System.Object)
---@overload fun(methodName : string)
---@param methodName string
---@param options NotExportEnum
function UnityEngine_Component:SendMessageUpwards(methodName, options) end
---@overload fun(methodName : string, value : System.Object)
---@overload fun(methodName : string)
---@overload fun(methodName : string, value : System.Object, options : NotExportEnum)
---@param methodName string
---@param options NotExportEnum
function UnityEngine_Component:SendMessage(methodName, options) end
---@overload fun(methodName : string, parameter : System.Object, options : NotExportEnum)
---@overload fun(methodName : string, parameter : System.Object)
---@overload fun(methodName : string)
---@param methodName string
---@param options NotExportEnum
function UnityEngine_Component:BroadcastMessage(methodName, options) end

---@class UnityEngine.Object : System.Object
---@field name string
---@field hideFlags NotExportEnum
local UnityEngine_Object = {}
---@return UnityEngine.Object
function UnityEngine_Object.New() end
---@overload fun(original : UnityEngine.Object, position : UnityEngine.Vector3, rotation : UnityEngine.Quaternion) : UnityEngine.Object
---@overload fun(original : UnityEngine.Object, position : UnityEngine.Vector3, rotation : UnityEngine.Quaternion, parent : UnityEngine.Transform) : UnityEngine.Object
---@overload fun(original : UnityEngine.Object) : UnityEngine.Object
---@overload fun(original : UnityEngine.Object, parent : UnityEngine.Transform) : UnityEngine.Object
---@param original UnityEngine.Object
---@param parent UnityEngine.Transform
---@param instantiateInWorldSpace boolean
---@return UnityEngine.Object
function UnityEngine_Object.Instantiate(original, parent, instantiateInWorldSpace) end
---@overload fun(obj : UnityEngine.Object, t : number)
---@param obj UnityEngine.Object
function UnityEngine_Object.Destroy(obj) end
---@overload fun(obj : UnityEngine.Object, allowDestroyingAssets : boolean)
---@param obj UnityEngine.Object
function UnityEngine_Object.DestroyImmediate(obj) end
---@param type NotExportType
---@return NotExportType
function UnityEngine_Object.FindObjectsOfType(type) end
---@param target UnityEngine.Object
function UnityEngine_Object.DontDestroyOnLoad(target) end
---@param type NotExportType
---@return UnityEngine.Object
function UnityEngine_Object.FindObjectOfType(type) end
---@return number
function UnityEngine_Object:GetInstanceID() end
---@return number
function UnityEngine_Object:GetHashCode() end
---@param other System.Object
---@return boolean
function UnityEngine_Object:Equals(other) end
---@return string
function UnityEngine_Object:ToString() end

---@class UnityEngine.Transform : UnityEngine.Component
---@field position UnityEngine.Vector3
---@field localPosition UnityEngine.Vector3
---@field eulerAngles UnityEngine.Vector3
---@field localEulerAngles UnityEngine.Vector3
---@field right UnityEngine.Vector3
---@field up UnityEngine.Vector3
---@field forward UnityEngine.Vector3
---@field rotation UnityEngine.Quaternion
---@field localRotation UnityEngine.Quaternion
---@field localScale UnityEngine.Vector3
---@field parent UnityEngine.Transform
---@field worldToLocalMatrix NotExportType
---@field localToWorldMatrix NotExportType
---@field root UnityEngine.Transform
---@field childCount number
---@field lossyScale UnityEngine.Vector3
---@field hasChanged boolean
---@field hierarchyCapacity number
---@field hierarchyCount number
local UnityEngine_Transform = {}
---@overload fun(p : UnityEngine.Transform)
---@param parent UnityEngine.Transform
---@param worldPositionStays boolean
function UnityEngine_Transform:SetParent(parent, worldPositionStays) end
---@param position UnityEngine.Vector3
---@param rotation UnityEngine.Quaternion
function UnityEngine_Transform:SetPositionAndRotation(position, rotation) end
---@overload fun(translation : UnityEngine.Vector3, relativeTo : UnityEngine.Space)
---@overload fun(translation : UnityEngine.Vector3)
---@overload fun(x : number, y : number, z : number, relativeTo : UnityEngine.Space)
---@overload fun(x : number, y : number, z : number)
---@overload fun(translation : UnityEngine.Vector3, relativeTo : UnityEngine.Transform)
---@param x number
---@param y number
---@param z number
---@param relativeTo UnityEngine.Transform
function UnityEngine_Transform:Translate(x, y, z, relativeTo) end
---@overload fun(eulers : UnityEngine.Vector3, relativeTo : UnityEngine.Space)
---@overload fun(eulers : UnityEngine.Vector3)
---@overload fun(xAngle : number, yAngle : number, zAngle : number, relativeTo : UnityEngine.Space)
---@overload fun(xAngle : number, yAngle : number, zAngle : number)
---@overload fun(axis : UnityEngine.Vector3, angle : number, relativeTo : UnityEngine.Space)
---@param axis UnityEngine.Vector3
---@param angle number
function UnityEngine_Transform:Rotate(axis, angle) end
---@param point UnityEngine.Vector3
---@param axis UnityEngine.Vector3
---@param angle number
function UnityEngine_Transform:RotateAround(point, axis, angle) end
---@overload fun(target : UnityEngine.Transform, worldUp : UnityEngine.Vector3)
---@overload fun(target : UnityEngine.Transform)
---@overload fun(worldPosition : UnityEngine.Vector3, worldUp : UnityEngine.Vector3)
---@param worldPosition UnityEngine.Vector3
function UnityEngine_Transform:LookAt(worldPosition) end
---@overload fun(direction : UnityEngine.Vector3) : UnityEngine.Vector3
---@param x number
---@param y number
---@param z number
---@return UnityEngine.Vector3
function UnityEngine_Transform:TransformDirection(x, y, z) end
---@overload fun(direction : UnityEngine.Vector3) : UnityEngine.Vector3
---@param x number
---@param y number
---@param z number
---@return UnityEngine.Vector3
function UnityEngine_Transform:InverseTransformDirection(x, y, z) end
---@overload fun(vector : UnityEngine.Vector3) : UnityEngine.Vector3
---@param x number
---@param y number
---@param z number
---@return UnityEngine.Vector3
function UnityEngine_Transform:TransformVector(x, y, z) end
---@overload fun(vector : UnityEngine.Vector3) : UnityEngine.Vector3
---@param x number
---@param y number
---@param z number
---@return UnityEngine.Vector3
function UnityEngine_Transform:InverseTransformVector(x, y, z) end
---@overload fun(position : UnityEngine.Vector3) : UnityEngine.Vector3
---@param x number
---@param y number
---@param z number
---@return UnityEngine.Vector3
function UnityEngine_Transform:TransformPoint(x, y, z) end
---@overload fun(position : UnityEngine.Vector3) : UnityEngine.Vector3
---@param x number
---@param y number
---@param z number
---@return UnityEngine.Vector3
function UnityEngine_Transform:InverseTransformPoint(x, y, z) end
function UnityEngine_Transform:DetachChildren() end
function UnityEngine_Transform:SetAsFirstSibling() end
function UnityEngine_Transform:SetAsLastSibling() end
---@param index number
function UnityEngine_Transform:SetSiblingIndex(index) end
---@return number
function UnityEngine_Transform:GetSiblingIndex() end
---@param n string
---@return UnityEngine.Transform
function UnityEngine_Transform:Find(n) end
---@param parent UnityEngine.Transform
---@return boolean
function UnityEngine_Transform:IsChildOf(parent) end
---@return NotExportType
function UnityEngine_Transform:GetEnumerator() end
---@param index number
---@return UnityEngine.Transform
function UnityEngine_Transform:GetChild(index) end

---@class UnityEngine.Material : UnityEngine.Object
---@field shader UnityEngine.Shader
---@field color UnityEngine.Color
---@field mainTexture UnityEngine.Texture
---@field mainTextureOffset UnityEngine.Vector2
---@field mainTextureScale UnityEngine.Vector2
---@field renderQueue number
---@field globalIlluminationFlags NotExportEnum
---@field doubleSidedGI boolean
---@field enableInstancing boolean
---@field passCount number
---@field shaderKeywords NotExportType
local UnityEngine_Material = {}
---@overload fun(shader : UnityEngine.Shader) : UnityEngine.Material
---@overload fun(source : UnityEngine.Material) : UnityEngine.Material
---@param contents string
---@return UnityEngine.Material
function UnityEngine_Material.New(contents) end
---@overload fun(nameID : number) : boolean
---@param name string
---@return boolean
function UnityEngine_Material:HasProperty(name) end
---@param keyword string
function UnityEngine_Material:EnableKeyword(keyword) end
---@param keyword string
function UnityEngine_Material:DisableKeyword(keyword) end
---@param keyword string
---@return boolean
function UnityEngine_Material:IsKeywordEnabled(keyword) end
---@param passName string
---@param enabled boolean
function UnityEngine_Material:SetShaderPassEnabled(passName, enabled) end
---@param passName string
---@return boolean
function UnityEngine_Material:GetShaderPassEnabled(passName) end
---@param pass number
---@return string
function UnityEngine_Material:GetPassName(pass) end
---@param passName string
---@return number
function UnityEngine_Material:FindPass(passName) end
---@param tag string
---@param val string
function UnityEngine_Material:SetOverrideTag(tag, val) end
---@overload fun(tag : string, searchFallbacks : boolean, defaultValue : string) : string
---@param tag string
---@param searchFallbacks boolean
---@return string
function UnityEngine_Material:GetTag(tag, searchFallbacks) end
---@param start UnityEngine.Material
---@param _end UnityEngine.Material
---@param t number
function UnityEngine_Material:Lerp(start, _end, t) end
---@param pass number
---@return boolean
function UnityEngine_Material:SetPass(pass) end
---@param mat UnityEngine.Material
function UnityEngine_Material:CopyPropertiesFromMaterial(mat) end
---@overload fun() : NotExportType
---@param outNames NotExportType
function UnityEngine_Material:GetTexturePropertyNames(outNames) end
---@overload fun() : NotExportType
---@param outNames NotExportType
function UnityEngine_Material:GetTexturePropertyNameIDs(outNames) end
---@overload fun(name : string, value : number)
---@param nameID number
---@param value number
function UnityEngine_Material:SetFloat(nameID, value) end
---@overload fun(name : string, value : number)
---@param nameID number
---@param value number
function UnityEngine_Material:SetInt(nameID, value) end
---@overload fun(name : string, value : UnityEngine.Color)
---@param nameID number
---@param value UnityEngine.Color
function UnityEngine_Material:SetColor(nameID, value) end
---@overload fun(name : string, value : NotExportType)
---@param nameID number
---@param value NotExportType
function UnityEngine_Material:SetVector(nameID, value) end
---@overload fun(name : string, value : NotExportType)
---@param nameID number
---@param value NotExportType
function UnityEngine_Material:SetMatrix(nameID, value) end
---@overload fun(name : string, value : UnityEngine.Texture)
---@param nameID number
---@param value UnityEngine.Texture
function UnityEngine_Material:SetTexture(nameID, value) end
---@overload fun(name : string, value : NotExportType)
---@param nameID number
---@param value NotExportType
function UnityEngine_Material:SetBuffer(nameID, value) end
---@overload fun(name : string, values : NotExportType)
---@overload fun(nameID : number, values : NotExportType)
---@overload fun(name : string, values : NotExportType)
---@param nameID number
---@param values NotExportType
function UnityEngine_Material:SetFloatArray(nameID, values) end
---@overload fun(name : string, values : NotExportType)
---@overload fun(nameID : number, values : NotExportType)
---@overload fun(name : string, values : NotExportType)
---@param nameID number
---@param values NotExportType
function UnityEngine_Material:SetColorArray(nameID, values) end
---@overload fun(name : string, values : NotExportType)
---@overload fun(nameID : number, values : NotExportType)
---@overload fun(name : string, values : NotExportType)
---@param nameID number
---@param values NotExportType
function UnityEngine_Material:SetVectorArray(nameID, values) end
---@overload fun(name : string, values : NotExportType)
---@overload fun(nameID : number, values : NotExportType)
---@overload fun(name : string, values : NotExportType)
---@param nameID number
---@param values NotExportType
function UnityEngine_Material:SetMatrixArray(nameID, values) end
---@overload fun(name : string) : number
---@param nameID number
---@return number
function UnityEngine_Material:GetFloat(nameID) end
---@overload fun(name : string) : number
---@param nameID number
---@return number
function UnityEngine_Material:GetInt(nameID) end
---@overload fun(name : string) : UnityEngine.Color
---@param nameID number
---@return UnityEngine.Color
function UnityEngine_Material:GetColor(nameID) end
---@overload fun(name : string) : NotExportType
---@param nameID number
---@return NotExportType
function UnityEngine_Material:GetVector(nameID) end
---@overload fun(name : string) : NotExportType
---@param nameID number
---@return NotExportType
function UnityEngine_Material:GetMatrix(nameID) end
---@overload fun(name : string) : UnityEngine.Texture
---@param nameID number
---@return UnityEngine.Texture
function UnityEngine_Material:GetTexture(nameID) end
---@overload fun(name : string) : NotExportType
---@overload fun(nameID : number) : NotExportType
---@overload fun(name : string, values : NotExportType)
---@param nameID number
---@param values NotExportType
function UnityEngine_Material:GetFloatArray(nameID, values) end
---@overload fun(name : string) : NotExportType
---@overload fun(nameID : number) : NotExportType
---@overload fun(name : string, values : NotExportType)
---@param nameID number
---@param values NotExportType
function UnityEngine_Material:GetColorArray(nameID, values) end
---@overload fun(name : string) : NotExportType
---@overload fun(nameID : number) : NotExportType
---@overload fun(name : string, values : NotExportType)
---@param nameID number
---@param values NotExportType
function UnityEngine_Material:GetVectorArray(nameID, values) end
---@overload fun(name : string) : NotExportType
---@overload fun(nameID : number) : NotExportType
---@overload fun(name : string, values : NotExportType)
---@param nameID number
---@param values NotExportType
function UnityEngine_Material:GetMatrixArray(nameID, values) end
---@overload fun(name : string, value : UnityEngine.Vector2)
---@param nameID number
---@param value UnityEngine.Vector2
function UnityEngine_Material:SetTextureOffset(nameID, value) end
---@overload fun(name : string, value : UnityEngine.Vector2)
---@param nameID number
---@param value UnityEngine.Vector2
function UnityEngine_Material:SetTextureScale(nameID, value) end
---@overload fun(name : string) : UnityEngine.Vector2
---@param nameID number
---@return UnityEngine.Vector2
function UnityEngine_Material:GetTextureOffset(nameID) end
---@overload fun(name : string) : UnityEngine.Vector2
---@param nameID number
---@return UnityEngine.Vector2
function UnityEngine_Material:GetTextureScale(nameID) end

---@class UnityEngine.Light : UnityEngine.Behaviour
---@field type UnityEngine.LightType
---@field spotAngle number
---@field color UnityEngine.Color
---@field colorTemperature number
---@field intensity number
---@field bounceIntensity number
---@field shadowCustomResolution number
---@field shadowBias number
---@field shadowNormalBias number
---@field shadowNearPlane number
---@field range number
---@field flare NotExportType
---@field bakingOutput NotExportType
---@field cullingMask number
---@field lightShadowCasterMode NotExportEnum
---@field shadowRadius number
---@field shadowAngle number
---@field shadows NotExportEnum
---@field shadowStrength number
---@field shadowResolution NotExportEnum
---@field layerShadowCullDistances NotExportType
---@field cookieSize number
---@field cookie UnityEngine.Texture
---@field renderMode NotExportEnum
---@field areaSize UnityEngine.Vector2
---@field lightmapBakeType NotExportEnum
---@field commandBufferCount number
local UnityEngine_Light = {}
---@return UnityEngine.Light
function UnityEngine_Light.New() end
---@param type UnityEngine.LightType
---@param layer number
---@return NotExportType
function UnityEngine_Light.GetLights(type, layer) end
function UnityEngine_Light:Reset() end
function UnityEngine_Light:SetLightDirty() end
---@overload fun(evt : NotExportEnum, buffer : NotExportType)
---@param evt NotExportEnum
---@param buffer NotExportType
---@param shadowPassMask NotExportEnum
function UnityEngine_Light:AddCommandBuffer(evt, buffer, shadowPassMask) end
---@overload fun(evt : NotExportEnum, buffer : NotExportType, queueType : NotExportEnum)
---@param evt NotExportEnum
---@param buffer NotExportType
---@param shadowPassMask NotExportEnum
---@param queueType NotExportEnum
function UnityEngine_Light:AddCommandBufferAsync(evt, buffer, shadowPassMask, queueType) end
---@param evt NotExportEnum
---@param buffer NotExportType
function UnityEngine_Light:RemoveCommandBuffer(evt, buffer) end
---@param evt NotExportEnum
function UnityEngine_Light:RemoveCommandBuffers(evt) end
function UnityEngine_Light:RemoveAllCommandBuffers() end
---@param evt NotExportEnum
---@return NotExportType
function UnityEngine_Light:GetCommandBuffers(evt) end

---@class UnityEngine.Behaviour : UnityEngine.Component
---@field enabled boolean
---@field isActiveAndEnabled boolean
local UnityEngine_Behaviour = {}
---@return UnityEngine.Behaviour
function UnityEngine_Behaviour.New() end

---@class UnityEngine.Rigidbody : UnityEngine.Component
---@field velocity UnityEngine.Vector3
---@field angularVelocity UnityEngine.Vector3
---@field drag number
---@field angularDrag number
---@field mass number
---@field useGravity boolean
---@field maxDepenetrationVelocity number
---@field isKinematic boolean
---@field freezeRotation boolean
---@field constraints NotExportEnum
---@field collisionDetectionMode NotExportEnum
---@field centerOfMass UnityEngine.Vector3
---@field worldCenterOfMass UnityEngine.Vector3
---@field inertiaTensorRotation UnityEngine.Quaternion
---@field inertiaTensor UnityEngine.Vector3
---@field detectCollisions boolean
---@field position UnityEngine.Vector3
---@field rotation UnityEngine.Quaternion
---@field interpolation NotExportEnum
---@field solverIterations number
---@field sleepThreshold number
---@field maxAngularVelocity number
---@field solverVelocityIterations number
local UnityEngine_Rigidbody = {}
---@return UnityEngine.Rigidbody
function UnityEngine_Rigidbody.New() end
---@param density number
function UnityEngine_Rigidbody:SetDensity(density) end
---@param position UnityEngine.Vector3
function UnityEngine_Rigidbody:MovePosition(position) end
---@param rot UnityEngine.Quaternion
function UnityEngine_Rigidbody:MoveRotation(rot) end
function UnityEngine_Rigidbody:Sleep() end
---@return boolean
function UnityEngine_Rigidbody:IsSleeping() end
function UnityEngine_Rigidbody:WakeUp() end
function UnityEngine_Rigidbody:ResetCenterOfMass() end
function UnityEngine_Rigidbody:ResetInertiaTensor() end
---@param relativePoint UnityEngine.Vector3
---@return UnityEngine.Vector3
function UnityEngine_Rigidbody:GetRelativePointVelocity(relativePoint) end
---@param worldPoint UnityEngine.Vector3
---@return UnityEngine.Vector3
function UnityEngine_Rigidbody:GetPointVelocity(worldPoint) end
---@overload fun(force : UnityEngine.Vector3, mode : NotExportEnum)
---@overload fun(force : UnityEngine.Vector3)
---@overload fun(x : number, y : number, z : number, mode : NotExportEnum)
---@param x number
---@param y number
---@param z number
function UnityEngine_Rigidbody:AddForce(x, y, z) end
---@overload fun(force : UnityEngine.Vector3, mode : NotExportEnum)
---@overload fun(force : UnityEngine.Vector3)
---@overload fun(x : number, y : number, z : number, mode : NotExportEnum)
---@param x number
---@param y number
---@param z number
function UnityEngine_Rigidbody:AddRelativeForce(x, y, z) end
---@overload fun(torque : UnityEngine.Vector3, mode : NotExportEnum)
---@overload fun(torque : UnityEngine.Vector3)
---@overload fun(x : number, y : number, z : number, mode : NotExportEnum)
---@param x number
---@param y number
---@param z number
function UnityEngine_Rigidbody:AddTorque(x, y, z) end
---@overload fun(torque : UnityEngine.Vector3, mode : NotExportEnum)
---@overload fun(torque : UnityEngine.Vector3)
---@overload fun(x : number, y : number, z : number, mode : NotExportEnum)
---@param x number
---@param y number
---@param z number
function UnityEngine_Rigidbody:AddRelativeTorque(x, y, z) end
---@overload fun(force : UnityEngine.Vector3, position : UnityEngine.Vector3, mode : NotExportEnum)
---@param force UnityEngine.Vector3
---@param position UnityEngine.Vector3
function UnityEngine_Rigidbody:AddForceAtPosition(force, position) end
---@overload fun(explosionForce : number, explosionPosition : UnityEngine.Vector3, explosionRadius : number, upwardsModifier : number, mode : NotExportEnum)
---@overload fun(explosionForce : number, explosionPosition : UnityEngine.Vector3, explosionRadius : number, upwardsModifier : number)
---@param explosionForce number
---@param explosionPosition UnityEngine.Vector3
---@param explosionRadius number
function UnityEngine_Rigidbody:AddExplosionForce(explosionForce, explosionPosition, explosionRadius) end
---@param position UnityEngine.Vector3
---@return UnityEngine.Vector3
function UnityEngine_Rigidbody:ClosestPointOnBounds(position) end
---@overload fun(direction : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit, maxDistance : number, queryTriggerInteraction : NotExportEnum) : boolean, UnityEngine.RaycastHit
---@overload fun(direction : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit, maxDistance : number) : boolean, UnityEngine.RaycastHit
---@param direction UnityEngine.Vector3
---@param out_hitInfo UnityEngine.RaycastHit
---@return boolean,UnityEngine.RaycastHit
function UnityEngine_Rigidbody:SweepTest(direction, out_hitInfo) end
---@overload fun(direction : UnityEngine.Vector3, maxDistance : number, queryTriggerInteraction : NotExportEnum) : NotExportType
---@overload fun(direction : UnityEngine.Vector3, maxDistance : number) : NotExportType
---@param direction UnityEngine.Vector3
---@return NotExportType
function UnityEngine_Rigidbody:SweepTestAll(direction) end

---@class UnityEngine.Camera : UnityEngine.Behaviour
---@field onPreCull NotExportType
---@field onPreRender NotExportType
---@field onPostRender NotExportType
---@field main UnityEngine.Camera
---@field current UnityEngine.Camera
---@field allCamerasCount number
---@field allCameras NotExportType
---@field nearClipPlane number
---@field farClipPlane number
---@field fieldOfView number
---@field renderingPath NotExportEnum
---@field actualRenderingPath NotExportEnum
---@field allowHDR boolean
---@field allowMSAA boolean
---@field allowDynamicResolution boolean
---@field forceIntoRenderTexture boolean
---@field orthographicSize number
---@field orthographic boolean
---@field opaqueSortMode NotExportEnum
---@field transparencySortMode NotExportEnum
---@field transparencySortAxis UnityEngine.Vector3
---@field depth number
---@field aspect number
---@field velocity UnityEngine.Vector3
---@field cullingMask number
---@field eventMask number
---@field layerCullSpherical boolean
---@field cameraType NotExportEnum
---@field layerCullDistances NotExportType
---@field useOcclusionCulling boolean
---@field cullingMatrix NotExportType
---@field backgroundColor UnityEngine.Color
---@field clearFlags UnityEngine.CameraClearFlags
---@field depthTextureMode NotExportEnum
---@field clearStencilAfterLightingPass boolean
---@field usePhysicalProperties boolean
---@field sensorSize UnityEngine.Vector2
---@field lensShift UnityEngine.Vector2
---@field focalLength number
---@field gateFit NotExportEnum
---@field rect NotExportType
---@field pixelRect NotExportType
---@field pixelWidth number
---@field pixelHeight number
---@field scaledPixelWidth number
---@field scaledPixelHeight number
---@field targetTexture UnityEngine.RenderTexture
---@field activeTexture UnityEngine.RenderTexture
---@field targetDisplay number
---@field cameraToWorldMatrix NotExportType
---@field worldToCameraMatrix NotExportType
---@field projectionMatrix NotExportType
---@field nonJitteredProjectionMatrix NotExportType
---@field useJitteredProjectionMatrixForTransparentRendering boolean
---@field previousViewProjectionMatrix NotExportType
---@field scene NotExportType
---@field stereoEnabled boolean
---@field stereoSeparation number
---@field stereoConvergence number
---@field areVRStereoViewMatricesWithinSingleCullTolerance boolean
---@field stereoTargetEye NotExportEnum
---@field stereoActiveEye NotExportEnum
---@field commandBufferCount number
local UnityEngine_Camera = {}
---@return UnityEngine.Camera
function UnityEngine_Camera.New() end
---@param out_output NotExportType
---@param focalLength number
---@param sensorSize UnityEngine.Vector2
---@param lensShift UnityEngine.Vector2
---@param nearClip number
---@param farClip number
---@param gateFitParameters NotExportType
---@return ,NotExportType
function UnityEngine_Camera.CalculateProjectionMatrixFromPhysicalProperties(out_output, focalLength, sensorSize, lensShift, nearClip, farClip, gateFitParameters) end
---@param focalLength number
---@param sensorSize number
---@return number
function UnityEngine_Camera.FocalLengthToFOV(focalLength, sensorSize) end
---@param fov number
---@param sensorSize number
---@return number
function UnityEngine_Camera.FOVToFocalLength(fov, sensorSize) end
---@param cameras NotExportType
---@return number
function UnityEngine_Camera.GetAllCameras(cameras) end
---@param cur UnityEngine.Camera
function UnityEngine_Camera.SetupCurrent(cur) end
function UnityEngine_Camera:Reset() end
function UnityEngine_Camera:ResetTransparencySortSettings() end
function UnityEngine_Camera:ResetAspect() end
function UnityEngine_Camera:ResetCullingMatrix() end
---@param shader UnityEngine.Shader
---@param replacementTag string
function UnityEngine_Camera:SetReplacementShader(shader, replacementTag) end
function UnityEngine_Camera:ResetReplacementShader() end
---@overload fun(colorBuffer : NotExportType, depthBuffer : NotExportType)
---@param colorBuffer NotExportType
---@param depthBuffer NotExportType
function UnityEngine_Camera:SetTargetBuffers(colorBuffer, depthBuffer) end
function UnityEngine_Camera:ResetWorldToCameraMatrix() end
function UnityEngine_Camera:ResetProjectionMatrix() end
---@param clipPlane NotExportType
---@return NotExportType
function UnityEngine_Camera:CalculateObliqueMatrix(clipPlane) end
---@overload fun(position : UnityEngine.Vector3, eye : NotExportEnum) : UnityEngine.Vector3
---@param position UnityEngine.Vector3
---@return UnityEngine.Vector3
function UnityEngine_Camera:WorldToScreenPoint(position) end
---@overload fun(position : UnityEngine.Vector3, eye : NotExportEnum) : UnityEngine.Vector3
---@param position UnityEngine.Vector3
---@return UnityEngine.Vector3
function UnityEngine_Camera:WorldToViewportPoint(position) end
---@overload fun(position : UnityEngine.Vector3, eye : NotExportEnum) : UnityEngine.Vector3
---@param position UnityEngine.Vector3
---@return UnityEngine.Vector3
function UnityEngine_Camera:ViewportToWorldPoint(position) end
---@overload fun(position : UnityEngine.Vector3, eye : NotExportEnum) : UnityEngine.Vector3
---@param position UnityEngine.Vector3
---@return UnityEngine.Vector3
function UnityEngine_Camera:ScreenToWorldPoint(position) end
---@param position UnityEngine.Vector3
---@return UnityEngine.Vector3
function UnityEngine_Camera:ScreenToViewportPoint(position) end
---@param position UnityEngine.Vector3
---@return UnityEngine.Vector3
function UnityEngine_Camera:ViewportToScreenPoint(position) end
---@overload fun(pos : UnityEngine.Vector3, eye : NotExportEnum) : UnityEngine.Ray
---@param pos UnityEngine.Vector3
---@return UnityEngine.Ray
function UnityEngine_Camera:ViewportPointToRay(pos) end
---@overload fun(pos : UnityEngine.Vector3, eye : NotExportEnum) : UnityEngine.Ray
---@param pos UnityEngine.Vector3
---@return UnityEngine.Ray
function UnityEngine_Camera:ScreenPointToRay(pos) end
---@param viewport NotExportType
---@param z number
---@param eye NotExportEnum
---@param outCorners NotExportType
function UnityEngine_Camera:CalculateFrustumCorners(viewport, z, eye, outCorners) end
---@param eye NotExportEnum
---@return NotExportType
function UnityEngine_Camera:GetStereoNonJitteredProjectionMatrix(eye) end
---@param eye NotExportEnum
---@return NotExportType
function UnityEngine_Camera:GetStereoViewMatrix(eye) end
---@param eye NotExportEnum
function UnityEngine_Camera:CopyStereoDeviceProjectionMatrixToNonJittered(eye) end
---@param eye NotExportEnum
---@return NotExportType
function UnityEngine_Camera:GetStereoProjectionMatrix(eye) end
---@param eye NotExportEnum
---@param matrix NotExportType
function UnityEngine_Camera:SetStereoProjectionMatrix(eye, matrix) end
function UnityEngine_Camera:ResetStereoProjectionMatrices() end
---@param eye NotExportEnum
---@param matrix NotExportType
function UnityEngine_Camera:SetStereoViewMatrix(eye, matrix) end
function UnityEngine_Camera:ResetStereoViewMatrices() end
---@overload fun(cubemap : NotExportType, faceMask : number) : boolean
---@overload fun(cubemap : NotExportType) : boolean
---@overload fun(cubemap : UnityEngine.RenderTexture, faceMask : number) : boolean
---@overload fun(cubemap : UnityEngine.RenderTexture) : boolean
---@param cubemap UnityEngine.RenderTexture
---@param faceMask number
---@param stereoEye NotExportEnum
---@return boolean
function UnityEngine_Camera:RenderToCubemap(cubemap, faceMask, stereoEye) end
function UnityEngine_Camera:Render() end
---@param shader UnityEngine.Shader
---@param replacementTag string
function UnityEngine_Camera:RenderWithShader(shader, replacementTag) end
function UnityEngine_Camera:RenderDontRestore() end
---@param other UnityEngine.Camera
function UnityEngine_Camera:CopyFrom(other) end
---@param evt NotExportEnum
function UnityEngine_Camera:RemoveCommandBuffers(evt) end
function UnityEngine_Camera:RemoveAllCommandBuffers() end
---@param evt NotExportEnum
---@param buffer NotExportType
function UnityEngine_Camera:AddCommandBuffer(evt, buffer) end
---@param evt NotExportEnum
---@param buffer NotExportType
---@param queueType NotExportEnum
function UnityEngine_Camera:AddCommandBufferAsync(evt, buffer, queueType) end
---@param evt NotExportEnum
---@param buffer NotExportType
function UnityEngine_Camera:RemoveCommandBuffer(evt, buffer) end
---@param evt NotExportEnum
---@return NotExportType
function UnityEngine_Camera:GetCommandBuffers(evt) end

---@class UnityEngine.AudioSource : UnityEngine.AudioBehaviour
---@field volume number
---@field pitch number
---@field time number
---@field timeSamples number
---@field clip UnityEngine.AudioClip
---@field outputAudioMixerGroup NotExportType
---@field isPlaying boolean
---@field isVirtual boolean
---@field loop boolean
---@field ignoreListenerVolume boolean
---@field playOnAwake boolean
---@field ignoreListenerPause boolean
---@field velocityUpdateMode NotExportEnum
---@field panStereo number
---@field spatialBlend number
---@field spatialize boolean
---@field spatializePostEffects boolean
---@field reverbZoneMix number
---@field bypassEffects boolean
---@field bypassListenerEffects boolean
---@field bypassReverbZones boolean
---@field dopplerLevel number
---@field spread number
---@field priority number
---@field mute boolean
---@field minDistance number
---@field maxDistance number
---@field rolloffMode NotExportEnum
local UnityEngine_AudioSource = {}
---@return UnityEngine.AudioSource
function UnityEngine_AudioSource.New() end
---@overload fun(clip : UnityEngine.AudioClip, position : UnityEngine.Vector3)
---@param clip UnityEngine.AudioClip
---@param position UnityEngine.Vector3
---@param volume number
function UnityEngine_AudioSource.PlayClipAtPoint(clip, position, volume) end
---@overload fun(delay : number)
function UnityEngine_AudioSource:Play() end
---@param delay number
function UnityEngine_AudioSource:PlayDelayed(delay) end
---@param time number
function UnityEngine_AudioSource:PlayScheduled(time) end
---@param time number
function UnityEngine_AudioSource:SetScheduledStartTime(time) end
---@param time number
function UnityEngine_AudioSource:SetScheduledEndTime(time) end
function UnityEngine_AudioSource:Stop() end
function UnityEngine_AudioSource:Pause() end
function UnityEngine_AudioSource:UnPause() end
---@overload fun(clip : UnityEngine.AudioClip)
---@param clip UnityEngine.AudioClip
---@param volumeScale number
function UnityEngine_AudioSource:PlayOneShot(clip, volumeScale) end
---@param type NotExportEnum
---@param curve NotExportType
function UnityEngine_AudioSource:SetCustomCurve(type, curve) end
---@param type NotExportEnum
---@return NotExportType
function UnityEngine_AudioSource:GetCustomCurve(type) end
---@param samples NotExportType
---@param channel number
function UnityEngine_AudioSource:GetOutputData(samples, channel) end
---@param samples NotExportType
---@param channel number
---@param window NotExportEnum
function UnityEngine_AudioSource:GetSpectrumData(samples, channel, window) end
---@param index number
---@param value number
---@return boolean
function UnityEngine_AudioSource:SetSpatializerFloat(index, value) end
---@param index number
---@param out_value number
---@return boolean,number
function UnityEngine_AudioSource:GetSpatializerFloat(index, out_value) end
---@param index number
---@param value number
---@return boolean
function UnityEngine_AudioSource:SetAmbisonicDecoderFloat(index, value) end
---@param index number
---@param out_value number
---@return boolean,number
function UnityEngine_AudioSource:GetAmbisonicDecoderFloat(index, out_value) end

---@class UnityEngine.AudioBehaviour : UnityEngine.Behaviour
local UnityEngine_AudioBehaviour = {}
---@return UnityEngine.AudioBehaviour
function UnityEngine_AudioBehaviour.New() end

---@class UnityEngine.MonoBehaviour : UnityEngine.Behaviour
---@field useGUILayout boolean
---@field runInEditMode boolean
local UnityEngine_MonoBehaviour = {}
---@param message System.Object
function UnityEngine_MonoBehaviour.print(message) end
---@overload fun() : boolean
---@param methodName string
---@return boolean
function UnityEngine_MonoBehaviour:IsInvoking(methodName) end
---@overload fun()
---@param methodName string
function UnityEngine_MonoBehaviour:CancelInvoke(methodName) end
---@param methodName string
---@param time number
function UnityEngine_MonoBehaviour:Invoke(methodName, time) end
---@param methodName string
---@param time number
---@param repeatRate number
function UnityEngine_MonoBehaviour:InvokeRepeating(methodName, time, repeatRate) end
---@overload fun(methodName : string) : NotExportType
---@overload fun(methodName : string, value : System.Object) : NotExportType
---@param routine NotExportType
---@return NotExportType
function UnityEngine_MonoBehaviour:StartCoroutine(routine) end
---@overload fun(routine : NotExportType)
---@overload fun(routine : NotExportType)
---@param methodName string
function UnityEngine_MonoBehaviour:StopCoroutine(methodName) end
function UnityEngine_MonoBehaviour:StopAllCoroutines() end

---@class UnityEngine.GameObject : UnityEngine.Object
---@field transform UnityEngine.Transform
---@field layer number
---@field activeSelf boolean
---@field activeInHierarchy boolean
---@field isStatic boolean
---@field tag string
---@field scene NotExportType
---@field gameObject UnityEngine.GameObject
local UnityEngine_GameObject = {}
---@overload fun(name : string) : UnityEngine.GameObject
---@overload fun() : UnityEngine.GameObject
---@param name string
---@param components NotExportType
---@return UnityEngine.GameObject
function UnityEngine_GameObject.New(name, components) end
---@param type NotExportEnum
---@return UnityEngine.GameObject
function UnityEngine_GameObject.CreatePrimitive(type) end
---@param tag string
---@return UnityEngine.GameObject
function UnityEngine_GameObject.FindWithTag(tag) end
---@param tag string
---@return UnityEngine.GameObject
function UnityEngine_GameObject.FindGameObjectWithTag(tag) end
---@param tag string
---@return NotExportType
function UnityEngine_GameObject.FindGameObjectsWithTag(tag) end
---@param name string
---@return UnityEngine.GameObject
function UnityEngine_GameObject.Find(name) end
---@overload fun(type : NotExportType) : UnityEngine.Component
---@param type string
---@return UnityEngine.Component
function UnityEngine_GameObject:GetComponent(type) end
---@overload fun(type : NotExportType, includeInactive : boolean) : UnityEngine.Component
---@param type NotExportType
---@return UnityEngine.Component
function UnityEngine_GameObject:GetComponentInChildren(type) end
---@param type NotExportType
---@return UnityEngine.Component
function UnityEngine_GameObject:GetComponentInParent(type) end
---@overload fun(type : NotExportType) : NotExportType
---@param type NotExportType
---@param results NotExportType
function UnityEngine_GameObject:GetComponents(type, results) end
---@overload fun(type : NotExportType) : NotExportType
---@param type NotExportType
---@param includeInactive boolean
---@return NotExportType
function UnityEngine_GameObject:GetComponentsInChildren(type, includeInactive) end
---@overload fun(type : NotExportType) : NotExportType
---@param type NotExportType
---@param includeInactive boolean
---@return NotExportType
function UnityEngine_GameObject:GetComponentsInParent(type, includeInactive) end
---@overload fun(methodName : string, options : NotExportEnum)
---@overload fun(methodName : string, value : System.Object, options : NotExportEnum)
---@overload fun(methodName : string, value : System.Object)
---@param methodName string
function UnityEngine_GameObject:SendMessageUpwards(methodName) end
---@overload fun(methodName : string, options : NotExportEnum)
---@overload fun(methodName : string, value : System.Object, options : NotExportEnum)
---@overload fun(methodName : string, value : System.Object)
---@param methodName string
function UnityEngine_GameObject:SendMessage(methodName) end
---@overload fun(methodName : string, options : NotExportEnum)
---@overload fun(methodName : string, parameter : System.Object, options : NotExportEnum)
---@overload fun(methodName : string, parameter : System.Object)
---@param methodName string
function UnityEngine_GameObject:BroadcastMessage(methodName) end
---@param componentType NotExportType
---@return UnityEngine.Component
function UnityEngine_GameObject:AddComponent(componentType) end
---@param value boolean
function UnityEngine_GameObject:SetActive(value) end
---@param tag string
---@return boolean
function UnityEngine_GameObject:CompareTag(tag) end

---@class UnityEngine.TrackedReference : System.Object
local UnityEngine_TrackedReference = {}
---@param o System.Object
---@return boolean
function UnityEngine_TrackedReference:Equals(o) end
---@return number
function UnityEngine_TrackedReference:GetHashCode() end

---@class UnityEngine.Application : System.Object
---@field isPlaying boolean
---@field isFocused boolean
---@field platform NotExportEnum
---@field buildGUID string
---@field isMobilePlatform boolean
---@field isConsolePlatform boolean
---@field runInBackground boolean
---@field isBatchMode boolean
---@field dataPath string
---@field streamingAssetsPath string
---@field persistentDataPath string
---@field temporaryCachePath string
---@field absoluteURL string
---@field unityVersion string
---@field version string
---@field installerName string
---@field identifier string
---@field installMode NotExportEnum
---@field sandboxType NotExportEnum
---@field productName string
---@field companyName string
---@field cloudProjectId string
---@field targetFrameRate number
---@field systemLanguage NotExportEnum
---@field consoleLogPath string
---@field backgroundLoadingPriority NotExportEnum
---@field internetReachability NotExportEnum
---@field genuine boolean
---@field genuineCheckAvailable boolean
---@field isEditor boolean
local UnityEngine_Application = {}
---@return UnityEngine.Application
function UnityEngine_Application.New() end
---@overload fun(exitCode : number)
function UnityEngine_Application.Quit() end
function UnityEngine_Application.Unload() end
---@overload fun(levelIndex : number) : boolean
---@param levelName string
---@return boolean
function UnityEngine_Application.CanStreamedLevelBeLoaded(levelName) end
---@param obj UnityEngine.Object
---@return boolean
function UnityEngine_Application.IsPlaying(obj) end
---@return NotExportType
function UnityEngine_Application.GetBuildTags() end
---@param buildTags NotExportType
function UnityEngine_Application.SetBuildTags(buildTags) end
---@return boolean
function UnityEngine_Application.HasProLicense() end
---@param delegateMethod NotExportType
---@return boolean
function UnityEngine_Application.RequestAdvertisingIdentifierAsync(delegateMethod) end
---@param url string
function UnityEngine_Application.OpenURL(url) end
---@param logType NotExportEnum
---@return NotExportEnum
function UnityEngine_Application.GetStackTraceLogType(logType) end
---@param logType NotExportEnum
---@param stackTraceType NotExportEnum
function UnityEngine_Application.SetStackTraceLogType(logType, stackTraceType) end
---@param mode NotExportEnum
---@return UnityEngine.AsyncOperation
function UnityEngine_Application.RequestUserAuthorization(mode) end
---@param mode NotExportEnum
---@return boolean
function UnityEngine_Application.HasUserAuthorization(mode) end

---@class UnityEngine.Physics : System.Object
---@field IgnoreRaycastLayer number
---@field DefaultRaycastLayers number
---@field AllLayers number
---@field gravity UnityEngine.Vector3
---@field defaultContactOffset number
---@field sleepThreshold number
---@field queriesHitTriggers boolean
---@field queriesHitBackfaces boolean
---@field bounceThreshold number
---@field defaultSolverIterations number
---@field defaultSolverVelocityIterations number
---@field defaultPhysicsScene NotExportType
---@field autoSimulation boolean
---@field autoSyncTransforms boolean
---@field reuseCollisionCallbacks boolean
---@field interCollisionDistance number
---@field interCollisionStiffness number
---@field interCollisionSettingsToggle boolean
local UnityEngine_Physics = {}
---@return UnityEngine.Physics
function UnityEngine_Physics.New() end
---@overload fun(collider1 : UnityEngine.Collider, collider2 : UnityEngine.Collider, ignore : boolean)
---@param collider1 UnityEngine.Collider
---@param collider2 UnityEngine.Collider
function UnityEngine_Physics.IgnoreCollision(collider1, collider2) end
---@overload fun(layer1 : number, layer2 : number, ignore : boolean)
---@param layer1 number
---@param layer2 number
function UnityEngine_Physics.IgnoreLayerCollision(layer1, layer2) end
---@param layer1 number
---@param layer2 number
---@return boolean
function UnityEngine_Physics.GetIgnoreLayerCollision(layer1, layer2) end
---@overload fun(origin : UnityEngine.Vector3, direction : UnityEngine.Vector3, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : boolean
---@overload fun(origin : UnityEngine.Vector3, direction : UnityEngine.Vector3, maxDistance : number, layerMask : number) : boolean
---@overload fun(origin : UnityEngine.Vector3, direction : UnityEngine.Vector3, maxDistance : number) : boolean
---@overload fun(origin : UnityEngine.Vector3, direction : UnityEngine.Vector3) : boolean
---@overload fun(origin : UnityEngine.Vector3, direction : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : boolean, UnityEngine.RaycastHit
---@overload fun(origin : UnityEngine.Vector3, direction : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit, maxDistance : number, layerMask : number) : boolean, UnityEngine.RaycastHit
---@overload fun(origin : UnityEngine.Vector3, direction : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit, maxDistance : number) : boolean, UnityEngine.RaycastHit
---@overload fun(origin : UnityEngine.Vector3, direction : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit) : boolean, UnityEngine.RaycastHit
---@overload fun(ray : UnityEngine.Ray, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : boolean
---@overload fun(ray : UnityEngine.Ray, maxDistance : number, layerMask : number) : boolean
---@overload fun(ray : UnityEngine.Ray, maxDistance : number) : boolean
---@overload fun(ray : UnityEngine.Ray) : boolean
---@overload fun(ray : UnityEngine.Ray, out_hitInfo : UnityEngine.RaycastHit, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : boolean, UnityEngine.RaycastHit
---@overload fun(ray : UnityEngine.Ray, out_hitInfo : UnityEngine.RaycastHit, maxDistance : number, layerMask : number) : boolean, UnityEngine.RaycastHit
---@overload fun(ray : UnityEngine.Ray, out_hitInfo : UnityEngine.RaycastHit, maxDistance : number) : boolean, UnityEngine.RaycastHit
---@param ray UnityEngine.Ray
---@param out_hitInfo UnityEngine.RaycastHit
---@return boolean,UnityEngine.RaycastHit
function UnityEngine_Physics.Raycast(ray, out_hitInfo) end
---@overload fun(start : UnityEngine.Vector3, _end : UnityEngine.Vector3, layerMask : number, queryTriggerInteraction : NotExportEnum) : boolean
---@overload fun(start : UnityEngine.Vector3, _end : UnityEngine.Vector3, layerMask : number) : boolean
---@overload fun(start : UnityEngine.Vector3, _end : UnityEngine.Vector3) : boolean
---@overload fun(start : UnityEngine.Vector3, _end : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit, layerMask : number, queryTriggerInteraction : NotExportEnum) : boolean, UnityEngine.RaycastHit
---@overload fun(start : UnityEngine.Vector3, _end : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit, layerMask : number) : boolean, UnityEngine.RaycastHit
---@param start UnityEngine.Vector3
---@param _end UnityEngine.Vector3
---@param out_hitInfo UnityEngine.RaycastHit
---@return boolean,UnityEngine.RaycastHit
function UnityEngine_Physics.Linecast(start, _end, out_hitInfo) end
---@overload fun(point1 : UnityEngine.Vector3, point2 : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : boolean
---@overload fun(point1 : UnityEngine.Vector3, point2 : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, maxDistance : number, layerMask : number) : boolean
---@overload fun(point1 : UnityEngine.Vector3, point2 : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, maxDistance : number) : boolean
---@overload fun(point1 : UnityEngine.Vector3, point2 : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3) : boolean
---@overload fun(point1 : UnityEngine.Vector3, point2 : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : boolean, UnityEngine.RaycastHit
---@overload fun(point1 : UnityEngine.Vector3, point2 : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit, maxDistance : number, layerMask : number) : boolean, UnityEngine.RaycastHit
---@overload fun(point1 : UnityEngine.Vector3, point2 : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit, maxDistance : number) : boolean, UnityEngine.RaycastHit
---@param point1 UnityEngine.Vector3
---@param point2 UnityEngine.Vector3
---@param radius number
---@param direction UnityEngine.Vector3
---@param out_hitInfo UnityEngine.RaycastHit
---@return boolean,UnityEngine.RaycastHit
function UnityEngine_Physics.CapsuleCast(point1, point2, radius, direction, out_hitInfo) end
---@overload fun(origin : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : boolean, UnityEngine.RaycastHit
---@overload fun(origin : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit, maxDistance : number, layerMask : number) : boolean, UnityEngine.RaycastHit
---@overload fun(origin : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit, maxDistance : number) : boolean, UnityEngine.RaycastHit
---@overload fun(origin : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit) : boolean, UnityEngine.RaycastHit
---@overload fun(ray : UnityEngine.Ray, radius : number, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : boolean
---@overload fun(ray : UnityEngine.Ray, radius : number, maxDistance : number, layerMask : number) : boolean
---@overload fun(ray : UnityEngine.Ray, radius : number, maxDistance : number) : boolean
---@overload fun(ray : UnityEngine.Ray, radius : number) : boolean
---@overload fun(ray : UnityEngine.Ray, radius : number, out_hitInfo : UnityEngine.RaycastHit, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : boolean, UnityEngine.RaycastHit
---@overload fun(ray : UnityEngine.Ray, radius : number, out_hitInfo : UnityEngine.RaycastHit, maxDistance : number, layerMask : number) : boolean, UnityEngine.RaycastHit
---@overload fun(ray : UnityEngine.Ray, radius : number, out_hitInfo : UnityEngine.RaycastHit, maxDistance : number) : boolean, UnityEngine.RaycastHit
---@param ray UnityEngine.Ray
---@param radius number
---@param out_hitInfo UnityEngine.RaycastHit
---@return boolean,UnityEngine.RaycastHit
function UnityEngine_Physics.SphereCast(ray, radius, out_hitInfo) end
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, direction : UnityEngine.Vector3, orientation : UnityEngine.Quaternion, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : boolean
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, direction : UnityEngine.Vector3, orientation : UnityEngine.Quaternion, maxDistance : number, layerMask : number) : boolean
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, direction : UnityEngine.Vector3, orientation : UnityEngine.Quaternion, maxDistance : number) : boolean
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, direction : UnityEngine.Vector3, orientation : UnityEngine.Quaternion) : boolean
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, direction : UnityEngine.Vector3) : boolean
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, direction : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit, orientation : UnityEngine.Quaternion, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : boolean, UnityEngine.RaycastHit
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, direction : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit, orientation : UnityEngine.Quaternion, maxDistance : number, layerMask : number) : boolean, UnityEngine.RaycastHit
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, direction : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit, orientation : UnityEngine.Quaternion, maxDistance : number) : boolean, UnityEngine.RaycastHit
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, direction : UnityEngine.Vector3, out_hitInfo : UnityEngine.RaycastHit, orientation : UnityEngine.Quaternion) : boolean, UnityEngine.RaycastHit
---@param center UnityEngine.Vector3
---@param halfExtents UnityEngine.Vector3
---@param direction UnityEngine.Vector3
---@param out_hitInfo UnityEngine.RaycastHit
---@return boolean,UnityEngine.RaycastHit
function UnityEngine_Physics.BoxCast(center, halfExtents, direction, out_hitInfo) end
---@overload fun(origin : UnityEngine.Vector3, direction : UnityEngine.Vector3, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : NotExportType
---@overload fun(origin : UnityEngine.Vector3, direction : UnityEngine.Vector3, maxDistance : number, layerMask : number) : NotExportType
---@overload fun(origin : UnityEngine.Vector3, direction : UnityEngine.Vector3, maxDistance : number) : NotExportType
---@overload fun(origin : UnityEngine.Vector3, direction : UnityEngine.Vector3) : NotExportType
---@overload fun(ray : UnityEngine.Ray, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : NotExportType
---@overload fun(ray : UnityEngine.Ray, maxDistance : number, layerMask : number) : NotExportType
---@overload fun(ray : UnityEngine.Ray, maxDistance : number) : NotExportType
---@param ray UnityEngine.Ray
---@return NotExportType
function UnityEngine_Physics.RaycastAll(ray) end
---@overload fun(ray : UnityEngine.Ray, results : NotExportType, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : number
---@overload fun(ray : UnityEngine.Ray, results : NotExportType, maxDistance : number, layerMask : number) : number
---@overload fun(ray : UnityEngine.Ray, results : NotExportType, maxDistance : number) : number
---@overload fun(ray : UnityEngine.Ray, results : NotExportType) : number
---@overload fun(origin : UnityEngine.Vector3, direction : UnityEngine.Vector3, results : NotExportType, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : number
---@overload fun(origin : UnityEngine.Vector3, direction : UnityEngine.Vector3, results : NotExportType, maxDistance : number, layerMask : number) : number
---@overload fun(origin : UnityEngine.Vector3, direction : UnityEngine.Vector3, results : NotExportType, maxDistance : number) : number
---@param origin UnityEngine.Vector3
---@param direction UnityEngine.Vector3
---@param results NotExportType
---@return number
function UnityEngine_Physics.RaycastNonAlloc(origin, direction, results) end
---@overload fun(point1 : UnityEngine.Vector3, point2 : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : NotExportType
---@overload fun(point1 : UnityEngine.Vector3, point2 : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, maxDistance : number, layerMask : number) : NotExportType
---@overload fun(point1 : UnityEngine.Vector3, point2 : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, maxDistance : number) : NotExportType
---@param point1 UnityEngine.Vector3
---@param point2 UnityEngine.Vector3
---@param radius number
---@param direction UnityEngine.Vector3
---@return NotExportType
function UnityEngine_Physics.CapsuleCastAll(point1, point2, radius, direction) end
---@overload fun(origin : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : NotExportType
---@overload fun(origin : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, maxDistance : number, layerMask : number) : NotExportType
---@overload fun(origin : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, maxDistance : number) : NotExportType
---@overload fun(origin : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3) : NotExportType
---@overload fun(ray : UnityEngine.Ray, radius : number, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : NotExportType
---@overload fun(ray : UnityEngine.Ray, radius : number, maxDistance : number, layerMask : number) : NotExportType
---@overload fun(ray : UnityEngine.Ray, radius : number, maxDistance : number) : NotExportType
---@param ray UnityEngine.Ray
---@param radius number
---@return NotExportType
function UnityEngine_Physics.SphereCastAll(ray, radius) end
---@overload fun(point0 : UnityEngine.Vector3, point1 : UnityEngine.Vector3, radius : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : NotExportType
---@overload fun(point0 : UnityEngine.Vector3, point1 : UnityEngine.Vector3, radius : number, layerMask : number) : NotExportType
---@param point0 UnityEngine.Vector3
---@param point1 UnityEngine.Vector3
---@param radius number
---@return NotExportType
function UnityEngine_Physics.OverlapCapsule(point0, point1, radius) end
---@overload fun(position : UnityEngine.Vector3, radius : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : NotExportType
---@overload fun(position : UnityEngine.Vector3, radius : number, layerMask : number) : NotExportType
---@param position UnityEngine.Vector3
---@param radius number
---@return NotExportType
function UnityEngine_Physics.OverlapSphere(position, radius) end
---@param step number
function UnityEngine_Physics.Simulate(step) end
function UnityEngine_Physics.SyncTransforms() end
---@param colliderA UnityEngine.Collider
---@param positionA UnityEngine.Vector3
---@param rotationA UnityEngine.Quaternion
---@param colliderB UnityEngine.Collider
---@param positionB UnityEngine.Vector3
---@param rotationB UnityEngine.Quaternion
---@param out_direction UnityEngine.Vector3
---@param out_distance number
---@return boolean,UnityEngine.Vector3,number
function UnityEngine_Physics.ComputePenetration(colliderA, positionA, rotationA, colliderB, positionB, rotationB, out_direction, out_distance) end
---@param point UnityEngine.Vector3
---@param collider UnityEngine.Collider
---@param position UnityEngine.Vector3
---@param rotation UnityEngine.Quaternion
---@return UnityEngine.Vector3
function UnityEngine_Physics.ClosestPoint(point, collider, position, rotation) end
---@overload fun(position : UnityEngine.Vector3, radius : number, results : NotExportType, layerMask : number, queryTriggerInteraction : NotExportEnum) : number
---@overload fun(position : UnityEngine.Vector3, radius : number, results : NotExportType, layerMask : number) : number
---@param position UnityEngine.Vector3
---@param radius number
---@param results NotExportType
---@return number
function UnityEngine_Physics.OverlapSphereNonAlloc(position, radius, results) end
---@overload fun(position : UnityEngine.Vector3, radius : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : boolean
---@overload fun(position : UnityEngine.Vector3, radius : number, layerMask : number) : boolean
---@param position UnityEngine.Vector3
---@param radius number
---@return boolean
function UnityEngine_Physics.CheckSphere(position, radius) end
---@overload fun(point1 : UnityEngine.Vector3, point2 : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, results : NotExportType, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : number
---@overload fun(point1 : UnityEngine.Vector3, point2 : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, results : NotExportType, maxDistance : number, layerMask : number) : number
---@overload fun(point1 : UnityEngine.Vector3, point2 : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, results : NotExportType, maxDistance : number) : number
---@param point1 UnityEngine.Vector3
---@param point2 UnityEngine.Vector3
---@param radius number
---@param direction UnityEngine.Vector3
---@param results NotExportType
---@return number
function UnityEngine_Physics.CapsuleCastNonAlloc(point1, point2, radius, direction, results) end
---@overload fun(origin : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, results : NotExportType, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : number
---@overload fun(origin : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, results : NotExportType, maxDistance : number, layerMask : number) : number
---@overload fun(origin : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, results : NotExportType, maxDistance : number) : number
---@overload fun(origin : UnityEngine.Vector3, radius : number, direction : UnityEngine.Vector3, results : NotExportType) : number
---@overload fun(ray : UnityEngine.Ray, radius : number, results : NotExportType, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : number
---@overload fun(ray : UnityEngine.Ray, radius : number, results : NotExportType, maxDistance : number, layerMask : number) : number
---@overload fun(ray : UnityEngine.Ray, radius : number, results : NotExportType, maxDistance : number) : number
---@param ray UnityEngine.Ray
---@param radius number
---@param results NotExportType
---@return number
function UnityEngine_Physics.SphereCastNonAlloc(ray, radius, results) end
---@overload fun(start : UnityEngine.Vector3, _end : UnityEngine.Vector3, radius : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : boolean
---@overload fun(start : UnityEngine.Vector3, _end : UnityEngine.Vector3, radius : number, layerMask : number) : boolean
---@param start UnityEngine.Vector3
---@param _end UnityEngine.Vector3
---@param radius number
---@return boolean
function UnityEngine_Physics.CheckCapsule(start, _end, radius) end
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, orientation : UnityEngine.Quaternion, layermask : number, queryTriggerInteraction : NotExportEnum) : boolean
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, orientation : UnityEngine.Quaternion, layerMask : number) : boolean
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, orientation : UnityEngine.Quaternion) : boolean
---@param center UnityEngine.Vector3
---@param halfExtents UnityEngine.Vector3
---@return boolean
function UnityEngine_Physics.CheckBox(center, halfExtents) end
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, orientation : UnityEngine.Quaternion, layerMask : number, queryTriggerInteraction : NotExportEnum) : NotExportType
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, orientation : UnityEngine.Quaternion, layerMask : number) : NotExportType
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, orientation : UnityEngine.Quaternion) : NotExportType
---@param center UnityEngine.Vector3
---@param halfExtents UnityEngine.Vector3
---@return NotExportType
function UnityEngine_Physics.OverlapBox(center, halfExtents) end
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, results : NotExportType, orientation : UnityEngine.Quaternion, mask : number, queryTriggerInteraction : NotExportEnum) : number
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, results : NotExportType, orientation : UnityEngine.Quaternion, mask : number) : number
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, results : NotExportType, orientation : UnityEngine.Quaternion) : number
---@param center UnityEngine.Vector3
---@param halfExtents UnityEngine.Vector3
---@param results NotExportType
---@return number
function UnityEngine_Physics.OverlapBoxNonAlloc(center, halfExtents, results) end
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, direction : UnityEngine.Vector3, results : NotExportType, orientation : UnityEngine.Quaternion, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : number
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, direction : UnityEngine.Vector3, results : NotExportType, orientation : UnityEngine.Quaternion) : number
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, direction : UnityEngine.Vector3, results : NotExportType, orientation : UnityEngine.Quaternion, maxDistance : number) : number
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, direction : UnityEngine.Vector3, results : NotExportType, orientation : UnityEngine.Quaternion, maxDistance : number, layerMask : number) : number
---@param center UnityEngine.Vector3
---@param halfExtents UnityEngine.Vector3
---@param direction UnityEngine.Vector3
---@param results NotExportType
---@return number
function UnityEngine_Physics.BoxCastNonAlloc(center, halfExtents, direction, results) end
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, direction : UnityEngine.Vector3, orientation : UnityEngine.Quaternion, maxDistance : number, layerMask : number, queryTriggerInteraction : NotExportEnum) : NotExportType
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, direction : UnityEngine.Vector3, orientation : UnityEngine.Quaternion, maxDistance : number, layerMask : number) : NotExportType
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, direction : UnityEngine.Vector3, orientation : UnityEngine.Quaternion, maxDistance : number) : NotExportType
---@overload fun(center : UnityEngine.Vector3, halfExtents : UnityEngine.Vector3, direction : UnityEngine.Vector3, orientation : UnityEngine.Quaternion) : NotExportType
---@param center UnityEngine.Vector3
---@param halfExtents UnityEngine.Vector3
---@param direction UnityEngine.Vector3
---@return NotExportType
function UnityEngine_Physics.BoxCastAll(center, halfExtents, direction) end
---@overload fun(point0 : UnityEngine.Vector3, point1 : UnityEngine.Vector3, radius : number, results : NotExportType, layerMask : number, queryTriggerInteraction : NotExportEnum) : number
---@overload fun(point0 : UnityEngine.Vector3, point1 : UnityEngine.Vector3, radius : number, results : NotExportType, layerMask : number) : number
---@param point0 UnityEngine.Vector3
---@param point1 UnityEngine.Vector3
---@param radius number
---@param results NotExportType
---@return number
function UnityEngine_Physics.OverlapCapsuleNonAlloc(point0, point1, radius, results) end
---@param worldBounds UnityEngine.Bounds
---@param subdivisions number
function UnityEngine_Physics.RebuildBroadphaseRegions(worldBounds, subdivisions) end

---@class UnityEngine.Collider : UnityEngine.Component
---@field enabled boolean
---@field attachedRigidbody UnityEngine.Rigidbody
---@field isTrigger boolean
---@field contactOffset number
---@field bounds UnityEngine.Bounds
---@field sharedMaterial NotExportType
---@field material NotExportType
local UnityEngine_Collider = {}
---@return UnityEngine.Collider
function UnityEngine_Collider.New() end
---@param position UnityEngine.Vector3
---@return UnityEngine.Vector3
function UnityEngine_Collider:ClosestPoint(position) end
---@param ray UnityEngine.Ray
---@param out_hitInfo UnityEngine.RaycastHit
---@param maxDistance number
---@return boolean,UnityEngine.RaycastHit
function UnityEngine_Collider:Raycast(ray, out_hitInfo, maxDistance) end
---@param position UnityEngine.Vector3
---@return UnityEngine.Vector3
function UnityEngine_Collider:ClosestPointOnBounds(position) end

---@class UnityEngine.Texture : UnityEngine.Object
---@field masterTextureLimit number
---@field anisotropicFiltering NotExportEnum
---@field totalTextureMemory number
---@field desiredTextureMemory number
---@field targetTextureMemory number
---@field currentTextureMemory number
---@field nonStreamingTextureMemory number
---@field streamingMipmapUploadCount number
---@field streamingRendererCount number
---@field streamingTextureCount number
---@field nonStreamingTextureCount number
---@field streamingTexturePendingLoadCount number
---@field streamingTextureLoadingCount number
---@field streamingTextureForceLoadAll boolean
---@field streamingTextureDiscardUnusedMips boolean
---@field width number
---@field height number
---@field dimension NotExportEnum
---@field isReadable boolean
---@field wrapMode NotExportEnum
---@field wrapModeU NotExportEnum
---@field wrapModeV NotExportEnum
---@field wrapModeW NotExportEnum
---@field filterMode NotExportEnum
---@field anisoLevel number
---@field mipMapBias number
---@field texelSize UnityEngine.Vector2
---@field updateCount number
---@field imageContentsHash NotExportType
local UnityEngine_Texture = {}
---@param forcedMin number
---@param globalMax number
function UnityEngine_Texture.SetGlobalAnisotropicFilteringLimits(forcedMin, globalMax) end
function UnityEngine_Texture.SetStreamingTextureMaterialDebugProperties() end
---@return NotExportType
function UnityEngine_Texture:GetNativeTexturePtr() end
function UnityEngine_Texture:IncrementUpdateCount() end

---@class UnityEngine.Texture2D : UnityEngine.Texture
---@field whiteTexture UnityEngine.Texture2D
---@field blackTexture UnityEngine.Texture2D
---@field mipmapCount number
---@field format NotExportEnum
---@field isReadable boolean
---@field streamingMipmaps boolean
---@field streamingMipmapsPriority number
---@field requestedMipmapLevel number
---@field desiredMipmapLevel number
---@field loadingMipmapLevel number
---@field loadedMipmapLevel number
---@field alphaIsTransparency boolean
local UnityEngine_Texture2D = {}
---@overload fun(width : number, height : number, format : NotExportEnum, flags : NotExportEnum) : UnityEngine.Texture2D
---@overload fun(width : number, height : number, textureFormat : NotExportEnum, mipChain : boolean, linear : boolean) : UnityEngine.Texture2D
---@overload fun(width : number, height : number, textureFormat : NotExportEnum, mipChain : boolean) : UnityEngine.Texture2D
---@param width number
---@param height number
---@return UnityEngine.Texture2D
function UnityEngine_Texture2D.New(width, height) end
---@param width number
---@param height number
---@param format NotExportEnum
---@param mipChain boolean
---@param linear boolean
---@param nativeTex NotExportType
---@return UnityEngine.Texture2D
function UnityEngine_Texture2D.CreateExternalTexture(width, height, format, mipChain, linear, nativeTex) end
---@param sizes NotExportType
---@param padding number
---@param atlasSize number
---@param results NotExportType
---@return boolean
function UnityEngine_Texture2D.GenerateAtlas(sizes, padding, atlasSize, results) end
---@param highQuality boolean
function UnityEngine_Texture2D:Compress(highQuality) end
function UnityEngine_Texture2D:ClearRequestedMipmapLevel() end
---@return boolean
function UnityEngine_Texture2D:IsRequestedMipmapLevelLoaded() end
---@param nativeTex NotExportType
function UnityEngine_Texture2D:UpdateExternalTexture(nativeTex) end
---@return NotExportType
function UnityEngine_Texture2D:GetRawTextureData() end
---@overload fun(x : number, y : number, blockWidth : number, blockHeight : number, miplevel : number) : NotExportType
---@overload fun(x : number, y : number, blockWidth : number, blockHeight : number) : NotExportType
---@overload fun(miplevel : number) : NotExportType
---@return NotExportType
function UnityEngine_Texture2D:GetPixels() end
---@overload fun(miplevel : number) : NotExportType
---@return NotExportType
function UnityEngine_Texture2D:GetPixels32() end
---@overload fun(textures : NotExportType, padding : number, maximumAtlasSize : number, makeNoLongerReadable : boolean) : NotExportType
---@overload fun(textures : NotExportType, padding : number, maximumAtlasSize : number) : NotExportType
---@param textures NotExportType
---@param padding number
---@return NotExportType
function UnityEngine_Texture2D:PackTextures(textures, padding) end
---@param x number
---@param y number
---@param color UnityEngine.Color
function UnityEngine_Texture2D:SetPixel(x, y, color) end
---@overload fun(x : number, y : number, blockWidth : number, blockHeight : number, colors : NotExportType, miplevel : number)
---@overload fun(x : number, y : number, blockWidth : number, blockHeight : number, colors : NotExportType)
---@overload fun(colors : NotExportType, miplevel : number)
---@param colors NotExportType
function UnityEngine_Texture2D:SetPixels(colors) end
---@param x number
---@param y number
---@return UnityEngine.Color
function UnityEngine_Texture2D:GetPixel(x, y) end
---@param x number
---@param y number
---@return UnityEngine.Color
function UnityEngine_Texture2D:GetPixelBilinear(x, y) end
---@overload fun(data : NotExportType, size : number)
---@param data NotExportType
function UnityEngine_Texture2D:LoadRawTextureData(data) end
---@overload fun(updateMipmaps : boolean, makeNoLongerReadable : boolean)
---@overload fun(updateMipmaps : boolean)
function UnityEngine_Texture2D:Apply() end
---@overload fun(width : number, height : number) : boolean
---@param width number
---@param height number
---@param format NotExportEnum
---@param hasMipMap boolean
---@return boolean
function UnityEngine_Texture2D:Resize(width, height, format, hasMipMap) end
---@overload fun(source : NotExportType, destX : number, destY : number, recalculateMipMaps : boolean)
---@param source NotExportType
---@param destX number
---@param destY number
function UnityEngine_Texture2D:ReadPixels(source, destX, destY) end
---@overload fun(colors : NotExportType, miplevel : number)
---@overload fun(colors : NotExportType)
---@overload fun(x : number, y : number, blockWidth : number, blockHeight : number, colors : NotExportType, miplevel : number)
---@param x number
---@param y number
---@param blockWidth number
---@param blockHeight number
---@param colors NotExportType
function UnityEngine_Texture2D:SetPixels32(x, y, blockWidth, blockHeight, colors) end

---@class UnityEngine.Shader : UnityEngine.Object
---@field globalMaximumLOD number
---@field globalRenderPipeline string
---@field maximumLOD number
---@field isSupported boolean
---@field renderQueue number
local UnityEngine_Shader = {}
---@param name string
---@return UnityEngine.Shader
function UnityEngine_Shader.Find(name) end
---@param keyword string
function UnityEngine_Shader.EnableKeyword(keyword) end
---@param keyword string
function UnityEngine_Shader.DisableKeyword(keyword) end
---@param keyword string
---@return boolean
function UnityEngine_Shader.IsKeywordEnabled(keyword) end
function UnityEngine_Shader.WarmupAllShaders() end
---@param name string
---@return number
function UnityEngine_Shader.PropertyToID(name) end
---@overload fun(name : string, value : number)
---@param nameID number
---@param value number
function UnityEngine_Shader.SetGlobalFloat(nameID, value) end
---@overload fun(name : string, value : number)
---@param nameID number
---@param value number
function UnityEngine_Shader.SetGlobalInt(nameID, value) end
---@overload fun(name : string, value : NotExportType)
---@param nameID number
---@param value NotExportType
function UnityEngine_Shader.SetGlobalVector(nameID, value) end
---@overload fun(name : string, value : UnityEngine.Color)
---@param nameID number
---@param value UnityEngine.Color
function UnityEngine_Shader.SetGlobalColor(nameID, value) end
---@overload fun(name : string, value : NotExportType)
---@param nameID number
---@param value NotExportType
function UnityEngine_Shader.SetGlobalMatrix(nameID, value) end
---@overload fun(name : string, value : UnityEngine.Texture)
---@param nameID number
---@param value UnityEngine.Texture
function UnityEngine_Shader.SetGlobalTexture(nameID, value) end
---@overload fun(name : string, value : NotExportType)
---@param nameID number
---@param value NotExportType
function UnityEngine_Shader.SetGlobalBuffer(nameID, value) end
---@overload fun(name : string, values : NotExportType)
---@overload fun(nameID : number, values : NotExportType)
---@overload fun(name : string, values : NotExportType)
---@param nameID number
---@param values NotExportType
function UnityEngine_Shader.SetGlobalFloatArray(nameID, values) end
---@overload fun(name : string, values : NotExportType)
---@overload fun(nameID : number, values : NotExportType)
---@overload fun(name : string, values : NotExportType)
---@param nameID number
---@param values NotExportType
function UnityEngine_Shader.SetGlobalVectorArray(nameID, values) end
---@overload fun(name : string, values : NotExportType)
---@overload fun(nameID : number, values : NotExportType)
---@overload fun(name : string, values : NotExportType)
---@param nameID number
---@param values NotExportType
function UnityEngine_Shader.SetGlobalMatrixArray(nameID, values) end
---@overload fun(name : string) : number
---@param nameID number
---@return number
function UnityEngine_Shader.GetGlobalFloat(nameID) end
---@overload fun(name : string) : number
---@param nameID number
---@return number
function UnityEngine_Shader.GetGlobalInt(nameID) end
---@overload fun(name : string) : NotExportType
---@param nameID number
---@return NotExportType
function UnityEngine_Shader.GetGlobalVector(nameID) end
---@overload fun(name : string) : UnityEngine.Color
---@param nameID number
---@return UnityEngine.Color
function UnityEngine_Shader.GetGlobalColor(nameID) end
---@overload fun(name : string) : NotExportType
---@param nameID number
---@return NotExportType
function UnityEngine_Shader.GetGlobalMatrix(nameID) end
---@overload fun(name : string) : UnityEngine.Texture
---@param nameID number
---@return UnityEngine.Texture
function UnityEngine_Shader.GetGlobalTexture(nameID) end
---@overload fun(name : string) : NotExportType
---@overload fun(nameID : number) : NotExportType
---@overload fun(name : string, values : NotExportType)
---@param nameID number
---@param values NotExportType
function UnityEngine_Shader.GetGlobalFloatArray(nameID, values) end
---@overload fun(name : string) : NotExportType
---@overload fun(nameID : number) : NotExportType
---@overload fun(name : string, values : NotExportType)
---@param nameID number
---@param values NotExportType
function UnityEngine_Shader.GetGlobalVectorArray(nameID, values) end
---@overload fun(name : string) : NotExportType
---@overload fun(nameID : number) : NotExportType
---@overload fun(name : string, values : NotExportType)
---@param nameID number
---@param values NotExportType
function UnityEngine_Shader.GetGlobalMatrixArray(nameID, values) end

---@class UnityEngine.Renderer : UnityEngine.Component
---@field bounds UnityEngine.Bounds
---@field enabled boolean
---@field isVisible boolean
---@field shadowCastingMode NotExportEnum
---@field receiveShadows boolean
---@field motionVectorGenerationMode NotExportEnum
---@field lightProbeUsage NotExportEnum
---@field reflectionProbeUsage NotExportEnum
---@field renderingLayerMask number
---@field rendererPriority number
---@field sortingLayerName string
---@field sortingLayerID number
---@field sortingOrder number
---@field allowOcclusionWhenDynamic boolean
---@field isPartOfStaticBatch boolean
---@field worldToLocalMatrix NotExportType
---@field localToWorldMatrix NotExportType
---@field lightProbeProxyVolumeOverride UnityEngine.GameObject
---@field probeAnchor UnityEngine.Transform
---@field lightmapIndex number
---@field realtimeLightmapIndex number
---@field lightmapScaleOffset NotExportType
---@field realtimeLightmapScaleOffset NotExportType
---@field materials NotExportType
---@field material UnityEngine.Material
---@field sharedMaterial UnityEngine.Material
---@field sharedMaterials NotExportType
local UnityEngine_Renderer = {}
---@return UnityEngine.Renderer
function UnityEngine_Renderer.New() end
---@return boolean
function UnityEngine_Renderer:HasPropertyBlock() end
---@overload fun(properties : NotExportType)
---@param properties NotExportType
---@param materialIndex number
function UnityEngine_Renderer:SetPropertyBlock(properties, materialIndex) end
---@overload fun(properties : NotExportType)
---@param properties NotExportType
---@param materialIndex number
function UnityEngine_Renderer:GetPropertyBlock(properties, materialIndex) end
---@param m NotExportType
function UnityEngine_Renderer:GetMaterials(m) end
---@param m NotExportType
function UnityEngine_Renderer:GetSharedMaterials(m) end
---@param result NotExportType
function UnityEngine_Renderer:GetClosestReflectionProbes(result) end

---@class UnityEngine.WWW : UnityEngine.CustomYieldInstruction
---@field assetBundle UnityEngine.AssetBundle
---@field bytes NotExportType
---@field bytesDownloaded number
---@field error string
---@field isDone boolean
---@field progress number
---@field responseHeaders NotExportType
---@field text string
---@field texture UnityEngine.Texture2D
---@field textureNonReadable UnityEngine.Texture2D
---@field threadPriority NotExportEnum
---@field uploadProgress number
---@field url string
---@field keepWaiting boolean
local UnityEngine_WWW = {}
---@overload fun(url : string) : UnityEngine.WWW
---@overload fun(url : string, form : NotExportType) : UnityEngine.WWW
---@overload fun(url : string, postData : NotExportType) : UnityEngine.WWW
---@overload fun(url : string, postData : NotExportType, headers : NotExportType) : UnityEngine.WWW
---@param url string
---@param postData NotExportType
---@param headers NotExportType
---@return UnityEngine.WWW
function UnityEngine_WWW.New(url, postData, headers) end
---@overload fun(s : string) : string
---@param s string
---@param e NotExportType
---@return string
function UnityEngine_WWW.EscapeURL(s, e) end
---@overload fun(s : string) : string
---@param s string
---@param e NotExportType
---@return string
function UnityEngine_WWW.UnEscapeURL(s, e) end
---@overload fun(url : string, version : number) : UnityEngine.WWW
---@overload fun(url : string, version : number, crc : number) : UnityEngine.WWW
---@overload fun(url : string, hash : NotExportType) : UnityEngine.WWW
---@overload fun(url : string, hash : NotExportType, crc : number) : UnityEngine.WWW
---@param url string
---@param cachedBundle NotExportType
---@param crc number
---@return UnityEngine.WWW
function UnityEngine_WWW.LoadFromCacheOrDownload(url, cachedBundle, crc) end
---@param texture UnityEngine.Texture2D
function UnityEngine_WWW:LoadImageIntoTexture(texture) end
function UnityEngine_WWW:Dispose() end
---@overload fun() : UnityEngine.AudioClip
---@overload fun(threeD : boolean) : UnityEngine.AudioClip
---@overload fun(threeD : boolean, stream : boolean) : UnityEngine.AudioClip
---@param threeD boolean
---@param stream boolean
---@param audioType NotExportEnum
---@return UnityEngine.AudioClip
function UnityEngine_WWW:GetAudioClip(threeD, stream, audioType) end
---@overload fun() : UnityEngine.AudioClip
---@overload fun(threeD : boolean) : UnityEngine.AudioClip
---@param threeD boolean
---@param audioType NotExportEnum
---@return UnityEngine.AudioClip
function UnityEngine_WWW:GetAudioClipCompressed(threeD, audioType) end

---@class UnityEngine.CustomYieldInstruction : System.Object
---@field keepWaiting boolean
---@field Current System.Object
local UnityEngine_CustomYieldInstruction = {}
---@return boolean
function UnityEngine_CustomYieldInstruction:MoveNext() end
function UnityEngine_CustomYieldInstruction:Reset() end

---@class UnityEngine.Screen : System.Object
---@field width number
---@field height number
---@field dpi number
---@field orientation NotExportEnum
---@field sleepTimeout number
---@field autorotateToPortrait boolean
---@field autorotateToPortraitUpsideDown boolean
---@field autorotateToLandscapeLeft boolean
---@field autorotateToLandscapeRight boolean
---@field currentResolution NotExportType
---@field fullScreen boolean
---@field fullScreenMode NotExportEnum
---@field safeArea NotExportType
---@field resolutions NotExportType
local UnityEngine_Screen = {}
---@return UnityEngine.Screen
function UnityEngine_Screen.New() end
---@overload fun(width : number, height : number, fullscreenMode : NotExportEnum, preferredRefreshRate : number)
---@overload fun(width : number, height : number, fullscreenMode : NotExportEnum)
---@overload fun(width : number, height : number, fullscreen : boolean, preferredRefreshRate : number)
---@param width number
---@param height number
---@param fullscreen boolean
function UnityEngine_Screen.SetResolution(width, height, fullscreen) end

---@class UnityEngine.CameraClearFlags
---@field Skybox UnityEngine.CameraClearFlags
---@field Color UnityEngine.CameraClearFlags
---@field SolidColor UnityEngine.CameraClearFlags
---@field Depth UnityEngine.CameraClearFlags
---@field Nothing UnityEngine.CameraClearFlags
local UnityEngine_CameraClearFlags = {}

---@class UnityEngine.AudioClip : UnityEngine.Object
---@field length number
---@field samples number
---@field channels number
---@field frequency number
---@field loadType NotExportEnum
---@field preloadAudioData boolean
---@field ambisonic boolean
---@field loadState NotExportEnum
---@field loadInBackground boolean
local UnityEngine_AudioClip = {}
---@overload fun(name : string, lengthSamples : number, channels : number, frequency : number, stream : boolean) : UnityEngine.AudioClip
---@overload fun(name : string, lengthSamples : number, channels : number, frequency : number, stream : boolean, pcmreadercallback : NotExportType) : UnityEngine.AudioClip
---@param name string
---@param lengthSamples number
---@param channels number
---@param frequency number
---@param stream boolean
---@param pcmreadercallback NotExportType
---@param pcmsetpositioncallback NotExportType
---@return UnityEngine.AudioClip
function UnityEngine_AudioClip.Create(name, lengthSamples, channels, frequency, stream, pcmreadercallback, pcmsetpositioncallback) end
---@return boolean
function UnityEngine_AudioClip:LoadAudioData() end
---@return boolean
function UnityEngine_AudioClip:UnloadAudioData() end
---@param data NotExportType
---@param offsetSamples number
---@return boolean
function UnityEngine_AudioClip:GetData(data, offsetSamples) end
---@param data NotExportType
---@param offsetSamples number
---@return boolean
function UnityEngine_AudioClip:SetData(data, offsetSamples) end

---@class UnityEngine.AssetBundle : UnityEngine.Object
---@field isStreamedSceneAssetBundle boolean
local UnityEngine_AssetBundle = {}
---@param unloadAllObjects boolean
function UnityEngine_AssetBundle.UnloadAllAssetBundles(unloadAllObjects) end
---@return NotExportType
function UnityEngine_AssetBundle.GetAllLoadedAssetBundles() end
---@overload fun(path : string) : NotExportType
---@overload fun(path : string, crc : number) : NotExportType
---@param path string
---@param crc number
---@param offset number
---@return NotExportType
function UnityEngine_AssetBundle.LoadFromFileAsync(path, crc, offset) end
---@overload fun(path : string) : UnityEngine.AssetBundle
---@overload fun(path : string, crc : number) : UnityEngine.AssetBundle
---@param path string
---@param crc number
---@param offset number
---@return UnityEngine.AssetBundle
function UnityEngine_AssetBundle.LoadFromFile(path, crc, offset) end
---@overload fun(binary : NotExportType) : NotExportType
---@param binary NotExportType
---@param crc number
---@return NotExportType
function UnityEngine_AssetBundle.LoadFromMemoryAsync(binary, crc) end
---@overload fun(binary : NotExportType) : UnityEngine.AssetBundle
---@param binary NotExportType
---@param crc number
---@return UnityEngine.AssetBundle
function UnityEngine_AssetBundle.LoadFromMemory(binary, crc) end
---@overload fun(stream : NotExportType, crc : number, managedReadBufferSize : number) : NotExportType
---@overload fun(stream : NotExportType, crc : number) : NotExportType
---@param stream NotExportType
---@return NotExportType
function UnityEngine_AssetBundle.LoadFromStreamAsync(stream) end
---@overload fun(stream : NotExportType, crc : number, managedReadBufferSize : number) : UnityEngine.AssetBundle
---@overload fun(stream : NotExportType, crc : number) : UnityEngine.AssetBundle
---@param stream NotExportType
---@return UnityEngine.AssetBundle
function UnityEngine_AssetBundle.LoadFromStream(stream) end
---@param inputPath string
---@param outputPath string
---@param method NotExportType
---@param expectedCRC number
---@param priority NotExportEnum
---@return NotExportType
function UnityEngine_AssetBundle.RecompressAssetBundleAsync(inputPath, outputPath, method, expectedCRC, priority) end
---@param name string
---@return boolean
function UnityEngine_AssetBundle:Contains(name) end
---@overload fun(name : string) : UnityEngine.Object
---@param name string
---@param type NotExportType
---@return UnityEngine.Object
function UnityEngine_AssetBundle:LoadAsset(name, type) end
---@overload fun(name : string) : NotExportType
---@param name string
---@param type NotExportType
---@return NotExportType
function UnityEngine_AssetBundle:LoadAssetAsync(name, type) end
---@overload fun(name : string) : NotExportType
---@param name string
---@param type NotExportType
---@return NotExportType
function UnityEngine_AssetBundle:LoadAssetWithSubAssets(name, type) end
---@overload fun(name : string) : NotExportType
---@param name string
---@param type NotExportType
---@return NotExportType
function UnityEngine_AssetBundle:LoadAssetWithSubAssetsAsync(name, type) end
---@overload fun() : NotExportType
---@param type NotExportType
---@return NotExportType
function UnityEngine_AssetBundle:LoadAllAssets(type) end
---@overload fun() : NotExportType
---@param type NotExportType
---@return NotExportType
function UnityEngine_AssetBundle:LoadAllAssetsAsync(type) end
---@param unloadAllLoadedObjects boolean
function UnityEngine_AssetBundle:Unload(unloadAllLoadedObjects) end
---@return NotExportType
function UnityEngine_AssetBundle:GetAllAssetNames() end
---@return NotExportType
function UnityEngine_AssetBundle:GetAllScenePaths() end

---@class UnityEngine.ParticleSystem : UnityEngine.Component
---@field isPlaying boolean
---@field isEmitting boolean
---@field isStopped boolean
---@field isPaused boolean
---@field particleCount number
---@field time number
---@field randomSeed number
---@field useAutoRandomSeed boolean
---@field proceduralSimulationSupported boolean
---@field main NotExportType
---@field emission NotExportType
---@field shape NotExportType
---@field velocityOverLifetime NotExportType
---@field limitVelocityOverLifetime NotExportType
---@field inheritVelocity NotExportType
---@field forceOverLifetime NotExportType
---@field colorOverLifetime NotExportType
---@field colorBySpeed NotExportType
---@field sizeOverLifetime NotExportType
---@field sizeBySpeed NotExportType
---@field rotationOverLifetime NotExportType
---@field rotationBySpeed NotExportType
---@field externalForces NotExportType
---@field noise NotExportType
---@field collision NotExportType
---@field trigger NotExportType
---@field subEmitters NotExportType
---@field textureSheetAnimation NotExportType
---@field lights NotExportType
---@field trails NotExportType
---@field customData NotExportType
local UnityEngine_ParticleSystem = {}
---@return UnityEngine.ParticleSystem
function UnityEngine_ParticleSystem.New() end
function UnityEngine_ParticleSystem.ResetPreMappedBufferMemory() end
---@param customData NotExportType
---@param streamIndex NotExportEnum
function UnityEngine_ParticleSystem:SetCustomParticleData(customData, streamIndex) end
---@param customData NotExportType
---@param streamIndex NotExportEnum
---@return number
function UnityEngine_ParticleSystem:GetCustomParticleData(customData, streamIndex) end
---@overload fun(subEmitterIndex : number)
---@overload fun(subEmitterIndex : number, ref_particle : NotExportType) : NotExportType
---@param subEmitterIndex number
---@param particles NotExportType
function UnityEngine_ParticleSystem:TriggerSubEmitter(subEmitterIndex, particles) end
---@overload fun(out_particles : NotExportType, size : number, offset : number) : NotExportType
---@overload fun(out_particles : NotExportType, size : number) : NotExportType
---@param out_particles NotExportType
---@return ,NotExportType
function UnityEngine_ParticleSystem:SetParticles(out_particles) end
---@overload fun(out_particles : NotExportType, size : number, offset : number) : number, NotExportType
---@overload fun(out_particles : NotExportType, size : number) : number, NotExportType
---@param out_particles NotExportType
---@return number,NotExportType
function UnityEngine_ParticleSystem:GetParticles(out_particles) end
---@overload fun(t : number, withChildren : boolean, restart : boolean, fixedTimeStep : boolean)
---@overload fun(t : number, withChildren : boolean, restart : boolean)
---@overload fun(t : number, withChildren : boolean)
---@param t number
function UnityEngine_ParticleSystem:Simulate(t) end
---@overload fun(withChildren : boolean)
function UnityEngine_ParticleSystem:Play() end
---@overload fun(withChildren : boolean)
function UnityEngine_ParticleSystem:Pause() end
---@overload fun(withChildren : boolean, stopBehavior : NotExportEnum)
---@overload fun(withChildren : boolean)
function UnityEngine_ParticleSystem:Stop() end
---@overload fun(withChildren : boolean)
function UnityEngine_ParticleSystem:Clear() end
---@overload fun(withChildren : boolean) : boolean
---@return boolean
function UnityEngine_ParticleSystem:IsAlive() end
---@overload fun(count : number)
---@param emitParams NotExportType
---@param count number
function UnityEngine_ParticleSystem:Emit(emitParams, count) end

---@class UnityEngine.AsyncOperation : UnityEngine.YieldInstruction
---@field isDone boolean
---@field progress number
---@field priority number
---@field allowSceneActivation boolean
local UnityEngine_AsyncOperation = {}
---@return UnityEngine.AsyncOperation
function UnityEngine_AsyncOperation.New() end

---@class UnityEngine.YieldInstruction : System.Object
local UnityEngine_YieldInstruction = {}
---@return UnityEngine.YieldInstruction
function UnityEngine_YieldInstruction.New() end

---@class UnityEngine.LightType
---@field Spot UnityEngine.LightType
---@field Directional UnityEngine.LightType
---@field Point UnityEngine.LightType
---@field Area UnityEngine.LightType
---@field Rectangle UnityEngine.LightType
---@field Disc UnityEngine.LightType
local UnityEngine_LightType = {}

---@class UnityEngine.SleepTimeout : System.Object
---@field NeverSleep number
---@field SystemSetting number
local UnityEngine_SleepTimeout = {}
---@return UnityEngine.SleepTimeout
function UnityEngine_SleepTimeout.New() end

---@class UnityEngine.Animator : UnityEngine.Behaviour
---@field isOptimizable boolean
---@field isHuman boolean
---@field hasRootMotion boolean
---@field humanScale number
---@field isInitialized boolean
---@field deltaPosition UnityEngine.Vector3
---@field deltaRotation UnityEngine.Quaternion
---@field velocity UnityEngine.Vector3
---@field angularVelocity UnityEngine.Vector3
---@field rootPosition UnityEngine.Vector3
---@field rootRotation UnityEngine.Quaternion
---@field applyRootMotion boolean
---@field updateMode NotExportEnum
---@field hasTransformHierarchy boolean
---@field gravityWeight number
---@field bodyPosition UnityEngine.Vector3
---@field bodyRotation UnityEngine.Quaternion
---@field stabilizeFeet boolean
---@field layerCount number
---@field parameters NotExportType
---@field parameterCount number
---@field feetPivotActive number
---@field pivotWeight number
---@field pivotPosition UnityEngine.Vector3
---@field isMatchingTarget boolean
---@field speed number
---@field targetPosition UnityEngine.Vector3
---@field targetRotation UnityEngine.Quaternion
---@field cullingMode NotExportEnum
---@field playbackTime number
---@field recorderStartTime number
---@field recorderStopTime number
---@field recorderMode NotExportEnum
---@field runtimeAnimatorController NotExportType
---@field hasBoundPlayables boolean
---@field avatar NotExportType
---@field playableGraph NotExportType
---@field layersAffectMassCenter boolean
---@field leftFeetBottomHeight number
---@field rightFeetBottomHeight number
---@field logWarnings boolean
---@field fireEvents boolean
---@field keepAnimatorControllerStateOnDisable boolean
local UnityEngine_Animator = {}
---@return UnityEngine.Animator
function UnityEngine_Animator.New() end
---@param name string
---@return number
function UnityEngine_Animator.StringToHash(name) end
---@overload fun(name : string) : number
---@param id number
---@return number
function UnityEngine_Animator:GetFloat(id) end
---@overload fun(name : string, value : number)
---@overload fun(name : string, value : number, dampTime : number, deltaTime : number)
---@overload fun(id : number, value : number)
---@param id number
---@param value number
---@param dampTime number
---@param deltaTime number
function UnityEngine_Animator:SetFloat(id, value, dampTime, deltaTime) end
---@overload fun(name : string) : boolean
---@param id number
---@return boolean
function UnityEngine_Animator:GetBool(id) end
---@overload fun(name : string, value : boolean)
---@param id number
---@param value boolean
function UnityEngine_Animator:SetBool(id, value) end
---@overload fun(name : string) : number
---@param id number
---@return number
function UnityEngine_Animator:GetInteger(id) end
---@overload fun(name : string, value : number)
---@param id number
---@param value number
function UnityEngine_Animator:SetInteger(id, value) end
---@overload fun(name : string)
---@param id number
function UnityEngine_Animator:SetTrigger(id) end
---@overload fun(name : string)
---@param id number
function UnityEngine_Animator:ResetTrigger(id) end
---@overload fun(name : string) : boolean
---@param id number
---@return boolean
function UnityEngine_Animator:IsParameterControlledByCurve(id) end
---@param goal NotExportEnum
---@return UnityEngine.Vector3
function UnityEngine_Animator:GetIKPosition(goal) end
---@param goal NotExportEnum
---@param goalPosition UnityEngine.Vector3
function UnityEngine_Animator:SetIKPosition(goal, goalPosition) end
---@param goal NotExportEnum
---@return UnityEngine.Quaternion
function UnityEngine_Animator:GetIKRotation(goal) end
---@param goal NotExportEnum
---@param goalRotation UnityEngine.Quaternion
function UnityEngine_Animator:SetIKRotation(goal, goalRotation) end
---@param goal NotExportEnum
---@return number
function UnityEngine_Animator:GetIKPositionWeight(goal) end
---@param goal NotExportEnum
---@param value number
function UnityEngine_Animator:SetIKPositionWeight(goal, value) end
---@param goal NotExportEnum
---@return number
function UnityEngine_Animator:GetIKRotationWeight(goal) end
---@param goal NotExportEnum
---@param value number
function UnityEngine_Animator:SetIKRotationWeight(goal, value) end
---@param hint NotExportEnum
---@return UnityEngine.Vector3
function UnityEngine_Animator:GetIKHintPosition(hint) end
---@param hint NotExportEnum
---@param hintPosition UnityEngine.Vector3
function UnityEngine_Animator:SetIKHintPosition(hint, hintPosition) end
---@param hint NotExportEnum
---@return number
function UnityEngine_Animator:GetIKHintPositionWeight(hint) end
---@param hint NotExportEnum
---@param value number
function UnityEngine_Animator:SetIKHintPositionWeight(hint, value) end
---@param lookAtPosition UnityEngine.Vector3
function UnityEngine_Animator:SetLookAtPosition(lookAtPosition) end
---@overload fun(weight : number)
---@overload fun(weight : number, bodyWeight : number)
---@overload fun(weight : number, bodyWeight : number, headWeight : number)
---@overload fun(weight : number, bodyWeight : number, headWeight : number, eyesWeight : number)
---@param weight number
---@param bodyWeight number
---@param headWeight number
---@param eyesWeight number
---@param clampWeight number
function UnityEngine_Animator:SetLookAtWeight(weight, bodyWeight, headWeight, eyesWeight, clampWeight) end
---@param humanBoneId NotExportEnum
---@param rotation UnityEngine.Quaternion
function UnityEngine_Animator:SetBoneLocalRotation(humanBoneId, rotation) end
---@param fullPathHash number
---@param layerIndex number
---@return NotExportType
function UnityEngine_Animator:GetBehaviours(fullPathHash, layerIndex) end
---@param layerIndex number
---@return string
function UnityEngine_Animator:GetLayerName(layerIndex) end
---@param layerName string
---@return number
function UnityEngine_Animator:GetLayerIndex(layerName) end
---@param layerIndex number
---@return number
function UnityEngine_Animator:GetLayerWeight(layerIndex) end
---@param layerIndex number
---@param weight number
function UnityEngine_Animator:SetLayerWeight(layerIndex, weight) end
---@param layerIndex number
---@return NotExportType
function UnityEngine_Animator:GetCurrentAnimatorStateInfo(layerIndex) end
---@param layerIndex number
---@return NotExportType
function UnityEngine_Animator:GetNextAnimatorStateInfo(layerIndex) end
---@param layerIndex number
---@return NotExportType
function UnityEngine_Animator:GetAnimatorTransitionInfo(layerIndex) end
---@param layerIndex number
---@return number
function UnityEngine_Animator:GetCurrentAnimatorClipInfoCount(layerIndex) end
---@param layerIndex number
---@return number
function UnityEngine_Animator:GetNextAnimatorClipInfoCount(layerIndex) end
---@overload fun(layerIndex : number) : NotExportType
---@param layerIndex number
---@param clips NotExportType
function UnityEngine_Animator:GetCurrentAnimatorClipInfo(layerIndex, clips) end
---@overload fun(layerIndex : number) : NotExportType
---@param layerIndex number
---@param clips NotExportType
function UnityEngine_Animator:GetNextAnimatorClipInfo(layerIndex, clips) end
---@param layerIndex number
---@return boolean
function UnityEngine_Animator:IsInTransition(layerIndex) end
---@param index number
---@return NotExportType
function UnityEngine_Animator:GetParameter(index) end
---@overload fun(matchPosition : UnityEngine.Vector3, matchRotation : UnityEngine.Quaternion, targetBodyPart : NotExportEnum, weightMask : NotExportType, startNormalizedTime : number)
---@param matchPosition UnityEngine.Vector3
---@param matchRotation UnityEngine.Quaternion
---@param targetBodyPart NotExportEnum
---@param weightMask NotExportType
---@param startNormalizedTime number
---@param targetNormalizedTime number
function UnityEngine_Animator:MatchTarget(matchPosition, matchRotation, targetBodyPart, weightMask, startNormalizedTime, targetNormalizedTime) end
---@overload fun()
---@param completeMatch boolean
function UnityEngine_Animator:InterruptMatchTarget(completeMatch) end
---@overload fun(stateName : string, fixedTransitionDuration : number)
---@overload fun(stateName : string, fixedTransitionDuration : number, layer : number)
---@overload fun(stateName : string, fixedTransitionDuration : number, layer : number, fixedTimeOffset : number)
---@overload fun(stateName : string, fixedTransitionDuration : number, layer : number, fixedTimeOffset : number, normalizedTransitionTime : number)
---@overload fun(stateHashName : number, fixedTransitionDuration : number, layer : number, fixedTimeOffset : number)
---@overload fun(stateHashName : number, fixedTransitionDuration : number, layer : number)
---@overload fun(stateHashName : number, fixedTransitionDuration : number)
---@param stateHashName number
---@param fixedTransitionDuration number
---@param layer number
---@param fixedTimeOffset number
---@param normalizedTransitionTime number
function UnityEngine_Animator:CrossFadeInFixedTime(stateHashName, fixedTransitionDuration, layer, fixedTimeOffset, normalizedTransitionTime) end
function UnityEngine_Animator:WriteDefaultValues() end
---@overload fun(stateName : string, normalizedTransitionDuration : number, layer : number, normalizedTimeOffset : number)
---@overload fun(stateName : string, normalizedTransitionDuration : number, layer : number)
---@overload fun(stateName : string, normalizedTransitionDuration : number)
---@overload fun(stateName : string, normalizedTransitionDuration : number, layer : number, normalizedTimeOffset : number, normalizedTransitionTime : number)
---@overload fun(stateHashName : number, normalizedTransitionDuration : number, layer : number, normalizedTimeOffset : number, normalizedTransitionTime : number)
---@overload fun(stateHashName : number, normalizedTransitionDuration : number, layer : number, normalizedTimeOffset : number)
---@overload fun(stateHashName : number, normalizedTransitionDuration : number, layer : number)
---@param stateHashName number
---@param normalizedTransitionDuration number
function UnityEngine_Animator:CrossFade(stateHashName, normalizedTransitionDuration) end
---@overload fun(stateName : string, layer : number)
---@overload fun(stateName : string)
---@overload fun(stateName : string, layer : number, fixedTime : number)
---@overload fun(stateNameHash : number, layer : number, fixedTime : number)
---@overload fun(stateNameHash : number, layer : number)
---@param stateNameHash number
function UnityEngine_Animator:PlayInFixedTime(stateNameHash) end
---@overload fun(stateName : string, layer : number)
---@overload fun(stateName : string)
---@overload fun(stateName : string, layer : number, normalizedTime : number)
---@overload fun(stateNameHash : number, layer : number, normalizedTime : number)
---@overload fun(stateNameHash : number, layer : number)
---@param stateNameHash number
function UnityEngine_Animator:Play(stateNameHash) end
---@param targetIndex NotExportEnum
---@param targetNormalizedTime number
function UnityEngine_Animator:SetTarget(targetIndex, targetNormalizedTime) end
---@param humanBoneId NotExportEnum
---@return UnityEngine.Transform
function UnityEngine_Animator:GetBoneTransform(humanBoneId) end
function UnityEngine_Animator:StartPlayback() end
function UnityEngine_Animator:StopPlayback() end
---@param frameCount number
function UnityEngine_Animator:StartRecording(frameCount) end
function UnityEngine_Animator:StopRecording() end
---@param layerIndex number
---@param stateID number
---@return boolean
function UnityEngine_Animator:HasState(layerIndex, stateID) end
---@param deltaTime number
function UnityEngine_Animator:Update(deltaTime) end
function UnityEngine_Animator:Rebind() end
function UnityEngine_Animator:ApplyBuiltinRootMotion() end

---@class UnityEngine.Input : System.Object
---@field simulateMouseWithTouches boolean
---@field anyKey boolean
---@field anyKeyDown boolean
---@field inputString string
---@field mousePosition UnityEngine.Vector3
---@field mouseScrollDelta UnityEngine.Vector2
---@field imeCompositionMode NotExportEnum
---@field compositionString string
---@field imeIsSelected boolean
---@field compositionCursorPos UnityEngine.Vector2
---@field mousePresent boolean
---@field touchCount number
---@field touchPressureSupported boolean
---@field stylusTouchSupported boolean
---@field touchSupported boolean
---@field multiTouchEnabled boolean
---@field deviceOrientation NotExportEnum
---@field acceleration UnityEngine.Vector3
---@field compensateSensors boolean
---@field accelerationEventCount number
---@field backButtonLeavesApp boolean
---@field location NotExportType
---@field compass NotExportType
---@field gyro NotExportType
---@field touches NotExportType
---@field accelerationEvents NotExportType
local UnityEngine_Input = {}
---@return UnityEngine.Input
function UnityEngine_Input.New() end
---@param axisName string
---@return number
function UnityEngine_Input.GetAxis(axisName) end
---@param axisName string
---@return number
function UnityEngine_Input.GetAxisRaw(axisName) end
---@param buttonName string
---@return boolean
function UnityEngine_Input.GetButton(buttonName) end
---@param buttonName string
---@return boolean
function UnityEngine_Input.GetButtonDown(buttonName) end
---@param buttonName string
---@return boolean
function UnityEngine_Input.GetButtonUp(buttonName) end
---@param button number
---@return boolean
function UnityEngine_Input.GetMouseButton(button) end
---@param button number
---@return boolean
function UnityEngine_Input.GetMouseButtonDown(button) end
---@param button number
---@return boolean
function UnityEngine_Input.GetMouseButtonUp(button) end
function UnityEngine_Input.ResetInputAxes() end
---@param joystickName string
---@return boolean
function UnityEngine_Input.IsJoystickPreconfigured(joystickName) end
---@return NotExportType
function UnityEngine_Input.GetJoystickNames() end
---@param index number
---@return UnityEngine.Touch
function UnityEngine_Input.GetTouch(index) end
---@param index number
---@return NotExportType
function UnityEngine_Input.GetAccelerationEvent(index) end
---@overload fun(key : UnityEngine.KeyCode) : boolean
---@param name string
---@return boolean
function UnityEngine_Input.GetKey(name) end
---@overload fun(key : UnityEngine.KeyCode) : boolean
---@param name string
---@return boolean
function UnityEngine_Input.GetKeyUp(name) end
---@overload fun(key : UnityEngine.KeyCode) : boolean
---@param name string
---@return boolean
function UnityEngine_Input.GetKeyDown(name) end

---@class UnityEngine.KeyCode
---@field None UnityEngine.KeyCode
---@field Backspace UnityEngine.KeyCode
---@field Delete UnityEngine.KeyCode
---@field Tab UnityEngine.KeyCode
---@field Clear UnityEngine.KeyCode
---@field Return UnityEngine.KeyCode
---@field Pause UnityEngine.KeyCode
---@field Escape UnityEngine.KeyCode
---@field Space UnityEngine.KeyCode
---@field Keypad0 UnityEngine.KeyCode
---@field Keypad1 UnityEngine.KeyCode
---@field Keypad2 UnityEngine.KeyCode
---@field Keypad3 UnityEngine.KeyCode
---@field Keypad4 UnityEngine.KeyCode
---@field Keypad5 UnityEngine.KeyCode
---@field Keypad6 UnityEngine.KeyCode
---@field Keypad7 UnityEngine.KeyCode
---@field Keypad8 UnityEngine.KeyCode
---@field Keypad9 UnityEngine.KeyCode
---@field KeypadPeriod UnityEngine.KeyCode
---@field KeypadDivide UnityEngine.KeyCode
---@field KeypadMultiply UnityEngine.KeyCode
---@field KeypadMinus UnityEngine.KeyCode
---@field KeypadPlus UnityEngine.KeyCode
---@field KeypadEnter UnityEngine.KeyCode
---@field KeypadEquals UnityEngine.KeyCode
---@field UpArrow UnityEngine.KeyCode
---@field DownArrow UnityEngine.KeyCode
---@field RightArrow UnityEngine.KeyCode
---@field LeftArrow UnityEngine.KeyCode
---@field Insert UnityEngine.KeyCode
---@field Home UnityEngine.KeyCode
---@field End UnityEngine.KeyCode
---@field PageUp UnityEngine.KeyCode
---@field PageDown UnityEngine.KeyCode
---@field F1 UnityEngine.KeyCode
---@field F2 UnityEngine.KeyCode
---@field F3 UnityEngine.KeyCode
---@field F4 UnityEngine.KeyCode
---@field F5 UnityEngine.KeyCode
---@field F6 UnityEngine.KeyCode
---@field F7 UnityEngine.KeyCode
---@field F8 UnityEngine.KeyCode
---@field F9 UnityEngine.KeyCode
---@field F10 UnityEngine.KeyCode
---@field F11 UnityEngine.KeyCode
---@field F12 UnityEngine.KeyCode
---@field F13 UnityEngine.KeyCode
---@field F14 UnityEngine.KeyCode
---@field F15 UnityEngine.KeyCode
---@field Alpha0 UnityEngine.KeyCode
---@field Alpha1 UnityEngine.KeyCode
---@field Alpha2 UnityEngine.KeyCode
---@field Alpha3 UnityEngine.KeyCode
---@field Alpha4 UnityEngine.KeyCode
---@field Alpha5 UnityEngine.KeyCode
---@field Alpha6 UnityEngine.KeyCode
---@field Alpha7 UnityEngine.KeyCode
---@field Alpha8 UnityEngine.KeyCode
---@field Alpha9 UnityEngine.KeyCode
---@field Exclaim UnityEngine.KeyCode
---@field DoubleQuote UnityEngine.KeyCode
---@field Hash UnityEngine.KeyCode
---@field Dollar UnityEngine.KeyCode
---@field Percent UnityEngine.KeyCode
---@field Ampersand UnityEngine.KeyCode
---@field Quote UnityEngine.KeyCode
---@field LeftParen UnityEngine.KeyCode
---@field RightParen UnityEngine.KeyCode
---@field Asterisk UnityEngine.KeyCode
---@field Plus UnityEngine.KeyCode
---@field Comma UnityEngine.KeyCode
---@field Minus UnityEngine.KeyCode
---@field Period UnityEngine.KeyCode
---@field Slash UnityEngine.KeyCode
---@field Colon UnityEngine.KeyCode
---@field Semicolon UnityEngine.KeyCode
---@field Less UnityEngine.KeyCode
---@field Equals UnityEngine.KeyCode
---@field Greater UnityEngine.KeyCode
---@field Question UnityEngine.KeyCode
---@field At UnityEngine.KeyCode
---@field LeftBracket UnityEngine.KeyCode
---@field Backslash UnityEngine.KeyCode
---@field RightBracket UnityEngine.KeyCode
---@field Caret UnityEngine.KeyCode
---@field Underscore UnityEngine.KeyCode
---@field BackQuote UnityEngine.KeyCode
---@field A UnityEngine.KeyCode
---@field B UnityEngine.KeyCode
---@field C UnityEngine.KeyCode
---@field D UnityEngine.KeyCode
---@field E UnityEngine.KeyCode
---@field F UnityEngine.KeyCode
---@field G UnityEngine.KeyCode
---@field H UnityEngine.KeyCode
---@field I UnityEngine.KeyCode
---@field J UnityEngine.KeyCode
---@field K UnityEngine.KeyCode
---@field L UnityEngine.KeyCode
---@field M UnityEngine.KeyCode
---@field N UnityEngine.KeyCode
---@field O UnityEngine.KeyCode
---@field P UnityEngine.KeyCode
---@field Q UnityEngine.KeyCode
---@field R UnityEngine.KeyCode
---@field S UnityEngine.KeyCode
---@field T UnityEngine.KeyCode
---@field U UnityEngine.KeyCode
---@field V UnityEngine.KeyCode
---@field W UnityEngine.KeyCode
---@field X UnityEngine.KeyCode
---@field Y UnityEngine.KeyCode
---@field Z UnityEngine.KeyCode
---@field LeftCurlyBracket UnityEngine.KeyCode
---@field Pipe UnityEngine.KeyCode
---@field RightCurlyBracket UnityEngine.KeyCode
---@field Tilde UnityEngine.KeyCode
---@field Numlock UnityEngine.KeyCode
---@field CapsLock UnityEngine.KeyCode
---@field ScrollLock UnityEngine.KeyCode
---@field RightShift UnityEngine.KeyCode
---@field LeftShift UnityEngine.KeyCode
---@field RightControl UnityEngine.KeyCode
---@field LeftControl UnityEngine.KeyCode
---@field RightAlt UnityEngine.KeyCode
---@field LeftAlt UnityEngine.KeyCode
---@field LeftCommand UnityEngine.KeyCode
---@field LeftApple UnityEngine.KeyCode
---@field LeftWindows UnityEngine.KeyCode
---@field RightCommand UnityEngine.KeyCode
---@field RightApple UnityEngine.KeyCode
---@field RightWindows UnityEngine.KeyCode
---@field AltGr UnityEngine.KeyCode
---@field Help UnityEngine.KeyCode
---@field Print UnityEngine.KeyCode
---@field SysReq UnityEngine.KeyCode
---@field Break UnityEngine.KeyCode
---@field Menu UnityEngine.KeyCode
---@field Mouse0 UnityEngine.KeyCode
---@field Mouse1 UnityEngine.KeyCode
---@field Mouse2 UnityEngine.KeyCode
---@field Mouse3 UnityEngine.KeyCode
---@field Mouse4 UnityEngine.KeyCode
---@field Mouse5 UnityEngine.KeyCode
---@field Mouse6 UnityEngine.KeyCode
---@field JoystickButton0 UnityEngine.KeyCode
---@field JoystickButton1 UnityEngine.KeyCode
---@field JoystickButton2 UnityEngine.KeyCode
---@field JoystickButton3 UnityEngine.KeyCode
---@field JoystickButton4 UnityEngine.KeyCode
---@field JoystickButton5 UnityEngine.KeyCode
---@field JoystickButton6 UnityEngine.KeyCode
---@field JoystickButton7 UnityEngine.KeyCode
---@field JoystickButton8 UnityEngine.KeyCode
---@field JoystickButton9 UnityEngine.KeyCode
---@field JoystickButton10 UnityEngine.KeyCode
---@field JoystickButton11 UnityEngine.KeyCode
---@field JoystickButton12 UnityEngine.KeyCode
---@field JoystickButton13 UnityEngine.KeyCode
---@field JoystickButton14 UnityEngine.KeyCode
---@field JoystickButton15 UnityEngine.KeyCode
---@field JoystickButton16 UnityEngine.KeyCode
---@field JoystickButton17 UnityEngine.KeyCode
---@field JoystickButton18 UnityEngine.KeyCode
---@field JoystickButton19 UnityEngine.KeyCode
---@field Joystick1Button0 UnityEngine.KeyCode
---@field Joystick1Button1 UnityEngine.KeyCode
---@field Joystick1Button2 UnityEngine.KeyCode
---@field Joystick1Button3 UnityEngine.KeyCode
---@field Joystick1Button4 UnityEngine.KeyCode
---@field Joystick1Button5 UnityEngine.KeyCode
---@field Joystick1Button6 UnityEngine.KeyCode
---@field Joystick1Button7 UnityEngine.KeyCode
---@field Joystick1Button8 UnityEngine.KeyCode
---@field Joystick1Button9 UnityEngine.KeyCode
---@field Joystick1Button10 UnityEngine.KeyCode
---@field Joystick1Button11 UnityEngine.KeyCode
---@field Joystick1Button12 UnityEngine.KeyCode
---@field Joystick1Button13 UnityEngine.KeyCode
---@field Joystick1Button14 UnityEngine.KeyCode
---@field Joystick1Button15 UnityEngine.KeyCode
---@field Joystick1Button16 UnityEngine.KeyCode
---@field Joystick1Button17 UnityEngine.KeyCode
---@field Joystick1Button18 UnityEngine.KeyCode
---@field Joystick1Button19 UnityEngine.KeyCode
---@field Joystick2Button0 UnityEngine.KeyCode
---@field Joystick2Button1 UnityEngine.KeyCode
---@field Joystick2Button2 UnityEngine.KeyCode
---@field Joystick2Button3 UnityEngine.KeyCode
---@field Joystick2Button4 UnityEngine.KeyCode
---@field Joystick2Button5 UnityEngine.KeyCode
---@field Joystick2Button6 UnityEngine.KeyCode
---@field Joystick2Button7 UnityEngine.KeyCode
---@field Joystick2Button8 UnityEngine.KeyCode
---@field Joystick2Button9 UnityEngine.KeyCode
---@field Joystick2Button10 UnityEngine.KeyCode
---@field Joystick2Button11 UnityEngine.KeyCode
---@field Joystick2Button12 UnityEngine.KeyCode
---@field Joystick2Button13 UnityEngine.KeyCode
---@field Joystick2Button14 UnityEngine.KeyCode
---@field Joystick2Button15 UnityEngine.KeyCode
---@field Joystick2Button16 UnityEngine.KeyCode
---@field Joystick2Button17 UnityEngine.KeyCode
---@field Joystick2Button18 UnityEngine.KeyCode
---@field Joystick2Button19 UnityEngine.KeyCode
---@field Joystick3Button0 UnityEngine.KeyCode
---@field Joystick3Button1 UnityEngine.KeyCode
---@field Joystick3Button2 UnityEngine.KeyCode
---@field Joystick3Button3 UnityEngine.KeyCode
---@field Joystick3Button4 UnityEngine.KeyCode
---@field Joystick3Button5 UnityEngine.KeyCode
---@field Joystick3Button6 UnityEngine.KeyCode
---@field Joystick3Button7 UnityEngine.KeyCode
---@field Joystick3Button8 UnityEngine.KeyCode
---@field Joystick3Button9 UnityEngine.KeyCode
---@field Joystick3Button10 UnityEngine.KeyCode
---@field Joystick3Button11 UnityEngine.KeyCode
---@field Joystick3Button12 UnityEngine.KeyCode
---@field Joystick3Button13 UnityEngine.KeyCode
---@field Joystick3Button14 UnityEngine.KeyCode
---@field Joystick3Button15 UnityEngine.KeyCode
---@field Joystick3Button16 UnityEngine.KeyCode
---@field Joystick3Button17 UnityEngine.KeyCode
---@field Joystick3Button18 UnityEngine.KeyCode
---@field Joystick3Button19 UnityEngine.KeyCode
---@field Joystick4Button0 UnityEngine.KeyCode
---@field Joystick4Button1 UnityEngine.KeyCode
---@field Joystick4Button2 UnityEngine.KeyCode
---@field Joystick4Button3 UnityEngine.KeyCode
---@field Joystick4Button4 UnityEngine.KeyCode
---@field Joystick4Button5 UnityEngine.KeyCode
---@field Joystick4Button6 UnityEngine.KeyCode
---@field Joystick4Button7 UnityEngine.KeyCode
---@field Joystick4Button8 UnityEngine.KeyCode
---@field Joystick4Button9 UnityEngine.KeyCode
---@field Joystick4Button10 UnityEngine.KeyCode
---@field Joystick4Button11 UnityEngine.KeyCode
---@field Joystick4Button12 UnityEngine.KeyCode
---@field Joystick4Button13 UnityEngine.KeyCode
---@field Joystick4Button14 UnityEngine.KeyCode
---@field Joystick4Button15 UnityEngine.KeyCode
---@field Joystick4Button16 UnityEngine.KeyCode
---@field Joystick4Button17 UnityEngine.KeyCode
---@field Joystick4Button18 UnityEngine.KeyCode
---@field Joystick4Button19 UnityEngine.KeyCode
---@field Joystick5Button0 UnityEngine.KeyCode
---@field Joystick5Button1 UnityEngine.KeyCode
---@field Joystick5Button2 UnityEngine.KeyCode
---@field Joystick5Button3 UnityEngine.KeyCode
---@field Joystick5Button4 UnityEngine.KeyCode
---@field Joystick5Button5 UnityEngine.KeyCode
---@field Joystick5Button6 UnityEngine.KeyCode
---@field Joystick5Button7 UnityEngine.KeyCode
---@field Joystick5Button8 UnityEngine.KeyCode
---@field Joystick5Button9 UnityEngine.KeyCode
---@field Joystick5Button10 UnityEngine.KeyCode
---@field Joystick5Button11 UnityEngine.KeyCode
---@field Joystick5Button12 UnityEngine.KeyCode
---@field Joystick5Button13 UnityEngine.KeyCode
---@field Joystick5Button14 UnityEngine.KeyCode
---@field Joystick5Button15 UnityEngine.KeyCode
---@field Joystick5Button16 UnityEngine.KeyCode
---@field Joystick5Button17 UnityEngine.KeyCode
---@field Joystick5Button18 UnityEngine.KeyCode
---@field Joystick5Button19 UnityEngine.KeyCode
---@field Joystick6Button0 UnityEngine.KeyCode
---@field Joystick6Button1 UnityEngine.KeyCode
---@field Joystick6Button2 UnityEngine.KeyCode
---@field Joystick6Button3 UnityEngine.KeyCode
---@field Joystick6Button4 UnityEngine.KeyCode
---@field Joystick6Button5 UnityEngine.KeyCode
---@field Joystick6Button6 UnityEngine.KeyCode
---@field Joystick6Button7 UnityEngine.KeyCode
---@field Joystick6Button8 UnityEngine.KeyCode
---@field Joystick6Button9 UnityEngine.KeyCode
---@field Joystick6Button10 UnityEngine.KeyCode
---@field Joystick6Button11 UnityEngine.KeyCode
---@field Joystick6Button12 UnityEngine.KeyCode
---@field Joystick6Button13 UnityEngine.KeyCode
---@field Joystick6Button14 UnityEngine.KeyCode
---@field Joystick6Button15 UnityEngine.KeyCode
---@field Joystick6Button16 UnityEngine.KeyCode
---@field Joystick6Button17 UnityEngine.KeyCode
---@field Joystick6Button18 UnityEngine.KeyCode
---@field Joystick6Button19 UnityEngine.KeyCode
---@field Joystick7Button0 UnityEngine.KeyCode
---@field Joystick7Button1 UnityEngine.KeyCode
---@field Joystick7Button2 UnityEngine.KeyCode
---@field Joystick7Button3 UnityEngine.KeyCode
---@field Joystick7Button4 UnityEngine.KeyCode
---@field Joystick7Button5 UnityEngine.KeyCode
---@field Joystick7Button6 UnityEngine.KeyCode
---@field Joystick7Button7 UnityEngine.KeyCode
---@field Joystick7Button8 UnityEngine.KeyCode
---@field Joystick7Button9 UnityEngine.KeyCode
---@field Joystick7Button10 UnityEngine.KeyCode
---@field Joystick7Button11 UnityEngine.KeyCode
---@field Joystick7Button12 UnityEngine.KeyCode
---@field Joystick7Button13 UnityEngine.KeyCode
---@field Joystick7Button14 UnityEngine.KeyCode
---@field Joystick7Button15 UnityEngine.KeyCode
---@field Joystick7Button16 UnityEngine.KeyCode
---@field Joystick7Button17 UnityEngine.KeyCode
---@field Joystick7Button18 UnityEngine.KeyCode
---@field Joystick7Button19 UnityEngine.KeyCode
---@field Joystick8Button0 UnityEngine.KeyCode
---@field Joystick8Button1 UnityEngine.KeyCode
---@field Joystick8Button2 UnityEngine.KeyCode
---@field Joystick8Button3 UnityEngine.KeyCode
---@field Joystick8Button4 UnityEngine.KeyCode
---@field Joystick8Button5 UnityEngine.KeyCode
---@field Joystick8Button6 UnityEngine.KeyCode
---@field Joystick8Button7 UnityEngine.KeyCode
---@field Joystick8Button8 UnityEngine.KeyCode
---@field Joystick8Button9 UnityEngine.KeyCode
---@field Joystick8Button10 UnityEngine.KeyCode
---@field Joystick8Button11 UnityEngine.KeyCode
---@field Joystick8Button12 UnityEngine.KeyCode
---@field Joystick8Button13 UnityEngine.KeyCode
---@field Joystick8Button14 UnityEngine.KeyCode
---@field Joystick8Button15 UnityEngine.KeyCode
---@field Joystick8Button16 UnityEngine.KeyCode
---@field Joystick8Button17 UnityEngine.KeyCode
---@field Joystick8Button18 UnityEngine.KeyCode
---@field Joystick8Button19 UnityEngine.KeyCode
local UnityEngine_KeyCode = {}

---@class UnityEngine.SkinnedMeshRenderer : UnityEngine.Renderer
---@field quality NotExportEnum
---@field updateWhenOffscreen boolean
---@field forceMatrixRecalculationPerRender boolean
---@field rootBone UnityEngine.Transform
---@field bones NotExportType
---@field sharedMesh NotExportType
---@field skinnedMotionVectors boolean
---@field localBounds UnityEngine.Bounds
local UnityEngine_SkinnedMeshRenderer = {}
---@return UnityEngine.SkinnedMeshRenderer
function UnityEngine_SkinnedMeshRenderer.New() end
---@param index number
---@return number
function UnityEngine_SkinnedMeshRenderer:GetBlendShapeWeight(index) end
---@param index number
---@param value number
function UnityEngine_SkinnedMeshRenderer:SetBlendShapeWeight(index, value) end
---@param mesh NotExportType
function UnityEngine_SkinnedMeshRenderer:BakeMesh(mesh) end

---@class UnityEngine.Space
---@field World UnityEngine.Space
---@field Self UnityEngine.Space
local UnityEngine_Space = {}

---@class UnityEngine.MeshRenderer : UnityEngine.Renderer
---@field additionalVertexStreams NotExportType
---@field subMeshStartIndex number
local UnityEngine_MeshRenderer = {}
---@return UnityEngine.MeshRenderer
function UnityEngine_MeshRenderer.New() end

---@class UnityEngine.BoxCollider : UnityEngine.Collider
---@field center UnityEngine.Vector3
---@field size UnityEngine.Vector3
local UnityEngine_BoxCollider = {}
---@return UnityEngine.BoxCollider
function UnityEngine_BoxCollider.New() end

---@class UnityEngine.MeshCollider : UnityEngine.Collider
---@field sharedMesh NotExportType
---@field convex boolean
---@field cookingOptions NotExportEnum
local UnityEngine_MeshCollider = {}
---@return UnityEngine.MeshCollider
function UnityEngine_MeshCollider.New() end

---@class UnityEngine.SphereCollider : UnityEngine.Collider
---@field center UnityEngine.Vector3
---@field radius number
local UnityEngine_SphereCollider = {}
---@return UnityEngine.SphereCollider
function UnityEngine_SphereCollider.New() end

---@class UnityEngine.CharacterController : UnityEngine.Collider
---@field velocity UnityEngine.Vector3
---@field isGrounded boolean
---@field collisionFlags NotExportEnum
---@field radius number
---@field height number
---@field center UnityEngine.Vector3
---@field slopeLimit number
---@field stepOffset number
---@field skinWidth number
---@field minMoveDistance number
---@field detectCollisions boolean
---@field enableOverlapRecovery boolean
local UnityEngine_CharacterController = {}
---@return UnityEngine.CharacterController
function UnityEngine_CharacterController.New() end
---@param speed UnityEngine.Vector3
---@return boolean
function UnityEngine_CharacterController:SimpleMove(speed) end
---@param motion UnityEngine.Vector3
---@return NotExportEnum
function UnityEngine_CharacterController:Move(motion) end

---@class UnityEngine.CapsuleCollider : UnityEngine.Collider
---@field center UnityEngine.Vector3
---@field radius number
---@field height number
---@field direction number
local UnityEngine_CapsuleCollider = {}
---@return UnityEngine.CapsuleCollider
function UnityEngine_CapsuleCollider.New() end

---@class UnityEngine.Animation : UnityEngine.Behaviour
---@field clip UnityEngine.AnimationClip
---@field playAutomatically boolean
---@field wrapMode UnityEngine.WrapMode
---@field isPlaying boolean
---@field Item UnityEngine.AnimationState
---@field animatePhysics boolean
---@field cullingType NotExportEnum
---@field localBounds UnityEngine.Bounds
local UnityEngine_Animation = {}
---@return UnityEngine.Animation
function UnityEngine_Animation.New() end
---@overload fun()
---@param name string
function UnityEngine_Animation:Stop(name) end
---@overload fun(name : string)
function UnityEngine_Animation:Rewind() end
function UnityEngine_Animation:Sample() end
---@param name string
---@return boolean
function UnityEngine_Animation:IsPlaying(name) end
---@overload fun() : boolean
---@overload fun(mode : UnityEngine.PlayMode) : boolean
---@overload fun(animation : string, mode : UnityEngine.PlayMode) : boolean
---@param animation string
---@return boolean
function UnityEngine_Animation:Play(animation) end
---@overload fun(animation : string, fadeLength : number, mode : UnityEngine.PlayMode)
---@overload fun(animation : string, fadeLength : number)
---@param animation string
function UnityEngine_Animation:CrossFade(animation) end
---@overload fun(animation : string, targetWeight : number, fadeLength : number)
---@overload fun(animation : string, targetWeight : number)
---@param animation string
function UnityEngine_Animation:Blend(animation) end
---@overload fun(animation : string, fadeLength : number, queue : UnityEngine.QueueMode, mode : UnityEngine.PlayMode) : UnityEngine.AnimationState
---@overload fun(animation : string, fadeLength : number, queue : UnityEngine.QueueMode) : UnityEngine.AnimationState
---@overload fun(animation : string, fadeLength : number) : UnityEngine.AnimationState
---@param animation string
---@return UnityEngine.AnimationState
function UnityEngine_Animation:CrossFadeQueued(animation) end
---@overload fun(animation : string, queue : UnityEngine.QueueMode, mode : UnityEngine.PlayMode) : UnityEngine.AnimationState
---@overload fun(animation : string, queue : UnityEngine.QueueMode) : UnityEngine.AnimationState
---@param animation string
---@return UnityEngine.AnimationState
function UnityEngine_Animation:PlayQueued(animation) end
---@overload fun(clip : UnityEngine.AnimationClip, newName : string)
---@overload fun(clip : UnityEngine.AnimationClip, newName : string, firstFrame : number, lastFrame : number, addLoopFrame : boolean)
---@param clip UnityEngine.AnimationClip
---@param newName string
---@param firstFrame number
---@param lastFrame number
function UnityEngine_Animation:AddClip(clip, newName, firstFrame, lastFrame) end
---@overload fun(clip : UnityEngine.AnimationClip)
---@param clipName string
function UnityEngine_Animation:RemoveClip(clipName) end
---@return number
function UnityEngine_Animation:GetClipCount() end
---@param layer number
function UnityEngine_Animation:SyncLayer(layer) end
---@return NotExportType
function UnityEngine_Animation:GetEnumerator() end
---@param name string
---@return UnityEngine.AnimationClip
function UnityEngine_Animation:GetClip(name) end

---@class UnityEngine.AnimationClip : UnityEngine.Motion
---@field events NotExportType
---@field length number
---@field frameRate number
---@field wrapMode UnityEngine.WrapMode
---@field localBounds UnityEngine.Bounds
---@field legacy boolean
---@field humanMotion boolean
---@field empty boolean
---@field hasGenericRootTransform boolean
---@field hasMotionFloatCurves boolean
---@field hasMotionCurves boolean
---@field hasRootCurves boolean
local UnityEngine_AnimationClip = {}
---@return UnityEngine.AnimationClip
function UnityEngine_AnimationClip.New() end
---@param evt NotExportType
function UnityEngine_AnimationClip:AddEvent(evt) end
---@param go UnityEngine.GameObject
---@param time number
function UnityEngine_AnimationClip:SampleAnimation(go, time) end
---@param relativePath string
---@param type NotExportType
---@param propertyName string
---@param curve NotExportType
function UnityEngine_AnimationClip:SetCurve(relativePath, type, propertyName, curve) end
function UnityEngine_AnimationClip:EnsureQuaternionContinuity() end
function UnityEngine_AnimationClip:ClearCurves() end

---@class UnityEngine.Motion : UnityEngine.Object
---@field averageDuration number
---@field averageAngularSpeed number
---@field averageSpeed UnityEngine.Vector3
---@field apparentSpeed number
---@field isLooping boolean
---@field legacy boolean
---@field isHumanMotion boolean
local UnityEngine_Motion = {}

---@class UnityEngine.AnimationState : UnityEngine.TrackedReference
---@field enabled boolean
---@field weight number
---@field wrapMode UnityEngine.WrapMode
---@field time number
---@field normalizedTime number
---@field speed number
---@field normalizedSpeed number
---@field length number
---@field layer number
---@field clip UnityEngine.AnimationClip
---@field name string
---@field blendMode UnityEngine.AnimationBlendMode
local UnityEngine_AnimationState = {}
---@return UnityEngine.AnimationState
function UnityEngine_AnimationState.New() end
---@overload fun(mix : UnityEngine.Transform, recursive : boolean)
---@param mix UnityEngine.Transform
function UnityEngine_AnimationState:AddMixingTransform(mix) end
---@param mix UnityEngine.Transform
function UnityEngine_AnimationState:RemoveMixingTransform(mix) end

---@class UnityEngine.AnimationBlendMode
---@field Blend UnityEngine.AnimationBlendMode
---@field Additive UnityEngine.AnimationBlendMode
local UnityEngine_AnimationBlendMode = {}

---@class UnityEngine.QueueMode
---@field CompleteOthers UnityEngine.QueueMode
---@field PlayNow UnityEngine.QueueMode
local UnityEngine_QueueMode = {}

---@class UnityEngine.PlayMode
---@field StopSameLayer UnityEngine.PlayMode
---@field StopAll UnityEngine.PlayMode
local UnityEngine_PlayMode = {}

---@class UnityEngine.WrapMode
---@field Once UnityEngine.WrapMode
---@field Loop UnityEngine.WrapMode
---@field PingPong UnityEngine.WrapMode
---@field Default UnityEngine.WrapMode
---@field ClampForever UnityEngine.WrapMode
---@field Clamp UnityEngine.WrapMode
local UnityEngine_WrapMode = {}

---@class UnityEngine.QualitySettings : UnityEngine.Object
---@field pixelLightCount number
---@field shadows NotExportEnum
---@field shadowProjection NotExportEnum
---@field shadowCascades number
---@field shadowDistance number
---@field shadowResolution NotExportEnum
---@field shadowmaskMode NotExportEnum
---@field shadowNearPlaneOffset number
---@field shadowCascade2Split number
---@field shadowCascade4Split UnityEngine.Vector3
---@field lodBias number
---@field anisotropicFiltering NotExportEnum
---@field masterTextureLimit number
---@field maximumLODLevel number
---@field particleRaycastBudget number
---@field softParticles boolean
---@field softVegetation boolean
---@field vSyncCount number
---@field antiAliasing number
---@field asyncUploadTimeSlice number
---@field asyncUploadBufferSize number
---@field asyncUploadPersistentBuffer boolean
---@field realtimeReflectionProbes boolean
---@field billboardsFaceCameraPosition boolean
---@field resolutionScalingFixedDPIFactor number
---@field blendWeights UnityEngine.BlendWeights
---@field streamingMipmapsActive boolean
---@field streamingMipmapsMemoryBudget number
---@field streamingMipmapsRenderersPerFrame number
---@field streamingMipmapsMaxLevelReduction number
---@field streamingMipmapsAddAllCameras boolean
---@field streamingMipmapsMaxFileIORequests number
---@field maxQueuedFrames number
---@field names NotExportType
---@field desiredColorSpace NotExportEnum
---@field activeColorSpace NotExportEnum
local UnityEngine_QualitySettings = {}
---@overload fun(applyExpensiveChanges : boolean)
function UnityEngine_QualitySettings.IncreaseLevel() end
---@overload fun(applyExpensiveChanges : boolean)
function UnityEngine_QualitySettings.DecreaseLevel() end
---@overload fun(index : number)
---@param index number
---@param applyExpensiveChanges boolean
function UnityEngine_QualitySettings.SetQualityLevel(index, applyExpensiveChanges) end
---@return number
function UnityEngine_QualitySettings.GetQualityLevel() end

---@class UnityEngine.RenderSettings : UnityEngine.Object
---@field fog boolean
---@field fogStartDistance number
---@field fogEndDistance number
---@field fogMode NotExportEnum
---@field fogColor UnityEngine.Color
---@field fogDensity number
---@field ambientMode NotExportEnum
---@field ambientSkyColor UnityEngine.Color
---@field ambientEquatorColor UnityEngine.Color
---@field ambientGroundColor UnityEngine.Color
---@field ambientIntensity number
---@field ambientLight UnityEngine.Color
---@field subtractiveShadowColor UnityEngine.Color
---@field skybox UnityEngine.Material
---@field sun UnityEngine.Light
---@field ambientProbe NotExportType
---@field customReflection NotExportType
---@field reflectionIntensity number
---@field reflectionBounces number
---@field defaultReflectionMode NotExportEnum
---@field defaultReflectionResolution number
---@field haloStrength number
---@field flareStrength number
---@field flareFadeSpeed number
local UnityEngine_RenderSettings = {}

---@class UnityEngine.BlendWeights
---@field OneBone UnityEngine.BlendWeights
---@field TwoBones UnityEngine.BlendWeights
---@field FourBones UnityEngine.BlendWeights
local UnityEngine_BlendWeights = {}

---@class UnityEngine.RenderTexture : UnityEngine.Texture
---@field active UnityEngine.RenderTexture
---@field width number
---@field height number
---@field dimension NotExportEnum
---@field useMipMap boolean
---@field sRGB boolean
---@field format NotExportEnum
---@field vrUsage NotExportEnum
---@field memorylessMode NotExportEnum
---@field autoGenerateMips boolean
---@field volumeDepth number
---@field antiAliasing number
---@field bindTextureMS boolean
---@field enableRandomWrite boolean
---@field useDynamicScale boolean
---@field isPowerOfTwo boolean
---@field colorBuffer NotExportType
---@field depthBuffer NotExportType
---@field depth number
---@field descriptor NotExportType
local UnityEngine_RenderTexture = {}
---@overload fun(desc : NotExportType) : UnityEngine.RenderTexture
---@overload fun(textureToCopy : UnityEngine.RenderTexture) : UnityEngine.RenderTexture
---@overload fun(width : number, height : number, depth : number, format : NotExportEnum) : UnityEngine.RenderTexture
---@overload fun(width : number, height : number, depth : number, format : NotExportEnum, readWrite : NotExportEnum) : UnityEngine.RenderTexture
---@overload fun(width : number, height : number, depth : number, format : NotExportEnum) : UnityEngine.RenderTexture
---@param width number
---@param height number
---@param depth number
---@return UnityEngine.RenderTexture
function UnityEngine_RenderTexture.New(width, height, depth) end
---@param rt UnityEngine.RenderTexture
---@return boolean
function UnityEngine_RenderTexture.SupportsStencil(rt) end
---@param temp UnityEngine.RenderTexture
function UnityEngine_RenderTexture.ReleaseTemporary(temp) end
---@overload fun(desc : NotExportType) : UnityEngine.RenderTexture
---@overload fun(width : number, height : number, depthBuffer : number, format : NotExportEnum, readWrite : NotExportEnum, antiAliasing : number, memorylessMode : NotExportEnum, vrUsage : NotExportEnum, useDynamicScale : boolean) : UnityEngine.RenderTexture
---@overload fun(width : number, height : number, depthBuffer : number, format : NotExportEnum, readWrite : NotExportEnum, antiAliasing : number, memorylessMode : NotExportEnum, vrUsage : NotExportEnum) : UnityEngine.RenderTexture
---@overload fun(width : number, height : number, depthBuffer : number, format : NotExportEnum, readWrite : NotExportEnum, antiAliasing : number, memorylessMode : NotExportEnum) : UnityEngine.RenderTexture
---@overload fun(width : number, height : number, depthBuffer : number, format : NotExportEnum, readWrite : NotExportEnum, antiAliasing : number) : UnityEngine.RenderTexture
---@overload fun(width : number, height : number, depthBuffer : number, format : NotExportEnum, readWrite : NotExportEnum) : UnityEngine.RenderTexture
---@overload fun(width : number, height : number, depthBuffer : number, format : NotExportEnum) : UnityEngine.RenderTexture
---@overload fun(width : number, height : number, depthBuffer : number) : UnityEngine.RenderTexture
---@param width number
---@param height number
---@return UnityEngine.RenderTexture
function UnityEngine_RenderTexture.GetTemporary(width, height) end
---@return NotExportType
function UnityEngine_RenderTexture:GetNativeDepthBufferPtr() end
---@overload fun(discardColor : boolean, discardDepth : boolean)
function UnityEngine_RenderTexture:DiscardContents() end
function UnityEngine_RenderTexture:MarkRestoreExpected() end
---@overload fun()
---@param target UnityEngine.RenderTexture
function UnityEngine_RenderTexture:ResolveAntiAliasedSurface(target) end
---@param propertyName string
function UnityEngine_RenderTexture:SetGlobalShaderProperty(propertyName) end
---@return boolean
function UnityEngine_RenderTexture:Create() end
function UnityEngine_RenderTexture:Release() end
---@return boolean
function UnityEngine_RenderTexture:IsCreated() end
function UnityEngine_RenderTexture:GenerateMips() end
---@param equirect UnityEngine.RenderTexture
---@param eye NotExportEnum
function UnityEngine_RenderTexture:ConvertToEquirect(equirect, eye) end

---@class UnityEngine.Resources : System.Object
local UnityEngine_Resources = {}
---@return UnityEngine.Resources
function UnityEngine_Resources.New() end
---@param type NotExportType
---@return NotExportType
function UnityEngine_Resources.FindObjectsOfTypeAll(type) end
---@overload fun(path : string) : UnityEngine.Object
---@param path string
---@param systemTypeInstance NotExportType
---@return UnityEngine.Object
function UnityEngine_Resources.Load(path, systemTypeInstance) end
---@overload fun(path : string) : NotExportType
---@param path string
---@param type NotExportType
---@return NotExportType
function UnityEngine_Resources.LoadAsync(path, type) end
---@overload fun(path : string, systemTypeInstance : NotExportType) : NotExportType
---@param path string
---@return NotExportType
function UnityEngine_Resources.LoadAll(path) end
---@param type NotExportType
---@param path string
---@return UnityEngine.Object
function UnityEngine_Resources.GetBuiltinResource(type, path) end
---@param assetToUnload UnityEngine.Object
function UnityEngine_Resources.UnloadAsset(assetToUnload) end
---@return UnityEngine.AsyncOperation
function UnityEngine_Resources.UnloadUnusedAssets() end

---@class LuaProfiler : System.Object
---@field list NotExportType
local LuaProfiler = {}
function LuaProfiler.Clear() end
---@param name string
---@return number
function LuaProfiler.GetID(name) end
---@param id number
function LuaProfiler.BeginSample(id) end
function LuaProfiler.EndSample() end

---@class TestExportScript : System.Object
---@field myDelegate NotExportType
---@field intDelegate NotExportType
---@field cameraDelegate NotExportType
local TestExportScript = {}
---@overload fun(callback : NotExportType, number : number)
---@param customDelegate NotExportType
---@param content string
function TestExportScript.TestDelegate(customDelegate, content) end
---@param go UnityEngine.GameObject
function TestExportScript.PrintGameobject(go) end
---@return NotExportType
function TestExportScript.GetDictionary() end

---@class UnityEngine.Debug : System.Object
---@field unityLogger NotExportType
---@field developerConsoleVisible boolean
---@field isDebugBuild boolean
local UnityEngine_Debug = {}
---@return UnityEngine.Debug
function UnityEngine_Debug.New() end
---@overload fun(start : UnityEngine.Vector3, _end : UnityEngine.Vector3, color : UnityEngine.Color, duration : number)
---@overload fun(start : UnityEngine.Vector3, _end : UnityEngine.Vector3, color : UnityEngine.Color)
---@overload fun(start : UnityEngine.Vector3, _end : UnityEngine.Vector3)
---@param start UnityEngine.Vector3
---@param _end UnityEngine.Vector3
---@param color UnityEngine.Color
---@param duration number
---@param depthTest boolean
function UnityEngine_Debug.DrawLine(start, _end, color, duration, depthTest) end
---@overload fun(start : UnityEngine.Vector3, dir : UnityEngine.Vector3, color : UnityEngine.Color, duration : number)
---@overload fun(start : UnityEngine.Vector3, dir : UnityEngine.Vector3, color : UnityEngine.Color)
---@overload fun(start : UnityEngine.Vector3, dir : UnityEngine.Vector3)
---@param start UnityEngine.Vector3
---@param dir UnityEngine.Vector3
---@param color UnityEngine.Color
---@param duration number
---@param depthTest boolean
function UnityEngine_Debug.DrawRay(start, dir, color, duration, depthTest) end
function UnityEngine_Debug.Break() end
function UnityEngine_Debug.DebugBreak() end
---@overload fun(message : System.Object)
---@param message System.Object
---@param context UnityEngine.Object
function UnityEngine_Debug.Log(message, context) end
---@overload fun(format : string, args : NotExportType)
---@param context UnityEngine.Object
---@param format string
---@param args NotExportType
function UnityEngine_Debug.LogFormat(context, format, args) end
---@overload fun(message : System.Object)
---@param message System.Object
---@param context UnityEngine.Object
function UnityEngine_Debug.LogError(message, context) end
---@overload fun(format : string, args : NotExportType)
---@param context UnityEngine.Object
---@param format string
---@param args NotExportType
function UnityEngine_Debug.LogErrorFormat(context, format, args) end
function UnityEngine_Debug.ClearDeveloperConsole() end
---@overload fun(exception : NotExportType)
---@param exception NotExportType
---@param context UnityEngine.Object
function UnityEngine_Debug.LogException(exception, context) end
---@overload fun(message : System.Object)
---@param message System.Object
---@param context UnityEngine.Object
function UnityEngine_Debug.LogWarning(message, context) end
---@overload fun(format : string, args : NotExportType)
---@param context UnityEngine.Object
---@param format string
---@param args NotExportType
function UnityEngine_Debug.LogWarningFormat(context, format, args) end
---@overload fun(condition : boolean)
---@overload fun(condition : boolean, context : UnityEngine.Object)
---@overload fun(condition : boolean, message : System.Object)
---@overload fun(condition : boolean, message : string)
---@overload fun(condition : boolean, message : System.Object, context : UnityEngine.Object)
---@param condition boolean
---@param message string
---@param context UnityEngine.Object
function UnityEngine_Debug.Assert(condition, message, context) end
---@overload fun(condition : boolean, format : string, args : NotExportType)
---@param condition boolean
---@param context UnityEngine.Object
---@param format string
---@param args NotExportType
function UnityEngine_Debug.AssertFormat(condition, context, format, args) end
---@overload fun(message : System.Object)
---@param message System.Object
---@param context UnityEngine.Object
function UnityEngine_Debug.LogAssertion(message, context) end
---@overload fun(format : string, args : NotExportType)
---@param context UnityEngine.Object
---@param format string
---@param args NotExportType
function UnityEngine_Debug.LogAssertionFormat(context, format, args) end

