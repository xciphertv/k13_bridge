---@class IServerFrameworkPlayer:OxClass
---@field private private {Raw: table}
---@field new fun(self: IServerFrameworkPlayer, Raw:table)
---@field getRaw fun(self:IServerFrameworkPlayer):table
---@field getIdentifier fun(self:IServerFrameworkPlayer):string
---@field getName fun(self:IServerFrameworkPlayer):string
---@field setName fun(self:IServerFrameworkPlayer, name:string)
---@field getJob fun(self:IServerFrameworkPlayer):IPlayerJob
---@field setJob fun(self:IServerFrameworkPlayer, name:string, gradeId:number)
---@field getAccountMoney fun(self:IServerFrameworkPlayer, accountName:string):number
---@field setAccountMoney fun(self:IServerFrameworkPlayer, accountName:string, money:number)
---@field addAccountMoney fun(self:IServerFrameworkPlayer, accountName:string, amount:number)
---@field removeAccountMoney fun(self:IServerFrameworkPlayer, accountName:string, amount:number)
---@field getGroup fun(self:IServerFrameworkPlayer):string
---@field setGroup fun(self:IServerFrameworkPlayer, group:string)
---@field getLoadout fun(self:IServerFrameworkPlayer):IPlayerLoadout
---@field getWeapon fun(self:IServerFrameworkPlayer, weaponName:string):ILoadoutItem?
---@field hasWeapon fun(self:IServerFrameworkPlayer, weaponName:string):boolean
---@field addWeapon fun(self:IServerFrameworkPlayer, weaponName:string, ammo:number)
---@field removeWeapon fun(self:IServerFrameworkPlayer, weaponName:string)
---@field setWeaponAmmo fun(self:IServerFrameworkPlayer, weaponName:string, ammo:number)
---@field addWeaponAmmo fun(self:IServerFrameworkPlayer, weaponName:string, amount:number)
---@field removeWeaponAmmo fun(self:IServerFrameworkPlayer, weaponName:string, amount:number)
---@field setWeaponTintIndex fun(self:IServerFrameworkPlayer, weaponName:string, tintIndex:number)
---@field getInventory fun(self:IServerFrameworkPlayer):IPlayerInventory
---@field getInventoryItem fun(self:IServerFrameworkPlayer, itemName:string):IInventoryItem?
---@field addInventoryItem fun(self:IServerFrameworkPlayer, itemName:string, amount:number)
---@field removeInventoryItem fun(self:IServerFrameworkPlayer, itemName:string, amount:number)
---@field setInventoryItemCount fun(self:IServerFrameworkPlayer, itemName:string, count:number)
---@field hasItem fun(self:IServerFrameworkPlayer, itemName:string):boolean
---@field getWeight fun(self:IServerFrameworkPlayer):number
---@field getMaxWeight fun(self:IServerFrameworkPlayer):number
---@field setMaxWeight fun(self:IServerFrameworkPlayer, weight:number)
---@field canCarryItem fun(self:IServerFrameworkPlayer, itemName:string, count:number):boolean
---@field getOwnedVehicles fun(self:IServerFrameworkPlayer):IPlayerOwnedVehicles
local IServerFrameworkPlayer = lib.class("IServerFrameworkPlayer")

function IServerFrameworkPlayer:constructor(Raw)
    self.private.Raw = Raw or {}
end

function IServerFrameworkPlayer:getRaw()
    return self.private.Raw
end

function IServerFrameworkPlayer:getIdentifier()
    error("IServerFrameworkPlayer:getIdentifier is not implemented.")
end

function IServerFrameworkPlayer:getName()
    error("IServerFrameworkPlayer:getName is not implemented.")
end

function IServerFrameworkPlayer:setName(name)
    error("IServerFrameworkPlayer:setName is not implemented.")
end

function IServerFrameworkPlayer:getJob()
    error("IServerFrameworkPlayer:getJob is not implemented.")
end

function IServerFrameworkPlayer:setJob(name, gradeId)
    error("IServerFrameworkPlayer:setJob is not implemented.")
end

function IServerFrameworkPlayer:getAccountMoney(accountName)
    error("IServerFrameworkPlayer:getAccountMoney is not implemented.")
end

function IServerFrameworkPlayer:setAccountMoney(accountName, money)
    error("IServerFrameworkPlayer:setAccountMoney is not implemented.")
end

function IServerFrameworkPlayer:addAccountMoney(accountName, amount)
    error("IServerFrameworkPlayer:addAccountMoney is not implemented.")
end

function IServerFrameworkPlayer:removeAccountMoney(accountName, amount)
    error("IServerFrameworkPlayer:removeAccountMoney is not implemented.")
end

function IServerFrameworkPlayer:getGroup()
    error("IServerFrameworkPlayer:getGroup is not implemented.")
end

function IServerFrameworkPlayer:setGroup(group)
    error("IServerFrameworkPlayer:setGroup is not implemented.")
end

function IServerFrameworkPlayer:getLoadout()
    error("IServerFrameworkPlayer:getLoadout is not implemented.")
end

function IServerFrameworkPlayer:getWeapon(weaponName)
    error("IServerFrameworkPlayer:getWeapon is not implemented.")
end

function IServerFrameworkPlayer:hasWeapon(weaponName)
    error("IServerFrameworkPlayer:hasWeapon is not implemented.")
end

function IServerFrameworkPlayer:addWeapon(weaponName, amount)
    error("IServerFrameworkPlayer:addWeapon is not implemented.")
end

function IServerFrameworkPlayer:removeWeapon(weaponName)
    error("IServerFrameworkPlayer:removeWeapon is not implemented.")
end

function IServerFrameworkPlayer:setWeaponAmmo(weaponName, ammo)
    error("IServerFrameworkPlayer:setWeaponAmmo is not implemented.")
end

function IServerFrameworkPlayer:addWeaponAmmo(weaponName, ammo)
    error("IServerFrameworkPlayer:addWeaponAmmo is not implemented.")
end

function IServerFrameworkPlayer:removeWeaponAmmo(weaponName, amount)
    error("IServerFrameworkPlayer:removeWeaponAmmo is not implemented.")
end

function IServerFrameworkPlayer:setWeaponTintIndex(weaponName, tintIndex)
    error("IServerFrameworkPlayer:setWeaponTintIndex is not implemented.")
end

function IServerFrameworkPlayer:getInventory()
    error("IServerFrameworkPlayer:getInventory is not implemented.")
end

function IServerFrameworkPlayer:getInventoryItem(itemName)
    error("IServerFrameworkPlayer:getInventoryItem is not implemented.")
end

function IServerFrameworkPlayer:addInventoryItem(itemName, amount)
    error("IServerFrameworkPlayer:addInventoryItem is not implemented.")
end

function IServerFrameworkPlayer:removeInventoryItem(itemName, amount)
    error("IServerFrameworkPlayer:removeInventoryItem is not implemented.")
end

function IServerFrameworkPlayer:setInventoryItemCount(itemName, count)
    error("IServerFrameworkPlayer:setInventoryItemCount is not implemented.")
end

function IServerFrameworkPlayer:hasItem(itemName)
    error("IServerFrameworkPlayer:hasItem is not implemented.")
end

function IServerFrameworkPlayer:getWeight()
    error("IServerFrameworkPlayer:getWeight is not implemented.")
end

function IServerFrameworkPlayer:getMaxWeight()
    error("IServerFrameworkPlayer:getMaxWeight is not implemented.")
end

function IServerFrameworkPlayer:setMaxWeight(weight)
    error("IServerFrameworkPlayer:setMaxWeight is not implemented.")
end

function IServerFrameworkPlayer:canCarryItem(itemName, count)
    error("IServerFrameworkPlayer:canCarryItem is not implemented.")
end

function IServerFrameworkPlayer:getOwnedVehicles()
    error("IServerFrameworkPlayer:getOwnedVehicles is not implemented.")
end

return IServerFrameworkPlayer

---@class IPlayerJob
---@field name string
---@field label string
---@field Grade {id:number, name:string, label:string, salary:number}

---@alias IPlayerLoadout ILoadoutItem[]
---@alias IPlayerInventory IInventoryItem[]
---@alias IPlayerOwnedVehicles IOwnedVehicle[]
