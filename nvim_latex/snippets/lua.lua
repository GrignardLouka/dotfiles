-- Place this in ${HOME}/.config/nvim/LuaSnip/all.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_mode
local i = ls.insert_node

return {
	-- A snippet that expands the trigger "hi" into the string "Hello, world!".
	ls.snippet({ trig = "hi2" }, { t("Hello, world!") }),

	-- To return multiple snippets, use one `return` statement per snippet file
	-- and return a table of Lua snippets.
	ls.snippet({ trig = "foo2" }, { t("Another snippet.") }),
}
