return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"mfussenegger/nvim-lint",
	},
	config = function()
		-- Lsp config
		vim.lsp.config("*", {
			capabilities = {
				textDocument = {
					semanticTokens = {
						multilineTokenSupport = true,
					},
				},
			},
			root_markers = { ".git" },
		})

		-- Keymaps
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, {})
		vim.keymap.set("n", "<leader>lk", vim.lsp.buf.definition, {})
		vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, {})

		-- Diagnostic
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			update_in_insert = false,
			underline = true,
			severity_sort = false,
			float = true,
		})
	end,
}
