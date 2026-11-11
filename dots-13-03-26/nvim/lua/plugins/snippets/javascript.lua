local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local function arrow_function()
	return s("af", {
		t("const "),
		i(1, "functionName"),
		t(" = ("),
		i(2, "params"),
		t(") => {"),
		t({ "  " }),
		i(3, "// Cuerpo de la función"),
		t({ ";", "}" }),
	})
end

ls.add_snippets("javascript", { arrow_function() })
ls.add_snippets("typescript", { arrow_function() })
