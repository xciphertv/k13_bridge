---@class CESXServerFramework:CServerFramework
---@field constructor fun(self: CESXServerFramework):CESXServerFramework
local CESXServerFramework = lib.class("CESXServerFramework", require("server.modules.interface.framework.main"))

function CESXServerFramework:constructor()
	self:super("esx", exports.es_extended:getSharedObject())

	return self
end

return function()
	return CESXServerFramework:new()
end
