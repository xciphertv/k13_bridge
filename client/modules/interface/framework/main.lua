---@class IClientFramework:OxClass
---@field private private {framework:Framework, Raw:table}
---@field new fun(self: IClientFramework, framework:Framework, Raw:table)
---@field getName fun(self: IClientFramework):Framework
---@field getRaw fun(self: IClientFramework):table
---@field isPlayerLoaded fun(self: IClientFramework):boolean
---@field getPlayerGroup fun(self: IClientFramework):string
---@field getPlayerIdentifier fun(self: IClientFramework):string
---@field getPlayerInventory fun(self: IClientFramework):IPlayerInventory
---@field getPlayerLoadout fun(self: IClientFramework):IPlayerLoadout
---@field getPlayerJob fun(self: IClientFramework):IPlayerJob
---@field getPlayerName fun(self: IClientFramework):string
---@field getPlayerWeight fun(self: IClientFramework):number
---@field getPlayerMaxWeight fun(self: IClientFramework):number
---@field getPlayerDoB fun(self: IClientFramework):string
---@field getPlayerHeight fun(self:IClientFramework):number
---@field getPlayerSex fun(self:IClientFramework):PlayerSex
---@field getAccountMoney fun(self:IClientFramework, accountName:string):number
---@field getVehicleProperties fun(self:IClientFramework, vehicle:number):VehicleProperties?
---@field setVehicleProperties fun(self:IClientFramework, vehicle:number, VehicleProperties:JSON<VehicleProperties>|VehicleProperties, fixVehicle:boolean):boolean
local IClientFramework = lib.class("IClientFramework")

function IClientFramework:constructor(framework, Raw)
    self.private.framework = framework
    self.private.Raw = Raw
end

function IClientFramework:getName()
    return self.private.framework
end

function IClientFramework:getRaw()
    return self.private.Raw
end

function IClientFramework:isPlayerLoaded()
    error("isPlayerLoaded is not implemented in " .. self:getName())
end

function IClientFramework:getPlayerGroup()
    error("getPlayerGroup is not implemented in " .. self:getName())
end

function IClientFramework:getPlayerIdentifier()
    error("getPlayerIdentifier is not implemented in " .. self:getName())
end

function IClientFramework:getPlayerInventory()
    error("getPlayerInventory is not implemented in " .. self:getName())
end

function IClientFramework:getPlayerJob()
    error("getPlayerJob is not implemented in " .. self:getName())
end

function IClientFramework:getPlayerLoadout()
    error("getPlayerLoadout is not implemented in " .. self:getName())
end

function IClientFramework:getPlayerName()
    error("getPlayerName is not implemented in " .. self:getName())
end

function IClientFramework:getPlayerWeight()
    error("getPlayerWeight is not implemented in " .. self:getName())
end

function IClientFramework:getPlayerMaxWeight()
    error("getPlayerMaxWeight is not implemented in " .. self:getName())
end

function IClientFramework:getPlayerDoB()
    error("getPlayerDoB is not implemented in " .. self:getName())
end

function IClientFramework:getPlayerHeight()
    error("getPlayerHeight is not implemented in " .. self:getName())
end

function IClientFramework:getPlayerSex()
    error("getPlayerSex is not implemented in " .. self:getName())
end

function IClientFramework:getAccountMoney(accountName)
    error("getAccountMoney is not implemented in " .. self:getName())
end

function IClientFramework:getVehicleProperties(vehicle)
    return lib.getVehicleProperties(vehicle)
end

function IClientFramework:setVehicleProperties(vehicle, VehicleProperties, fixVehicle)
    local DecodedVehicleProperties = type(VehicleProperties) == "string" and json.decode(VehicleProperties) or
        VehicleProperties --[[@as VehicleProperties]]
    return lib.setVehicleProperties(vehicle, DecodedVehicleProperties, fixVehicle)
end

return IClientFramework

---@alias PlayerSex "male"|"female"
