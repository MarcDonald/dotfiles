local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local sources = {
  formatting.prettier,
  code_actions.eslint,
  lint.shellcheck,
}

null_ls.setup {
  debug = true,
  sources = sources,
  autostart = true,
  on_attach = on_attach,
  capabilities = capabilities
}
