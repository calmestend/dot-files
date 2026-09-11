local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28

config.font = wezterm.font 'Mononoki Nerd Font'
config.font_size = 14

config.color_scheme_dirs = { './colors/'}

config.color_scheme = 'rosebones_dark'

config.enable_tab_bar = false
config.window_background_opacity = 0.8
config.wayland_window_background_blur = false

return config
