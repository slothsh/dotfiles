local M = {}

M.base_30 = {
  white = "#e8e8e8",
  darker_black = "#0a0f0a",
  black = "#0f140f",
  black2 = "#202420",
  one_bg = "#1a1f1a",
  one_bg2 = "#1f2a1f",
  one_bg3 = "#2a352a",
  grey = "#4b5563",
  grey_fg = "#6b7280",
  grey_fg2 = "#8a918a",
  light_grey = "#9ca39c",
  red = "#ef4444",
  baby_pink = "#f87171",
  pink = "#e879a0",
  line = "#1f2a1f",
  green = "#22c55e",
  vibrant_green = "#7a9f7f",
  nord_blue = "#5b9bd5",
  blue = "#3b82f6",
  yellow = "#eab308",
  sun = "#f0c840",
  purple = "#a78bfa",
  dark_purple = "#7c3aed",
  teal = "#7a9f7f",
  orange = "#f59e0b",
  cyan = "#7a9f7f",
  statusline_bg = "#121712",
  lightbg = "#1a1f1a",
  pmenu_bg = "#7a9f7f",
  folder_bg = "#7a9f7f",
}

M.base_16 = {
  base00 = "#181a18",
  base01 = "#1a1f1a",
  base02 = "#1f2a1f",
  base03 = "#4b5563",
  base04 = "#8a918a",
  base05 = "#e8e8e8",
  base06 = "#e8e8e8",
  base07 = "#e8e8e8",
  base08 = "#ef4444",
  base09 = "#f59e0b",
  base0A = "#eab308",
  base0B = "#7a9f7f",
  base0C = "#22c55e",
  base0D = "#3b82f6",
  base0E = "#a78bfa",
  base0F = "#8a918a",
}

M.type = "dark"

M = require("base46").override_theme(M, "owlsh")

return M
