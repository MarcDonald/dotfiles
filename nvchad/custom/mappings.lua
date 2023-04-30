local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["<leader>w"] = "",
    ["<leader>q"] = "",
    ["<leader>ls"] = "",
    ["<leader>wk"] = "",
    ["<leader>wl"] = "",
  }
}

-- Your custom mappings
M.abc = {
  n = {
    ["<leader>w"] = { "<cmd> w <CR>", "save file" },
    ["<leader>l"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },
    ["<leader>h"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },
    ["<leader>q"] = { "<cmd> q <CR>", "close current window" },
    ["<leader>sh"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "lsp signature_help",
    },
    ["<leader>Wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "add workspace folder",
    },
    ["<leader>Wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "remove workspace folder",
    },
    ["<leader>Wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "list workspace folders",
    },
    ["<leader>Wk"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "which-key query lookup",
    },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "navigate pane left" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "navitate pane down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "navigate pane up" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "navigate pane right" },
    ["<C-w>h"] = { "<cmd> split <CR>", "horizontal split" },
  }
}

return M
