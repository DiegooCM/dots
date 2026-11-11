local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function get_filename()
	return vim.fn.expand("%:t:r")
end

ls.add_snippets("javascriptreact", {
	s("sc", {
		t({ "import React from 'react';", "" }),
		t({ "const " }),
		f(get_filename),
		t({ " = () => {", "\treturn (" }),
		t({ "{" }, "\t\t"),
		i(1, "// Contenido del componente"),
		t({ "}," }),
		t({ "" }),
		t({ "};", "" }),
		t({ "export default " }),
		f(get_filename),
		t(";"),
	}),
})
