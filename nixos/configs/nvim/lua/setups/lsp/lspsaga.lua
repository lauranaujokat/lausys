local saga = require("lspsaga")
saga.setup({
	finder = {
		methods = {
			tyd = "textDocument/typeDefinition",
		},
		default = "tyd+def+impl+ref",
	},
	border_style = "single",
	diagnostic_header = { " ", " ", " ", " " },
	lightbulb = {
		enable = true,
		sign = false,
		virtual_text = true,
	},
	rename_action_quit = "<Esc>",
	rename_in_select = true,
	symbol_in_winbar = {
		in_custom = true,
	},

	show_outline = {
		jump_key = "<cr>",
		auto_refresh = true,
	},
	custom_kind = {
		-- outline = "#000000",
	},
})
