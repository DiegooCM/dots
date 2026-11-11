local dap = require("dap")

--[[
dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = 3000,
	executable = {
		command = "js-debug-adapter",
		-- 💀 Make sure to update this path to point to your installation
		args = { ".local/share/vscode-js-debug/js-debug/src/dapDebugServer.js", "${port}" },
	},
}
]]

dap.adapters["pwa-node"] = {
	type = "server",
	host = "::1",
	port = "${port}",
	executable = {
		command = "js-debug-adapter",
		args = {
			"${port}",
		},
	},
}

dap.adapters["pwa-chrome"] = {
	type = "server",
	host = "localhost",
	port = 8124,
	executable = {
		command = "js-debug-adapter",
		args = { "--inspector-url" }, -- chrome inspector
	},
}

--[[
		name = "Attach to node app",
		type = "pwa-node",
		request = "attach",
    address = "localhost",
    port = 3000,
		processId = require("dap.utils").pick_process,
		cwd = "${workspaceFolder}",
		sourceMaps = true,
  ]]

local node_config = {
	-- Lanzar archivo actual
	{
		name = "Launch file",
		type = "pwa-node",
		request = "launch",
		program = "${file}",
		cwd = "${workspaceFolder}",
		sourceMaps = true,
	},

	-- Adjuntar a proceso ya en ejecución
	{
		name = "Attach to node app",
		type = "pwa-node",
		request = "attach",
		processId = require("dap.utils").pick_process,
		cwd = "${workspaceFolder}",
		sourceMaps = true,
	},
}

dap.configurations.javascript = node_config
dap.configurations.typescript = node_config
dap.configurations.javascriptreact = node_config
dap.configurations.typescriptreact = node_config

-- Para electron
table.insert(dap.configurations.javascript, {
	name = "Electron Main (JS)",
	type = "pwa-node",
	request = "launch",
	runtimeExecutable = "electron",
	program = "${workspaceFolder}/main.js",
	cwd = "${workspaceFolder}",
})

table.insert(dap.configurations.typescript, {
	name = "Electron Main (TS)",
	type = "pwa-node",
	request = "launch",
	runtimeExecutable = "electron",
	program = "${workspaceFolder}/src/main.ts", -- cambia si tu ruta es distinta
	cwd = "${workspaceFolder}",
	outFiles = { "${workspaceFolder}/dist/**/*.js" },
	sourceMaps = true,
})

local renderer_config = {
	name = "Electron Renderer",
	type = "pwa-chrome",
	request = "launch",
	runtimeExecutable = "electron",
	runtimeArgs = { "${workspaceFolder}/renderer.js" }, -- ajusta según tu proyecto
	webRoot = "${workspaceFolder}",
	cwd = "${workspaceFolder}",
}

-- Añadir para JS(X) y TS(X)
table.insert(dap.configurations.javascriptreact, renderer_config)
table.insert(dap.configurations.typescriptreact, renderer_config)
