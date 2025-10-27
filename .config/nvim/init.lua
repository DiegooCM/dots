vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = "1"
vim.opt.termguicolors = true
-- Si no funciona usar " 
vim.cmd('set expandtab')
vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set shiftwidth=2')

-- Poner como leader el espacio
vim.g.mapleader = " "

-- Move selected lines with shift+j or shift+k
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Seleccione todo el archivo
vim.keymap.set("n", "<C-=>", "ggVG")

-- Close split
vim.keymap.set("n", "<leader>cs", ":close<CR>")

-- Que haga el autoscroll cuando llegue a la linea 5 empezando por abajo
vim.o.scrolloff = 5

-- Coge el archivo que configura el lazy
require("config.lazy")
