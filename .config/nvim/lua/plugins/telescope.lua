return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<Leader>p', builtin.find_files, {}) -- Busca archivos con control+p
    end
  }, 
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function() 
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }
      require("telescope").load_extension("ui-select")
      require('transparent').clear_prefix('NeoTree')
    end
  }
}
