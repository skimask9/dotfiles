local wezterm = require("wezterm")

-- Define your color schemes
local DARK_THEME = "jellybeans-dark"
local LIGHT_THEME = "dawn"

-- Helper function to determine the appropriate scheme
local function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    return DARK_THEME
  end
  return LIGHT_THEME
end

-- Automatically update color scheme when window gains focus
wezterm.on("window-focus-changed", function(window, _)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local desired_scheme = scheme_for_appearance(appearance)

  if overrides.color_scheme ~= desired_scheme then
    overrides.color_scheme = desired_scheme
    window:set_config_overrides(overrides)
  end
end)

-- Initial setup for first launch
return {
  color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
  color_scheme_dirs = { "/Users/m4pro/.config/wezterm/colors" },
}
