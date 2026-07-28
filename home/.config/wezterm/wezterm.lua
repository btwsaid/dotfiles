local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "rose-pine-moon"
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 15.0
config.window_background_opacity = 0.8
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

if wezterm.target_triple:find("windows") then
  local local_app_data = os.getenv("LOCALAPPDATA")
  if local_app_data then
    config.font_dirs = { local_app_data .. "/Microsoft/Windows/Fonts" }
  end
  config.win32_system_backdrop = "Acrylic"
  config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
  config.hide_tab_bar_if_only_one_tab = false

  for _, domain in ipairs(wezterm.default_wsl_domains()) do
    if domain.name == "WSL:Ubuntu" then
      config.default_domain = domain.name
      break
    end
  end
elseif wezterm.target_triple:find("darwin") then
  config.macos_window_background_blur = 50
end

return config
