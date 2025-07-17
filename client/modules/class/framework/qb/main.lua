---@class CQBClientFramework:IClientFramework
---@field super fun(self:CQBClientFramework, framework:Framework, Raw:table)
---@field new fun(self: CQBClientFramework):CQBClientFramework
---@field isPlayerLoaded fun(self: CQBClientFramework):boolean
---@field getPlayerGroup fun(self: CQBClientFramework):string
---@field getPlayerIdentifier fun(self: CQBClientFramework):string
---@field getPlayerInventory fun(self: CQBClientFramework):IPlayerInventory
---@field getPlayerJob fun(self: CQBClientFramework):IPlayerJob
---@field getPlayerLoadout fun(self: CQBClientFramework):IPlayerLoadout
---@field getPlayerName fun(self: CQBClientFramework):string
---@field getPlayerWeight fun(self: CQBClientFramework):number
---@field getPlayerMaxWeight fun(self: CQBClientFramework):number
---@field getPlayerDoB fun(self:CQBClientFramework):string
---@field getPlayerHeight fun(self:CQBClientFramework):number
---@field getPlayerSex fun(self:CQBClientFramework):PlayerSex
---@field getAccountMoney fun(self:CQBClientFramework, accountName:string):number
local CQBClientFramework = lib.class("CQBClientFramework", require("client.modules.interface.framework.main"))

function CQBClientFramework:constructor()
    self:super("qb", exports["qb-core"]:GetCoreObject())

    RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
        local RawFramework = self:getRaw()
        RawFramework.PlayerData = RawFramework.Functions.GetPlayerData()
        RawFramework.isPlayerLoaded = true
    end)

    RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
        local RawFramework = self:getRaw()
        RawFramework.PlayerData = nil
        RawFramework.isPlayerLoaded = false
    end)

    RegisterNetEvent("QBCore:Player:SetPlayerData", function(val)
        self:getRaw().PlayerData = val
    end)

    return self
end

function CQBClientFramework:isPlayerLoaded()
    return self:getRaw().isPlayerLoaded == true
end

function CQBClientFramework:getPlayerGroup()
    error("TO BE IMPLEMENTED")
end

function CQBClientFramework:getPlayerIdentifier()
    return self:getRaw().PlayerData.citizenid
end

function CQBClientFramework:getPlayerInventory()
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

function CQBClientFramework:getPlayerJob()
    local RawJob = self:getRaw().PlayerData.job

    return {
        name = RawJob.name,
        label = RawJob.label,
        Grade = {
            id = RawJob.grade.level,
            name = RawJob.grade.name,
            label = RawJob.grade.name,
            salary = tonumber(RawJob.payment) or 0
        }
    } --[[@as IPlayerJob]]
end

function CQBClientFramework:getPlayerLoadout()
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

function CQBClientFramework:getPlayerName()
    local RawFramework = self:getRaw()
    return ("%s %s"):format(RawFramework.PlayerData.charinfo.firstname, RawFramework.PlayerData.charinfo.lastname)
end

function CQBClientFramework:getPlayerWeight()
    error("TO BE IMPLEMENTED")
end

function CQBClientFramework:getPlayerMaxWeight()
    error("TO BE IMPLEMENTED")
end

function CQBClientFramework:getPlayerDoB()
    return self:getRaw().PlayerData.charinfo.birthdate
end

function CQBClientFramework:getPlayerHeight()
    error("TO BE IMPLEMENTED")
end

function CQBClientFramework:getPlayerSex()
    return self:getRaw().PlayerData.charinfo.gender == 0 and "male" or "female"
end

function CQBClientFramework:getAccountMoney(accountName)
    return self:getRaw().PlayerData.money[accountName] or 0
end

return CQBClientFramework
