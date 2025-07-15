---@class CESXServerFrameworkPlayer:CServerFrameworkPlayer
---@field new fun(self: CESXServerFrameworkPlayer, Raw:table):CESXServerFrameworkPlayer
---@field getIdentifier fun(self:CESXServerFrameworkPlayer):string
---@field getName fun(self:CESXServerFrameworkPlayer):string
---@field setName fun(self:CESXServerFrameworkPlayer, name:string)
---@field getJob fun(self:CESXServerFrameworkPlayer):PlayerJob
---@field setJob fun(self:CESXServerFrameworkPlayer, name:string, gradeId:number)
local CESXServerFrameworkPlayer = lib.class("CESXServerFrameworkPlayer",
    require("server.modules.interface.framework.player.main"))

function CESXServerFrameworkPlayer:constructor(Raw)
    self:super(Raw)

    return self
end

function CESXServerFrameworkPlayer:getIdentifier()
    return self:getRaw().getIdentifier()
end

function CESXServerFrameworkPlayer:getName()
    return self:getRaw().getName()
end

function CESXServerFrameworkPlayer:setName(name)
    self:getRaw().setName(name)
end

function CESXServerFrameworkPlayer:getJob()
    local Job = self:getRaw().getJob()

    return {
        name = Job.name,
        label = Job.label,
        Grade = {
            id = Job.grade,
            name = Job.grade_name,
            label = Job.grade_label,
            salary = tonumber(Job.grade_salary) or 0
        }
    } --[[@as PlayerJob]]
end

function CESXServerFrameworkPlayer:setJob(name, gradeId)
    self:getRaw().setJob(name, gradeId)
end

return CESXServerFrameworkPlayer
