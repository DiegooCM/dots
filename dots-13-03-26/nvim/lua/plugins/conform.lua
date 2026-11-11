return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
		},
		format_on_save = {
			timeout_ms = 500,
		},
		default_format_opts = {
			async = false,
			quiet = false,
			lsp_format = "fallback",
		},
	},
}
