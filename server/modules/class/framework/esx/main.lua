---@class CESXServerFramework:IServerFramework
---@field new fun(self: CESXServerFramework):CESXServerFramework
---@field getPlayerFromId fun(self:CESXServerFramework, src:number):CESXServerFrameworkPlayer?
---@field getPlayerFromIdentifier fun(self:CESXServerFramework, identifier:string):CESXServerFrameworkPlayer?
---@field registerUsableItem fun(self:CESXServerFramework, itemName:string, cb:fun(src:number))
---@field getItems fun(self:CESXServerFramework):IItem[]
---@field getItemLabel fun(self:CESXServerFramework, itemName:string):string?
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

function CESXServerFramework:getPlayerFromIdentifier(identifier)
	local xPlayer = self:getRaw().GetPlayerFromIdentifier(identifier)
	if (not xPlayer) then
		return
	end

	require("server.modules.class.framework.esx.player.main"):new(xPlayer)
end

function CESXServerFramework:registerUsableItem(itemName, cb)
	self:getRaw().RegisterUsableItem(itemName, function(src)
		cb(src)
	end)
end

function CESXServerFramework:getItems()
	local Items = {} ---@type IItem[]
	local RawItems = self:getRaw().GetItems()

	for itemName, RawItemData in pairs(RawItems) do
		Items[#Items + 1] = {
			name = itemName,
			label = RawItemData.label,
			weight = RawItemData.weight
		}
	end

	return Items
end

function CESXServerFramework:getItemLabel(itemName)
	return self:getRaw().GetItemLabel(itemName)
end

return CESXServerFramework
