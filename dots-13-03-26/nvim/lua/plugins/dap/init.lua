return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			-- Carga del node.lua
			require("plugins.dap.node")

			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
			vim.keymap.set("n", "<leader>dr", dap.run_to_cursor)

			-- Eval var under cursor
			vim.keymap.set("n", "<leader>?", function()
				require("dapui").eval(nil, { enter = true })
			end)

			vim.keymap.set("n", "<F1>", dap.continue)
			vim.keymap.set("n", "<F2>", dap.step_into)
			vim.keymap.set("n", "<F3>", dap.step_over)
			vim.keymap.set("n", "<F4>", dap.step_out)
			vim.keymap.set("n", "<F5>", dap.step_back)
			vim.keymap.set("n", "<F12>", dap.restart)
		end,
	},
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	{ "theHamsta/nvim-dap-virtual-text", dependencies = { "mfussenegger/nvim-dap" } },
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "js-debug-adapter", "java-debug-adapter" },
				automatic_installation = true, -- instala debug adapters automáticamente
			})
		end,
	},
}
