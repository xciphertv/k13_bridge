---@class CESXServerFrameworkPlayer:CServerFrameworkPlayer
---@field new fun(self: CESXServerFrameworkPlayer, Raw:table):CESXServerFrameworkPlayer
---@field getIdentifier fun(self:CESXServerFrameworkPlayer):string
---@field getName fun(self:CESXServerFrameworkPlayer):string
---@field setName fun(self:CESXServerFrameworkPlayer, name:string)
---@field getJob fun(self:CESXServerFrameworkPlayer):PlayerJob
---@field setJob fun(self:CESXServerFrameworkPlayer, name:string, gradeId:number)
---@field getAccountMoney fun(self:CESXServerFrameworkPlayer, accountName:string):number
---@field setAccountMoney fun(self:CESXServerFrameworkPlayer, accountName:string, money:number)
---@field addAccountMoney fun(self:CESXServerFrameworkPlayer, accountName:string, amount:number)
---@field removeAccountMoney fun(self:CESXServerFrameworkPlayer, accountName:string, amount:number)
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

function CESXServerFrameworkPlayer:getAccountMoney(accountName)
    return self:getRaw().getAccount(accountName)?.money or 0
end

function CESXServerFrameworkPlayer:setAccountMoney(accountName, money)
    self:getRaw().setAccountMoney(accountName, money)
end

function CESXServerFrameworkPlayer:addAccountMoney(accountName, amount)
    self:getRaw().addAccountMoney(accountName, amount)
end

function CESXServerFrameworkPlayer:removeAccountMoney(accountName, amount)
    self:getRaw().removeAccountMoney(accountName, amount)
end

return CESXServerFrameworkPlayer
