---@class CESXClientFramework:IClientFramework
---@field super fun(self:CESXClientFramework, framework:Framework, Raw:table)
---@field new fun(self: CESXClientFramework):CESXClientFramework
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
