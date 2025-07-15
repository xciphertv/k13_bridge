---@class CServerFrameworkPlayer:OxClass
---@field private private {Raw: table}
---@field new fun(self: CServerFrameworkPlayer, Raw:table)
---@field getRaw fun(self:CServerFrameworkPlayer):table
---@field getIdentifier fun(self:CServerFrameworkPlayer):string
---@field getName fun(self:CServerFrameworkPlayer):string
---@field setName fun(self:CServerFrameworkPlayer, name:string)
---@field getJob fun(self:CServerFrameworkPlayer):PlayerJob
---@field setJob fun(self:CServerFrameworkPlayer, name:string, gradeId:number)
local CServerFrameworkPlayer = lib.class("CServerFrameworkPlayer")

function CServerFrameworkPlayer:constructor(Raw)
    self.private.Raw = Raw or {}
end

function CServerFrameworkPlayer:getRaw()
    return self.private.Raw
end

function CServerFrameworkPlayer:getIdentifier()
    error("CServerFrameworkPlayer:getIdentifier is not implemented.")
end

function CServerFrameworkPlayer:getName()
    error("CServerFrameworkPlayer:getName is not implemented.")
end

function CServerFrameworkPlayer:setName(name)
    error("CServerFrameworkPlayer:setName is not implemented.")
end

function CServerFrameworkPlayer:getJob()
    error("CServerFrameworkPlayer:getJob is not implemented.")
end

function CServerFrameworkPlayer:setJob(name, gradeId)
    error("CServerFrameworkPlayer:setJob is not implemented.")
end

return CServerFrameworkPlayer

---@class PlayerJob
---@field name string
---@field label string
---@field Grade {id:number, name:string, label:string, salary:number}
