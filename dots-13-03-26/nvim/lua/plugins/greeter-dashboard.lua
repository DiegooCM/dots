return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				week_header = { enable = true },
				shortcut = {
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
					{ desc = " Files", group = "Label", action = "Telescope find_files", key = "f" },
					{ desc = " Projects", group = "DiagnosticHint", action = "Telescope projects", key = "p" },
					{ desc = " MRU", group = "Number", action = "Telescope oldfiles", key = "r" },
				},
				mru = { limit = 10 }, -- Muestra los 10 archivos más recientes
				project = { limit = 8 }, -- Muestra los 8 proyectos más recientes
				vertical_center = true, -- Center the Dashboard on the vertical (from top to bottom)
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
