return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	lazy = false, -- neo-tree will lazily load itself
	---@module 'neo-tree'
	---@type neotree.Config
	opts = {
		auto_open = false,
	},
	config = function()
		vim.keymap.set("n", "<leader>a", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>m", ":Neotree close<CR>", {})
	end,
}
