---@class CServerFramework:OxClass
---@field private private {Raw: table, framework:Framework}
---@field constructor fun(self: CServerFramework, framework:Framework, Raw:table)
---@field getName fun(self: CServerFramework): Framework
---@field getRaw fun(self: CServerFramework): table
---@field getPlayerFromId fun(self:CServerFramework, src:number):CServerFrameworkPlayer
local CServerFramework = lib.class("CServerFramework")

function CServerFramework:constructor(framework, Raw)
	self.private.framework = framework
	self.private.Raw = Raw or {}
end

function CServerFramework:getName()
	return self.private.framework
end

function CServerFramework:getRaw()
	return self.private.Raw
end

function CServerFramework:getPlayerFromId(src)
	error("Framework:getPlayerFromId is not implemented for this framework: " .. self:getName())
end

return CServerFramework
