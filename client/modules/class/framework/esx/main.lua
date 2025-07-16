---@class CESXClientFramework:IClientFramework
---@field super fun(self:CESXClientFramework, framework:Framework, Raw:table)
---@field new fun(self: CESXClientFramework):CESXClientFramework
---@field isPlayerLoaded fun(self: CESXClientFramework):boolean
---@field getPlayerGroup fun(self: CESXClientFramework):string
---@field getPlayerIdentifier fun(self: CESXClientFramework):string
---@field getPlayerInventory fun(self: CESXClientFramework):IPlayerInventory
---@field getPlayerJob fun(self: CESXClientFramework):IPlayerJob
---@field getPlayerLoadout fun(self: CESXClientFramework):IPlayerLoadout
---@field getPlayerName fun(self: CESXClientFramework):string
---@field getPlayerWeight fun(self: CESXClientFramework):number
---@field getPlayerMaxWeight fun(self: CESXClientFramework):number
---@field getPlayerDoB fun(self:CESXClientFramework):string
---@field getPlayerHeight fun(self:CESXClientFramework):number
---@field getPlayerSex fun(self:CESXClientFramework):PlayerSex
---@field getAccountMoney fun(self:CESXClientFramework, accountName:string):number
local CESXClientFramework = lib.class("CESXClientFramework", require("client.modules.interface.framework.main"))

function CESXClientFramework:constructor()
    self:super("esx", exports.es_extended:getSharedObject())

    AddEventHandler("esx:setPlayerData", function(key, val, last)
        if (GetInvokingResource() == "es_extended") then
            self:getRaw().PlayerData[key] = val
        end
    end)

    RegisterNetEvent("esx:playerLoaded", function(xPlayer)
        local RawFramework = self:getRaw()
        RawFramework.PlayerData = xPlayer
        while (not RawFramework.PlayerData.ped or not DoesEntityExist(RawFramework.PlayerData.ped)) do
            Citizen.Wait(0)
        end
        RawFramework.PlayerLoaded = true
    end)

    RegisterNetEvent("esx:onPlayerLogout", function()
        local RawFramework = self:getRaw()
        RawFramework.PlayerLoaded = false
        RawFramework.PlayerData = {}
    end)

    return self
end

function CESXClientFramework:isPlayerLoaded()
    return self:getRaw().PlayerLoaded
end

function CESXClientFramework:getPlayerGroup()
    return self:getRaw().PlayerData.group
end

function CESXClientFramework:getPlayerIdentifier()
    return self:getRaw().PlayerData.identifier
end

function CESXClientFramework:getPlayerInventory()
    local PlayerInventory = {} ---@type IPlayerInventory
    local RawInventory = self:getRaw().PlayerData.inventory

    for itemName, RawInventoryItem in pairs(RawInventory) do
        PlayerInventory[#PlayerInventory + 1] = {
            name = itemName,
            label = RawInventoryItem.label,
            count = RawInventoryItem.count,
            weight = RawInventoryItem.weight,
        }
    end

    return PlayerInventory
end

function CESXClientFramework:getPlayerJob()
    local RawJob = self:getRaw().PlayerData.job

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

function CESXClientFramework:getPlayerLoadout()
    local PlayerLoadout = {} ---@type IPlayerLoadout
    local RawLoadout = self:getRaw().PlayerData.loadout

    for i, RawLoadoutItem in ipairs(RawLoadout) do
        PlayerLoadout[i] = {
            name = RawLoadoutItem.name,
            label = RawLoadoutItem.label,
            ammo = RawLoadoutItem.ammo or 0,
            tintIndex = RawLoadoutItem.tintIndex or 0
        }
    end

    return PlayerLoadout
end

function CESXClientFramework:getPlayerName()
    return self:getRaw().PlayerData.name
end

function CESXClientFramework:getPlayerWeight()
    return self:getRaw().PlayerData.weight
end

function CESXClientFramework:getPlayerMaxWeight()
    return self:getRaw().PlayerData.maxWeight
end

function CESXClientFramework:getPlayerDoB()
    return self:getRaw().PlayerData.dateofbirth
end

function CESXClientFramework:getPlayerHeight()
    return self:getRaw().PlayerData.height
end

function CESXClientFramework:getPlayerSex()
    return self:getRaw().PlayerData.sex == 0 and "male" or "female"
end

function CESXClientFramework:getAccountMoney(accountName)
    local RawAccounts = self:getRaw().PlayerData.accounts

    for i = 1, #RawAccounts do
        local RawAccount = RawAccounts[i]

        if (RawAccount.name == accountName) then
            return RawAccount.money
        end
    end

    return 0
end
