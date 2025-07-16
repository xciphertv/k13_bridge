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
        self:getRaw().PlayerData = xPlayer
        while (not self:getRaw().PlayerData.ped or not DoesEntityExist(self:getRaw().PlayerData.ped)) do
            Citizen.Wait(0)
        end
        self:getRaw().PlayerLoaded = true
    end)

    RegisterNetEvent("esx:onPlayerLogout", function()
        self:getRaw().PlayerLoaded = false
        self:getRaw().PlayerData = {}
    end)

    return self
end
