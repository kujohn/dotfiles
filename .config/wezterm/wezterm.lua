local wezterm = require 'wezterm'
local act = wezterm.action

return {
  font = wezterm.font 'Iosevka Term Slab',
  font_size = 13,
  color_scheme = 'lovelace',
  initial_rows = 100,
  initial_cols = 300,
  window_decorations = "RESIZE|MACOS_FORCE_DISABLE_SHADOW",
  front_end = 'WebGpu',
  webgpu_power_preference = 'HighPerformance',
  max_fps = 144,
  enable_scroll_bar = false,
  use_dead_keys = false,
  scrollback_lines = 5000,
  window_close_confirmation = "NeverPrompt",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  window_frame = {
    border_left_width = 0,
    border_right_width = 0,
    border_bottom_height = 0,
    border_top_height = 0
  },
  enable_tab_bar = true,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  keys = {
    { key = "t", mods = "CMD", action = act.DisableDefaultAssignment},
  }
}
