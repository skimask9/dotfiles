local wezterm = require("wezterm") --[[@as Wezterm]]
local fonts = require("lib.fonts")

return {
	font_size = 20,
	line_height = 0.9,
	font = wezterm.font(fonts.jetbrains_styled),
	-- font = wezterm.font(fonts.fira),
	-- font = wezterm.font(fonts.sf_mono),
	-- font = wezterm.font(fonts.meslo_lgs),
	-- font = wezterm.font(fonts.maple_mono),
	-- font = wezterm.font(fonts.mononoki),
	-- font = wezterm.font_with_fallback({
	-- fonts.mononoki,
	-- fonts.monolisa,
	-- fonts.jetbrains,
	-- fonts.jetbrains_styled,
	-- }),
	-- font = wezterm.font_with_fallback({
	-- { family = "Maple Mono NF", harfbuzz_features = { "ss01", "cv03" } },
	-- 	{
	-- 		family = "Maple Mono NF",
	-- 		harfbuzz_features = {
	-- 			"calt", -- enable ligatures
	-- 			-- "zero", -- dotted 0
	-- 			-- "cv01", -- remove gaps from symbols @
	-- 			"cv02", -- alt a
	-- 			"cv03", -- alt i
	-- 			-- "cv04", -- alt l
	-- 			-- block: italic only --
	-- 			"cv31", -- alt a
	-- 			"cv32", -- alt f
	-- 			-- "cv33", -- alt i and j
	-- 			"cv34", -- alt k
	-- 			-- "cv35", -- alt l
	-- 			-- "cv36", -- alt x
	-- 			-- "cv37", -- alt y
	-- 			-- end block --
	-- 			-- "ss01", -- break up == === != !==
	-- 			-- "ss02", -- break >= and ==
	-- 			"ss03", -- enable arbitrary tag todo))
	-- 			-- "ss04", -- break multi underscore __
	-- 			"ss05", -- thin escape backslash \n
	-- 			-- "ss06", -- break connected strokes
	-- 			"ss07", -- enable >>>
	-- 			"ss08", -- =>>
	-- 		},
	-- 	},
	-- 	{ family = "JetBrainsMono Nerd Font" },
	-- }),

	-- Define rules for specific styles
	-- font_rules = {
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = true,
	-- 		font = wezterm.font({
	-- 			family = "VictorMono Nerd Font",
	-- 			weight = "Bold",
	-- 			style = "Italic",
	-- 		}),
	-- 	},
	-- 	{
	-- 		italic = true,
	-- 		intensity = "Half",
	-- 		font = wezterm.font({
	-- 			family = "VictorMono Nerd Font",
	-- 			weight = "DemiBold",
	-- 			style = "Italic",
	-- 		}),
	-- 	},
	-- 	{
	-- 		italic = true,
	-- 		intensity = "Normal",
	-- 		font = wezterm.font({
	-- 			family = "VictorMono Nerd Font",
	-- 			style = "Italic",
	-- 			weight = "Bold",
	-- 		}),
	-- 	},
	-- },
	adjust_window_size_when_changing_font_size = false,
	inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.3,
	},
	custom_block_glyphs = true,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	hide_tab_bar_if_only_one_tab = true,
	-- default_cursor_style = "SteadyBlock",
	default_cursor_style = "BlinkingBlock",
	warn_about_missing_glyphs = false,
	cursor_blink_rate = 500,
	-- term = "xterm-256color", -- Set the terminal type
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	-- initial_cols = 95,
	-- initial_rows = 40,
	window_decorations = "RESIZE", -- Hides title bar and borders
	initial_cols = 130,
	initial_rows = 32,
	-- window_decorations = "RESIZE|INTEGRATED_BUTTONS",
	bold_brightens_ansi_colors = true,
	-- window_decorations = "NONE",

	window_background_opacity = 0.8,
	macos_window_background_blur = 10,
	native_macos_fullscreen_mode = true,
}
