local wezterm = require 'wezterm'
local act = wezterm.action


return {
  font = wezterm.font 'Berkeley Mono',
  -- font = wezterm.font 'Iosevka Term Slab',
  -- font = wezterm.font 'PragmataPro Mono Liga',
  font_size = 12,
  color_scheme = 'Catppuccin Macchiato',
  colors = {
    background = '#1C1C1C'
  },
  -- window_background_gradient = {
  --   colors = { '#12110E', '#2A4162'},
    -- colors = { '#112138', '#29463D'},
    -- orientation = { Linear = { angle = -45.0 } },
    -- orientation = {
    --   Radial = {
    --     cx = 0.75,
    --     cy = 0.75,
    --     radius = 1.25,
    --   },
    -- }
  -- },
  initial_rows = 100,
  initial_cols = 300,
  window_decorations = "RESIZE",
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
  default_cursor_style = "BlinkingUnderline",
  keys = {
    { key = "t", mods = "CMD", action = act.DisableDefaultAssignment},
  }
}
