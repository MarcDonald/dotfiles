---@type ChadrcConfig
local M = {}
M.ui = { theme = 'gruvchad' }
M.mappings = require "custom.mappings"
M.plugins = 'custom.plugins'

M.nvimtree = {
  git = {
    enable = true
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  view = {
    side = "right"
  }
}

return M
