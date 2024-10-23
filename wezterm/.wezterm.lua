local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 20

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.color_scheme = "Catppuccin Mocha"

config.window_background_opacity = 0.85
config.macos_window_background_blur = 50

config.keys = {
	{
		key = "=",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}

-- wezterm.on("window-focus-changed", function(window, pane)
--	local overrides = window:get_config_overrides() or {}
--
--	if window:is_focused() then
--		overrides.foreground_text_hsb = {
--			saturation = 1,
--			brightness = 1,
--		}
--	else
--		overrides.foreground_text_hsb = {
--			saturation = 0.8,
--			brightness = 0.7,
--		}
--	end
--
--	window:set_config_overrides(overrides)
-- end)

return config
