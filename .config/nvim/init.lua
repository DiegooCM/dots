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

-- Coge el archivo que configura el lazy
require("config.lazy")
