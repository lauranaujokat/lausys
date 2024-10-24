require("crates").setup {
	completion = {
		cmp = {
			enabled = true,
			use_custom_kind = true,
			kind_text = {
				version = "Version",
				feature = "Feature",
			},

		},
		crates = {
			enabled = true,  -- disabled by default
			max_results = 8, -- The maximum number of search results to display
			min_chars = 2,   -- The minimum number of charaters to type before completions begin appearing
		},
	},
	lsp = {
		enabled = true,
		name = "crates.nvim",
		on_attach = function(client, bufnr) end,
		actions = false,
		completion = false,
		hover = false,
	},
	popup = {
		autofocus = true,
		style = "minimal",
		border = "rounded"


	}
}
