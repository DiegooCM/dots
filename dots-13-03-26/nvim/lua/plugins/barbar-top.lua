return {
  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() 
      vim.g.barbar_auto_setup = false 
    end,
    opts = {
      -- Configuración básica
      animation = true,
      auto_hide = false,
      tabpages = true,
      clickable = true,
      
      -- Importante para el comportamiento de tabs
      focus_on_close = 'left',
      hide = {extensions = true},
      highlight_visible = true,
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}
