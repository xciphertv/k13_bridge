---@class IServerFramework:OxClass
---@field private private {framework:Framework, Raw:table}
---@field new fun(self: IServerFramework, framework:Framework, Raw:table)
---@field getName fun(self: IServerFramework): Framework
---@field getRaw fun(self: IServerFramework): table
---@field getPlayerFromId fun(self:IServerFramework, src:number):IServerFrameworkPlayer?
---@field getPlayerFromIdentifier fun(self:IServerFramework, identifier:string):IServerFrameworkPlayer?
---@field registerUsableItem fun(self:IServerFramework, itemName:string, cb:fun(src:number))
---@field getItems fun(self:IServerFramework): IItem[]
---@field getItemLabel fun(self:IServerFramework, itemName:string):string?
local IServerFramework = lib.class("IServerFramework")

function IServerFramework:constructor(framework, Raw)
	self.private.framework = framework
	self.private.Raw = Raw or {}
end

function IServerFramework:getName()
	return self.private.framework
end

function IServerFramework:getRaw()
	return self.private.Raw
end

function IServerFramework:getPlayerFromId(src)
	error("Framework:getPlayerFromId is not implemented for this framework: " .. self:getName())
end

function IServerFramework:getPlayerFromIdentifier(identifier)
	error("Framework:getPlayerFromIdentifier is not implemented for this framework: " .. self:getName())
end

function IServerFramework:registerUsableItem(itemName, cb)
	error("Framework:registerUsableItem is not implemented for this framework: " .. self:getName())
end

function IServerFramework:getItems()
	error("Framework:getItems is not implemented for this framework: " .. self:getName())
end

function IServerFramework:getItemLabel(itemName)
	error("Framework:getItemLabel is not implemented for this framework: " .. self:getName())
end

return IServerFramework

---@class IItem
---@field name string
---@field label string
---@field weight number
