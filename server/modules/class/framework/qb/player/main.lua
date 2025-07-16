---@class CQBServerFrameworkPlayer:IServerFrameworkPlayer
---@field super fun(self:CQBServerFrameworkPlayer, Raw:table)
---@field new fun(self: CQBServerFrameworkPlayer, Raw:table):CQBServerFrameworkPlayer
---@field getIdentifier fun(self:CQBServerFrameworkPlayer):string
---@field getName fun(self:CQBServerFrameworkPlayer):string
---@field setName fun(self:CQBServerFrameworkPlayer, name:string)
---@field getJob fun(self:CQBServerFrameworkPlayer):IPlayerJob
---@field setJob fun(self:CQBServerFrameworkPlayer, name:string, gradeId:number)
---@field getAccountMoney fun(self:CQBServerFrameworkPlayer, accountName:string):number
---@field setAccountMoney fun(self:CQBServerFrameworkPlayer, accountName:string, money:number)
---@field addAccountMoney fun(self:CQBServerFrameworkPlayer, accountName:string, amount:number)
---@field removeAccountMoney fun(self:CQBServerFrameworkPlayer, accountName:string, amount:number)
---@field getGroup fun(self:CQBServerFrameworkPlayer):string
---@field setGroup fun(self:CQBServerFrameworkPlayer, group:string)
---@field getLoadout fun(self:CQBServerFrameworkPlayer):IPlayerLoadout
---@field getWeapon fun(self:CQBServerFrameworkPlayer, weaponName:string):ILoadoutItem?
---@field hasWeapon fun(self:CQBServerFrameworkPlayer, weaponName:string):boolean
---@field addWeapon fun(self:CQBServerFrameworkPlayer, weaponName:string, ammo:number)
---@field removeWeapon fun(self:CQBServerFrameworkPlayer, weaponName:string)
---@field setWeaponAmmo fun(self:CQBServerFrameworkPlayer, weaponName:string, ammo:number)
---@field addWeaponAmmo fun(self:CQBServerFrameworkPlayer, weaponName:string, ammo:number)
---@field removeWeaponAmmo fun(self:CQBServerFrameworkPlayer, weaponName:string, amount:number)
---@field setWeaponTintIndex fun(self:CQBServerFrameworkPlayer, weaponName:string, tintIndex:number)
---@field getInventory fun(self:CQBServerFrameworkPlayer):IPlayerInventory
---@field getInventoryItem fun(self:CQBServerFrameworkPlayer, itemName:string):IInventoryItem?
---@field addInventoryItem fun(self:CQBServerFrameworkPlayer, itemName:string, amount:number)
---@field removeInventoryItem fun(self:CQBServerFrameworkPlayer, itemName:string, amount:number)
---@field setInventoryItemCount fun(self:CQBServerFrameworkPlayer, itemName:string, count:number)
---@field hasItem fun(self:CQBServerFrameworkPlayer, itemName:string):boolean
---@field getWeight fun(self:CQBServerFrameworkPlayer):number
---@field getMaxWeight fun(self:CQBServerFrameworkPlayer):number
---@field setMaxWeight fun(self:CQBServerFrameworkPlayer, weight:number)
---@field canCarryItem fun(self:CQBServerFrameworkPlayer, itemName:string, count:number):boolean
local CQBServerFrameworkPlayer = lib.class("CQBServerFrameworkPlayer",
    require("server.modules.interface.framework.player.main"))

function CQBServerFrameworkPlayer:constructor(Raw)
    self:super(Raw)

    return self
end

function CQBServerFrameworkPlayer:getIdentifier()
    return self:getRaw().PlayerData.citizenid
end

function CQBServerFrameworkPlayer:getName()
    return self:getRaw().PlayerData.charinfo.firstname .. " " .. self:getRaw().PlayerData.charinfo.lastname
end

function CQBServerFrameworkPlayer:setName(name)
    local firstName, lastName = name:match("^(%S+)%s+(%S+)$") ---@type string?, string?

    if (not firstName or not lastName) then
        return
    end

    self:getRaw().PlayerData.charinfo.firstname = firstName
    self:getRaw().PlayerData.charinfo.lastname = lastName
    self:getRaw().Functions.UpdatePlayerData(false)
end

function CQBServerFrameworkPlayer:getJob()
    local Job = self:getRaw().PlayerData.job

    return {
        name = Job.name,
        label = Job.label,
        Grade = {
            id = Job.grade.level,
            name = Job.grade.name,
            label = Job.grade.name,
            salary = tonumber(Job.payment) or 0
        }
    } --[[@as IPlayerJob]]
end

function CQBServerFrameworkPlayer:setJob(name, gradeId)
    self:getRaw().Functions.SetJob(name, gradeId)
end

function CQBServerFrameworkPlayer:getAccountMoney(accountName)
    return self:getRaw().Functions.GetMoney(accountName)
end

function CQBServerFrameworkPlayer:setAccountMoney(accountName, money)
    self:getRaw().Functions.SetMoney(accountName, money)
end

function CQBServerFrameworkPlayer:addAccountMoney(accountName, amount)
    self:getRaw().Functions.AddMoney(accountName, amount)
end

function CQBServerFrameworkPlayer:removeAccountMoney(accountName, amount)
    self:getRaw().Functions.RemoveMoney(accountName, amount)
end

function CQBServerFrameworkPlayer:getGroup()
    error("TO BE IMPLEMENTED")
end

function CQBServerFrameworkPlayer:setGroup(group)
    error("TO BE IMPLEMENTED")
end

function CQBServerFrameworkPlayer:getLoadout()
    local PlayerLoadout = {} ---@type IPlayerLoadout

    for slotId, RawInventoryItem in pairs(self:getRaw().PlayerData.items) do
        if (RawInventoryItem.type == "weapon") then
            PlayerLoadout[#PlayerLoadout + 1] = {
                name = RawInventoryItem.name,
                label = RawInventoryItem.label,
                ammo = RawInventoryItem.info?.ammo or 0,
                tintIndex = RawInventoryItem.info?.tint or 0
            }
        end
    end

    return PlayerLoadout
end

function CQBServerFrameworkPlayer:getWeapon(weaponName)
    local RawInventoryItem = self:getRaw().Functions.GetItemByName(weaponName)

    if (not RawInventoryItem) then
        return
    end

    return {
        name = RawInventoryItem.name,
        label = RawInventoryItem.label,
        ammo = RawInventoryItem.info?.ammo or 0,
        tintIndex = RawInventoryItem.info?.tint or 0
    } --[[@as ILoadoutItem]]
end

function CQBServerFrameworkPlayer:hasWeapon(weaponName)
    return self:getRaw().Functions.HasItem(weaponName, 1)
end

function CQBServerFrameworkPlayer:addWeapon(weaponName, ammo)
    self:getRaw().Functions.AddItem(weaponName, 1, false, { ammo = ammo }, "")
end

function CQBServerFrameworkPlayer:removeWeapon(weaponName)
    self:getRaw().Functions.RemoveItem(weaponName, 1, false, "")
end

function CQBServerFrameworkPlayer:setWeaponAmmo(weaponName, ammo)
    local RawInventoryItem = self:getRaw().Functions.GetItemByName(weaponName)
    if (not RawInventoryItem) then
        return
    end

    self:getRaw().PlayerData.items[RawInventoryItem.slot].info.ammo = ammo
    self:getRaw().Functions.SetInventory(self:getRaw().PlayerData.items, true)
end

function CQBServerFrameworkPlayer:addWeaponAmmo(weaponName, amount)
    local RawInventoryItem = self:getRaw().Functions.GetItemByName(weaponName)
    if (not RawInventoryItem) then
        return
    end

    local newAmmo = self:getRaw().PlayerData.items[RawInventoryItem.slot].info.ammo + amount
    self:getRaw().PlayerData.items[RawInventoryItem.slot].info.ammo = newAmmo
    self:getRaw().Functions.SetInventory(self:getRaw().PlayerData.items, true)
end

function CQBServerFrameworkPlayer:removeWeaponAmmo(weaponName, amount)
    local RawInventoryItem = self:getRaw().Functions.GetItemByName(weaponName)
    if (not RawInventoryItem) then
        return
    end

    local newAmmo = self:getRaw().PlayerData.items[RawInventoryItem.slot].info.ammo - amount
    self:getRaw().PlayerData.items[RawInventoryItem.slot].info.ammo = newAmmo
    self:getRaw().Functions.SetInventory(self:getRaw().PlayerData.items, true)
end

function CQBServerFrameworkPlayer:setWeaponTintIndex(weaponName, tintIndex)
    error("TO BE IMPLEMENTED")
end

function CQBServerFrameworkPlayer:getInventory()
    local PlayerInventory = {} ---@type IPlayerInventory

    for slotId, RawInventoryItem in pairs(self:getRaw().PlayerData.items) do
        if (RawInventoryItem.type == "item") then
            PlayerInventory[#PlayerInventory + 1] = {
                name = RawInventoryItem.name,
                label = RawInventoryItem.label,
                count = RawInventoryItem.amount,
                weight = RawInventoryItem.weight
            }
        end
    end

    return PlayerInventory
end

function CQBServerFrameworkPlayer:getInventoryItem(itemName)
    local RawInventoryItem = self:getRaw().Functions.GetItemByName(itemName)

    if (not RawInventoryItem) then
        return
    end

    return {
        name = RawInventoryItem.name,
        label = RawInventoryItem.label,
        count = RawInventoryItem.amount,
        weight = RawInventoryItem.weight
    } --[[@as IInventoryItem]]
end

function CQBServerFrameworkPlayer:addInventoryItem(itemName, amount)
    self:getRaw().Functions.AddItem(itemName, amount, false, false, "")
end

function CQBServerFrameworkPlayer:removeInventoryItem(itemName, amount)
    self:getRaw().Functions.RemoveItem(itemName, amount, false, false, "")
end

function CQBServerFrameworkPlayer:setInventoryItemCount(itemName, count)
    local RawInventoryItem = self:getRaw().Functions.GetItemByName(itemName)
    if (not RawInventoryItem) then
        return
    end

    self:getRaw().PlayerData.items[RawInventoryItem.slot].amount = count
    self:getRaw().Functions.SetInventory(self:getRaw().PlayerData.items, true)
end

function CQBServerFrameworkPlayer:hasItem(itemName)
    return self:getRaw().Functions.HasItem(itemName, 1)
end

function CQBServerFrameworkPlayer:getWeight()
    local RawInventory = self:getRaw().PlayerData.items

    return exports["qb-inventory"]:GetTotalWeight(RawInventory)
end

function CQBServerFrameworkPlayer:getMaxWeight()
    error("TO BE IMPLEMENTED")
end

function CQBServerFrameworkPlayer:setMaxWeight(weight)
    error("TO BE IMPLEMENTED")
end

function CQBServerFrameworkPlayer:canCarryItem(itemName, count)
    local canCarry, reason = exports["qb-inventory"]:CanCarryItem(self:getRaw().PlayerData.source, itemName, count) ---@type boolean, string

    return canCarry
end

return CQBServerFrameworkPlayer
