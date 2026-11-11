return {
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"java-debug-adapter",
				"java-test",
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		-- No tocar lo de las dependencias, así es como sale en las docs
		dependencies = {
			{
				"mason-org/mason.nvim",
			},
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"emmet_ls",
					"html",
					"cssls",
					"lua_ls",
					"ts_ls",
					"pyright",
				},
			})
		end,
	},
}
