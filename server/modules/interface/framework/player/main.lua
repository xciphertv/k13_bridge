---@class IServerFrameworkPlayer:OxClass
---@field private private {Raw: table}
---@field new fun(self: IServerFrameworkPlayer, Raw:table)
---@field getRaw fun(self:IServerFrameworkPlayer):table
---@field getIdentifier fun(self:IServerFrameworkPlayer):string
---@field getName fun(self:IServerFrameworkPlayer):string
---@field setName fun(self:IServerFrameworkPlayer, name:string)
---@field getJob fun(self:IServerFrameworkPlayer):IPlayerJob
---@field setJob fun(self:IServerFrameworkPlayer, name:string, gradeId:number)
---@field getAccountMoney fun(self:IServerFrameworkPlayer, accountName:string):number
---@field setAccountMoney fun(self:IServerFrameworkPlayer, accountName:string, money:number)
---@field addAccountMoney fun(self:IServerFrameworkPlayer, accountName:string, amount:number)
---@field removeAccountMoney fun(self:IServerFrameworkPlayer, accountName:string, amount:number)
---@field getGroup fun(self:IServerFrameworkPlayer):string
---@field setGroup fun(self:IServerFrameworkPlayer, group:string)
---@field getLoadout fun(self:IServerFrameworkPlayer):IPlayerLoadout
local IServerFrameworkPlayer = lib.class("IServerFrameworkPlayer")

function IServerFrameworkPlayer:constructor(Raw)
    self.private.Raw = Raw or {}
end

function IServerFrameworkPlayer:getRaw()
    return self.private.Raw
end

function IServerFrameworkPlayer:getIdentifier()
    error("IServerFrameworkPlayer:getIdentifier is not implemented.")
end

function IServerFrameworkPlayer:getName()
    error("IServerFrameworkPlayer:getName is not implemented.")
end

function IServerFrameworkPlayer:setName(name)
    error("IServerFrameworkPlayer:setName is not implemented.")
end

function IServerFrameworkPlayer:getJob()
    error("IServerFrameworkPlayer:getJob is not implemented.")
end

function IServerFrameworkPlayer:setJob(name, gradeId)
    error("IServerFrameworkPlayer:setJob is not implemented.")
end

function IServerFrameworkPlayer:getAccountMoney(accountName)
    error("IServerFrameworkPlayer:getAccountMoney is not implemented.")
end

function IServerFrameworkPlayer:setAccountMoney(accountName, money)
    error("IServerFrameworkPlayer:setAccountMoney is not implemented.")
end

function IServerFrameworkPlayer:addAccountMoney(accountName, amount)
    error("IServerFrameworkPlayer:addAccountMoney is not implemented.")
end

function IServerFrameworkPlayer:removeAccountMoney(accountName, amount)
    error("IServerFrameworkPlayer:removeAccountMoney is not implemented.")
end

function IServerFrameworkPlayer:getGroup()
    error("IServerFrameworkPlayer:getGroup is not implemented.")
end

function IServerFrameworkPlayer:setGroup(group)
    error("IServerFrameworkPlayer:setGroup is not implemented.")
end

function IServerFrameworkPlayer:getLoadout()
    error("IServerFrameworkPlayer:getLoadout is not implemented.")
end

return IServerFrameworkPlayer

---@class IPlayerJob
---@field name string
---@field label string
---@field Grade {id:number, name:string, label:string, salary:number}

---@class ILoadoutItem
---@field name string
---@field label string
---@field ammo number
---@field tintIndex number

---@alias IPlayerLoadout ILoadoutItem[]
