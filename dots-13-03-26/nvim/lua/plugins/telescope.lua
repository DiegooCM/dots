return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				version = "^1.0.0",
			},
		},
		config = function()
			local telescope = require("telescope")
			local lga_actions = require("telescope-live-grep-args.actions")

			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					live_grep_args = {
						auto_quoting = true, -- enable/disable auto-quoting
						mappings = { -- extend mappings
							i = {
								["<C-k>"] = lga_actions.quote_prompt(),
								["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
								vim.keymap.set(
									"n",
									"<leader>b",
									"<Cmd>Telescope buffers<CR>",
									{ noremap = true, silent = true, desc = "Busca entre los buffers actuales" }
								),
							},
						},
					},
				},
			})
			telescope.load_extension("live_grep_args")
			telescope.load_extension("ui-select")
			require("transparent").clear_prefix("NeoTree")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<Leader>fa", builtin.find_files, { desc = "Busca archivos" }) -- Busca archivos
			vim.keymap.set("n", "<Leader>t", builtin.find_files, { desc = "Busca archivos" }) -- Busca archivos
			vim.keymap.set("n", "<Leader>k", function()
				require("telescope").extensions.live_grep_args.live_grep_args()
			end, { desc = "Busca palabras" })
			vim.keymap.set(
				"n",
				"<Leader>fp",
				":Telescope current_buffer_fuzzy_find<CR>",
				{ noremap = true, silent = true, desc = "Busca palabras en el buffer actual" }
			)
			vim.keymap.set("n", "<leader>fw", ":Telescope grep_string<CR>", { desc = "Buscar palabra bajo el cursor" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("dap")
			vim.keymap.set("n", "<Leader>dc", telescope.extensions.dap.commands, {}) -- Busca archivos
		end,
	},
}
