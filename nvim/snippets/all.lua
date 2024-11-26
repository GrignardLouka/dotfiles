local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

return {
	s("item", {
		t("\\begin{itemize}"),
		t("\\item"),
		t("\\end{itemize}"),
	}),
	s("fig", {
		t("\\begin{figure}[H]"),
		t("\\begin{center}"),
		t("\\includegraphics[width=0.6\\textwidth]{figs/"),
		i(1, "}"),
		t("\\end{center}"),
		t("\\caption{"),
		i(2, "}\\label{fig:"),
		i(3, "}"),
		t("\\end{figure}"),
	}),
}
