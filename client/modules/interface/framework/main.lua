---@class IClientFramework:OxClass
---@field private private {framework:Framework, Raw:table}
---@field new fun(self: IClientFramework, framework:Framework, Raw:table)
---@field getName fun(self: IClientFramework): Framework
---@field getRaw fun(self: IClientFramework): table
local IClientFramework = lib.class("IClientFramework")

function IClientFramework:constructor(framework, Raw)
    self.private.framework = framework
    self.private.Raw = Raw
end

function IClientFramework:getName()
    return self.private.framework
end

function IClientFramework:getRaw()
    return self.private.Raw
end

return IClientFramework
