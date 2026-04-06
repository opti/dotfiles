local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Shell
config.default_prog = { "/opt/homebrew/bin/fish", "-l" }

-- Appearance
config.front_end = "OpenGL"
config.color_scheme = "Tokyo Night"
config.default_cursor_style = "BlinkingBar"
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 17
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.enable_kitty_keyboard = true

-- Set to false to use wezterm's built-in multiplexing instead of tmux
local use_tmux = true

if use_tmux then
	config.enable_tab_bar = false
else
	require("multiplex").apply(config)
end

return config
