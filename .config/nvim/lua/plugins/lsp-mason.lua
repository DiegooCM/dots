return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {
        ensure_installed = { "lua_ls" },
      },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config('*', {
        capabilities = {
          textDocument = {
            semanticTokens = {
              multilineTokenSupport = true,
            }
          }
        },
        root_markers = { '.git' },
      })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, {})
      -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, {})
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = false,
        float = true,
      })
    end,
  },
}
