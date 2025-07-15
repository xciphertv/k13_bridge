---@class CQBServerFramework:IServerFramework
---@field super fun(self:CQBServerFramework, framework:Framework, Raw:table)
---@field new fun(self: CQBServerFramework):CQBServerFramework
---@field getPlayerFromId fun(self:CQBServerFramework, src:number):CQBServerFrameworkPlayer?
---@field getPlayerFromIdentifier fun(self:CQBServerFramework, identifier:string):CQBServerFrameworkPlayer?
---@field registerUsableItem fun(self:CQBServerFramework, itemName:string, cb:fun(src:number))
---@field getItems fun(self:CQBServerFramework):IItem[]
---@field getItemLabel fun(self:CQBServerFramework, itemName:string):string?
local CQBServerFramework = lib.class("CQBServerFramework", require("server.modules.interface.framework.main"))

function CQBServerFramework:constructor()
    self:super("qb", exports["qb-core"]:GetCoreObject())

    return self
end

function CQBServerFramework:getPlayerFromId(src)
    local xPlayer = self:getRaw().Functions.GetPlayer(src)
    if (not xPlayer) then
        return
    end

    require("server.modules.class.framework.qb.player.main"):new(xPlayer)
end

function CQBServerFramework:getPlayerFromIdentifier(identifier)
    local xPlayer = self:getRaw().Functions.GetPlayerByCitizenId(identifier)
    if (not xPlayer) then
        return
    end

    require("server.modules.class.framework.qb.player.main"):new(xPlayer)
end

function CQBServerFramework:registerUsableItem(itemName, cb)
    self:getRaw().Functions.CreateUseableItem(itemName, function(src)
        cb(src)
    end)
end

function CQBServerFramework:getItems()
    local Items = {} ---@type IItem[]
    local RawItems = self:getRaw().Shared.Items

    for itemName, RawItemData in pairs(RawItems) do
        Items[#Items + 1] = {
            name = itemName,
            label = RawItemData.label,
            weight = RawItemData.weight
        }
    end

    return Items
end

function CQBServerFramework:getItemLabel(itemName)
    return self:getRaw().Shared.Items[itemName]?.label
end

return CQBServerFramework
