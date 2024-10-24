vim.o.conceallevel = 2
require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {},
		["core.keybinds"] = {},
		["core.export"] = {},
		["core.completion"] = { config = { engine = "nvim-cmp" } },
		["core.dirman"] = {
			config = {
				workspaces = {
					main = "~/neorg", -- Format: <name_of_workspace> = <path_to_workspace_root>
				},
				default_workspace = "main",
			}
		}
	}
})
