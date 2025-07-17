---@class Bridge
---@field FrameworkFactory fun(framework: Framework): IClientFramework|IServerFramework

Bridge = {
    FrameworkFactory = require("shared.modules.factory.frameworkFactory.main"),
} --[[@as Bridge]]
