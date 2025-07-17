---@class CESXServerFrameworkPlayer:IServerFrameworkPlayer
---@field super fun(self:CESXServerFrameworkPlayer, Raw:table)
---@field new fun(self: CESXServerFrameworkPlayer, Raw:table):CESXServerFrameworkPlayer
---@field getIdentifier fun(self:CESXServerFrameworkPlayer):string
---@field getName fun(self:CESXServerFrameworkPlayer):string
---@field setName fun(self:CESXServerFrameworkPlayer, name:string)
---@field getJob fun(self:CESXServerFrameworkPlayer):IPlayerJob
---@field setJob fun(self:CESXServerFrameworkPlayer, name:string, gradeId:number)
---@field getAccountMoney fun(self:CESXServerFrameworkPlayer, accountName:string):number
---@field setAccountMoney fun(self:CESXServerFrameworkPlayer, accountName:string, money:number)
---@field addAccountMoney fun(self:CESXServerFrameworkPlayer, accountName:string, amount:number)
---@field removeAccountMoney fun(self:CESXServerFrameworkPlayer, accountName:string, amount:number)
---@field getGroup fun(self:CESXServerFrameworkPlayer):string
---@field setGroup fun(self:CESXServerFrameworkPlayer, group:string)
---@field getLoadout fun(self:CESXServerFrameworkPlayer):IPlayerLoadout
---@field getWeapon fun(self:CESXServerFrameworkPlayer, weaponName:string):ILoadoutItem?
---@field hasWeapon fun(self:CESXServerFrameworkPlayer, weaponName:string):boolean
---@field addWeapon fun(self:CESXServerFrameworkPlayer, weaponName:string, ammo:number)
---@field removeWeapon fun(self:CESXServerFrameworkPlayer, weaponName:string)
---@field setWeaponAmmo fun(self:CESXServerFrameworkPlayer, weaponName:string, ammo:number)
---@field addWeaponAmmo fun(self:CESXServerFrameworkPlayer, weaponName:string, amount:number)
---@field removeWeaponAmmo fun(self:CESXServerFrameworkPlayer, weaponName:string, amount:number)
---@field setWeaponTintIndex fun(self:CESXServerFrameworkPlayer, weaponName:string, tintIndex:number)
---@field getInventory fun(self:CESXServerFrameworkPlayer):IPlayerInventory
---@field getInventoryItem fun(self:CESXServerFrameworkPlayer, itemName:string):IInventoryItem?
---@field addInventoryItem fun(self:CESXServerFrameworkPlayer, itemName:string, amount:number)
---@field removeInventoryItem fun(self:CESXServerFrameworkPlayer, itemName:string, amount:number)
---@field setInventoryItemCount fun(self:CESXServerFrameworkPlayer, itemName:string, count:number)
---@field hasItem fun(self:CESXServerFrameworkPlayer, itemName:string):boolean
---@field getWeight fun(self:CESXServerFrameworkPlayer):number
---@field getMaxWeight fun(self:CESXServerFrameworkPlayer):number
---@field setMaxWeight fun(self:CESXServerFrameworkPlayer, weight:number)
---@field canCarryItem fun(self:CESXServerFrameworkPlayer, itemName:string, count:number):boolean
local CESXServerFrameworkPlayer = lib.class("CESXServerFrameworkPlayer",
    require("server.modules.interface.framework.player.main"))

function CESXServerFrameworkPlayer:constructor(Raw)
    self:super(Raw)

    return self
end

function CESXServerFrameworkPlayer:getIdentifier()
    return self:getRaw().getIdentifier()
end

function CESXServerFrameworkPlayer:getName()
    return self:getRaw().getName()
end

function CESXServerFrameworkPlayer:setName(name)
    self:getRaw().setName(name)
end

function CESXServerFrameworkPlayer:getJob()
    local RawJob = self:getRaw().getJob()

    return {
        name = RawJob.name,
        label = RawJob.label,
        Grade = {
            id = RawJob.grade,
            name = RawJob.grade_name,
            label = RawJob.grade_label,
            salary = tonumber(RawJob.grade_salary) or 0
        }
    } --[[@as IPlayerJob]]
end

function CESXServerFrameworkPlayer:setJob(name, gradeId)
    self:getRaw().setJob(name, gradeId)
end

function CESXServerFrameworkPlayer:getAccountMoney(accountName)
    return self:getRaw().getAccount(accountName)?.money or 0
end

function CESXServerFrameworkPlayer:setAccountMoney(accountName, money)
    self:getRaw().setAccountMoney(accountName, money)
end

function CESXServerFrameworkPlayer:addAccountMoney(accountName, amount)
    self:getRaw().addAccountMoney(accountName, amount)
end

function CESXServerFrameworkPlayer:removeAccountMoney(accountName, amount)
    self:getRaw().removeAccountMoney(accountName, amount)
end

function CESXServerFrameworkPlayer:getGroup()
    return self:getRaw().getGroup()
end

function CESXServerFrameworkPlayer:setGroup(group)
    self:getRaw().setGroup(group)
end

function CESXServerFrameworkPlayer:getLoadout()
    local PlayerLoadout = {} ---@type IPlayerLoadout
    local RawLoadout = self:getRaw().getLoadout(false)

    for i = 1, #RawLoadout do
        local RawLoadoutItem = RawLoadout[i]

        PlayerLoadout[i] = {
            name = RawLoadoutItem.name,
            label = RawLoadoutItem.label,
            ammo = RawLoadoutItem.ammo or 0,
            tintIndex = RawLoadoutItem.tintIndex or 0
        }
    end

    return PlayerLoadout
end

function CESXServerFrameworkPlayer:getWeapon(weaponName)
    local RawWeapon = self:getRaw().getWeapon(weaponName)

    if (not RawWeapon) then
        return
    end

    return {
        name = RawWeapon.name,
        label = RawWeapon.label,
        ammo = RawWeapon.ammo or 0,
        tintIndex = RawWeapon.tintIndex or 0
    } --[[@as ILoadoutItem]]
end

function CESXServerFrameworkPlayer:hasWeapon(weaponName)
    return self:getRaw().hasWeapon(weaponName)
end

function CESXServerFrameworkPlayer:addWeapon(weaponName, ammo)
    self:getRaw().addWeapon(weaponName, ammo)
end

function CESXServerFrameworkPlayer:removeWeapon(weaponName)
    self:getRaw().removeWeapon(weaponName)
end

function CESXServerFrameworkPlayer:setWeaponAmmo(weaponName, ammo)
    self:getRaw().updateWeaponAmmo(weaponName, ammo)
end

function CESXServerFrameworkPlayer:addWeaponAmmo(weaponName, amount)
    self:getRaw().addWeaponAmmo(weaponName, amount)
end

function CESXServerFrameworkPlayer:removeWeaponAmmo(weaponName, amount)
    self:getRaw().removeWeaponAmmo(weaponName, amount)
end

function CESXServerFrameworkPlayer:setWeaponTintIndex(weaponName, tintIndex)
    self:getRaw().setWeaponTint(weaponName, tintIndex)
end

function CESXServerFrameworkPlayer:getInventory()
    local PlayerInventory = {} ---@type IPlayerInventory
    local RawInventory = self:getRaw().getInventory(false)

    for i, RawInventoryItem in ipairs(RawInventory) do
        if (RawInventoryItem.count > 0) then
            PlayerInventory[#PlayerInventory + 1] = {
                name = RawInventoryItem.name,
                label = RawInventoryItem.label,
                count = RawInventoryItem.count,
                weight = RawInventoryItem.weight,
            }
        end
    end

    return PlayerInventory
end

function CESXServerFrameworkPlayer:getInventoryItem(itemName)
    local RawInventoryItem = self:getRaw().getInventoryItem(itemName)

    if (not RawInventoryItem) then
        return
    end

    return {
        name = itemName,
        label = RawInventoryItem.label,
        count = RawInventoryItem.count,
        weight = RawInventoryItem.weight,
    } --[[@as IInventoryItem]]
end

function CESXServerFrameworkPlayer:addInventoryItem(itemName, amount)
    self:getRaw().addInventoryItem(itemName, amount)
end

function CESXServerFrameworkPlayer:removeInventoryItem(itemName, amount)
    self:getRaw().removeInventoryItem(itemName, amount)
end

function CESXServerFrameworkPlayer:setInventoryItemCount(itemName, count)
    self:getRaw().setInventoryItem(itemName, count)
end

function CESXServerFrameworkPlayer:hasItem(itemName)
    return self:getRaw().hasItem(itemName)
end

function CESXServerFrameworkPlayer:getWeight()
    return self:getRaw().getWeight()
end

function CESXServerFrameworkPlayer:getMaxWeight()
    return self:getRaw().getMaxWeight()
end

function CESXServerFrameworkPlayer:setMaxWeight(weight)
    self:getRaw().setMaxWeight(weight)
end

function CESXServerFrameworkPlayer:canCarryItem(itemName, count)
    return self:getRaw().canCarryItem(itemName, count)
end

return CESXServerFrameworkPlayer
