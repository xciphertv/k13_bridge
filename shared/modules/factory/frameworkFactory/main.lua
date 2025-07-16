---@alias Context "client"|"server"
---@alias Framework "esx"|"qb"

local context <const> = IsDuplicityVersion() and "server" or "client" --[[@as Context]]

local FrameworkCache = {} ---@type table<Framework, IClientFramework|IServerFramework>

---@param framework Framework
return function(framework)
	if (FrameworkCache[framework]) then
		return FrameworkCache[framework]
	end

	FrameworkCache[framework] = require(("%s.modules.class.framework.%s.main"):format(context, framework)):new()

	return FrameworkCache[framework]
end
