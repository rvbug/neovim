local wezterm = require("wezterm")
local config = {}

-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "tokyonight"
config.window_background_opacity = 0.9


-- shift + cntrl + n - toggles full screen
config.keys = {
  {
    key = 'n',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}


return config
