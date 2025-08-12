local wezterm = require("wezterm") --[[@as Wezterm]]
local utils = require("lib.utils")

local appearance = require("appearance")
local behavior = require("behavior")
local colors = require("colors")
local keys = require("keys")
-- local plugins = require("plugins")

local config = {}
for _, module in ipairs({
	appearance,
	behavior,
	colors,
	keys,
}) do
	utils.merge_tables(config, module)
end



-- plugins.tabline.apply_to_config(config)

return config
