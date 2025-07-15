---@class CESXServerFramework:CServerFramework
---@field new fun(self: CESXServerFramework):CESXServerFramework
---@field getPlayerFromId fun(self:CESXServerFramework, src:number):CESXServerFrameworkPlayer?
local CESXServerFramework = lib.class("CESXServerFramework", require("server.modules.interface.framework.main"))

function CESXServerFramework:constructor()
	self:super("esx", exports.es_extended:getSharedObject())

	return self
end

function CESXServerFramework:getPlayerFromId(src)
	local xPlayer = self:getRaw().GetPlayerFromId(src)
	if (not xPlayer) then
		return
	end

	require("server.modules.class.framework.esx.player.main"):new(xPlayer)
end

return CESXServerFramework
