---@class CESXServerFrameworkPlayer:IServerFrameworkPlayer
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
---@field addWeapon fun(self:CESXServerFrameworkPlayer, weaponName:string, ammo:number)
---@field setWeaponAmmo fun(self:CESXServerFrameworkPlayer, weaponName:string, ammo:number)
---@field addWeaponAmmo fun(self:CESXServerFrameworkPlayer, weaponName:string, ammo:number)
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
    local Job = self:getRaw().getJob()

    return {
        name = Job.name,
        label = Job.label,
        Grade = {
            id = Job.grade,
            name = Job.grade_name,
            label = Job.grade_label,
            salary = tonumber(Job.grade_salary) or 0
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

function CESXServerFrameworkPlayer:addWeapon(weaponName, ammo)
    self:getRaw().addWeapon(weaponName, ammo)
end

function CESXServerFrameworkPlayer:setWeaponAmmo(weaponName, ammo)
    self:getRaw().updateWeaponAmmo(weaponName, ammo)
end

function CESXServerFrameworkPlayer:addWeaponAmmo(weaponName, ammo)
    self:getRaw().addWeaponAmmo(weaponName, ammo)
end

return CESXServerFrameworkPlayer
