vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = "1"
vim.opt.termguicolors = true
-- Los números de la izq
vim.cmd("set relativenumber")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Poner como leader el espacio
vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mueve 1 abajo las líneas seleccionadas" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mueve 1 arriba las líneas seleccionadas" })

vim.keymap.set("n", "<C-=>", "ggVG", { desc = "Selecciona todo el archivo" })

vim.keymap.set("n", "<leader>w", ":BufferClose<CR>", { desc = "Cierra el split" })

vim.keymap.set("n", "<leader>q", ":noh<CR>", { desc = "Quita el subrayado" })

-- Control+borrar en insert borre la palabra entera
vim.keymap.set("i", "<C-BS>", "<C-w>", {}, { desc = "Borra la palabra entera" })

vim.keymap.set("n", "gb", "%", { silent = true, desc = "Pasa al siguiente bracket" })

vim.keymap.set(
	"n",
	"<leader>v",
	":vert sb#<CR>",
	{ silent = true, desc = "Mueve el buffer actual a un split vertical" }
)

-- Pasar entre tabs con Control Tab
vim.keymap.set("n", "<leader>n", ":BufferNext<CR>", { silent = true })
vim.keymap.set("n", "<leader>p", ":BufferPrevious<CR>", { silent = true })
vim.keymap.set("n", "<leader>0", ":BufferGoto1<CR>", { silent = true })
vim.keymap.set("n", "<leader>9", ":BufferGoto2<CR>", { silent = true })
vim.keymap.set("n", "<leader>8", ":BufferGoto3<CR>", { silent = true })
vim.keymap.set("n", "<leader>7", ":BufferGoto4<CR>", { silent = true })
vim.keymap.set("n", "<leader>6", ":BufferGoto5<CR>", { silent = true })
vim.keymap.set("n", "<leader>5", ":BufferGoto6<CR>", { silent = true })
vim.keymap.set("n", "<leader>4", ":BufferGoto7<CR>", { silent = true })
vim.keymap.set("n", "<leader>3", ":BufferGoto8<CR>", { silent = true })
vim.keymap.set("n", "<leader>2", ":BufferGoto9<CR>", { silent = true })
-- Que haga el autoscroll cuando llegue a la linea 5 empezando por abajo
vim.o.scrolloff = 5

-- Quita lo de estar en un commentario y que la siguiente línea q hagas sea también de comentario
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	desc = "Disable New Line Comment",
})

--
vim.keymap.set(
	"n",
	"<leader>lc",
	":lua vim.diagnostic.setqflist()<CR>",
	{ silent = true, desc = "Comprobar todos los errores del proyecto" }
)

vim.keymap.set(
	"n",
	"<leader>ss",
	"<cmd>source ~/.config/nvim/lua/plugins/lua-snip.lua<CR>",
	{ silent = false, desc = "Recarga los snippets" }
)

vim.keymap.set("n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>", { silent = false, desc = "Renombrar una variable" })

-- Identación
vim.opt.list = true
vim.opt.listchars = {
	tab = "│ ",
	trail = "·",
	nbsp = "␣",
}

-- Esto es pa q en el dashboard no se me active
vim.api.nvim_create_autocmd("FileType", {
	pattern = "dashboard",
	callback = function()
		-- Desactiva las líneas de indentación para el dashboard
		vim.opt_local.list = false
		vim.opt_local.listchars = {}
	end,
})

vim.api.nvim_create_autocmd("BufLeave", {
	pattern = "*",
	callback = function()
		-- Reactiva las líneas de indentación al salir del dashboard
		if vim.bo.filetype ~= "dashboard" then
			vim.opt_local.list = true
			vim.opt_local.listchars = {
				tab = "│ ",
				trail = "·",
				nbsp = "␣",
			}
		end
	end,
})
