local dracula = require("dracula")
dracula.setup({
	colors = {
		bg = "#282A36",
		fg = "#F8F8F2",
		selection = "#44475A",
		comment = "#6272A4",
		red = "#FF5555",
		orange = "#FFB86C",
		yellow = "#F1FA8C",
		green = "#50fa7b",
		purple = "#BD93F9",
		cyan = "#8BE9FD",
		pink = "#FF79C6",
		bright_red = "#FF6E6E",
		bright_green = "#69FF94",
		bright_yellow = "#FFFFA5",
		bright_blue = "#D6ACFF",
		bright_magenta = "#FF92DF",
		bright_cyan = "#A4FFFF",
		bright_white = "#FFFFFF",
		menu = "#21222C",
		visual = "#3E4452",
		gutter_fg = "#4B5263",
		nontext = "#3B4048",
	},
	-- show the '~' characters after the end of buffers
	show_end_of_buffer = false, -- default false
	-- use transparent background
	transparent_bg = true, -- default false
	-- set italic comment
	italic_comment = false, -- default false
	-- overrides the default highlights see `:h synIDattr`
	overrides = {

		--make the neotree top menu prettier
		NeoTreeTabInactive = { bg = dracula.colors().menu, fg = dracula.colors().white },
		NeoTreeTabActive = { bg = dracula.colors().menu, fg = dracula.colors().purple },
		NeoTreeTabSeparatorActive = { bg = dracula.colors().menu, fg = dracula.colors().purple },
		NeoTreeTabSeparatorInactive = { bg = dracula.colors().menu, fg = dracula.colors().purple },
		NeoTreeCursorLine = { bg = dracula.colors().selection },

		--border for floating stuff, mostly cmp
		FloatBorder = { fg = dracula.colors().purple },

		--telescope borders
		TelescopePromptBorder = { fg = dracula.colors().purple },
		TelescopeResultsBorder = { fg = dracula.colors().purple },
		TelescopePreviewBorder = { fg = dracula.colors().purple },

		--contents of cmp menu
		PmenuSel = { bg = "NONE" },
		Pmenu = { bg = "NONE" },
		CmpItemAbbrMatch = { bg = "NONE", fg = dracula.colors().purple },
		CmpItemAbbrDeprecated = { bg = "NONE", strikethrough = true },

		--neotree background set to menu color and the seperator made purple
		VertSplit = { fg = dracula.colors().purple, bg = dracula.colors().bg },
		NeoTreeNormal = { bg = dracula.colors().bg },

		--underline instead of undercurl
		DiagnosticUnderlineError = { undercurl = false, underline = true, sp = dracula.colors().red },
		DiagnosticUnderlineWarn = { undercurl = false, underline = true, sp = dracula.colors().yellow },
		DiagnosticUnderlineInfo = { undercurl = false, underline = true, sp = dracula.colors().cyan },
		DiagnosticUnderlineHint = { undercurl = false, underline = true, sp = dracula.colors().cyan },

		--bufferline pretty
		BufferLineSeparator = { bg = dracula.colors().menu, fg = dracula.colors().menu },
		BufferLineSeparatorSelected = { bg = dracula.colors().menu, fg = dracula.colors().menu },
		BufferLineSeparatorVisible = { bg = dracula.colors().menu, fg = dracula.colors().menu },
		BufferLineIndicatorVisible = { fg = dracula.colors().cyan, bg = dracula.colors().menu },

		LspFloatWinBorder = { bg = dracula.colors().bg, fg = dracula.colors().purple },
		LspSagaHoverBorder = { bg = dracula.colors().bg, fg = dracula.colors().purple },
		LspSagaSignatureHelpBorder = { bg = dracula.colors().bg, fg = dracula.colors().purple },
		LspSagaCodeActionBorder = { bg = dracula.colors().bg, fg = dracula.colors().purple },
		LspSagaDefPreviewBorder = { bg = dracula.colors().bg, fg = dracula.colors().purple },
		LspLinesDiagBorder = { bg = dracula.colors().bg, fg = dracula.colors().purple },
		LspSagaDiagnosticBorder = { bg = dracula.colors().bg, fg = dracula.colors().purple },
		LspSagaRenameBorder = { bg = dracula.colors().bg, fg = dracula.colors().purple },
		LspSagaLspFinderBorder = { bg = dracula.colors().bg, fg = dracula.colors().purple },
		LSOutlinePreviewBorder = { bg = dracula.colors().bg, fg = dracula.colors().purple },

		StatusLine = { bg = dracula.colors().bg },
	},
})
vim.cmd([[
	highlight! link NeoTreeDirectoryIcon NvimTreeFolderIcon
	highlight! link NeoTreeDirectoryName NvimTreeFolderName
	highlight! link NeoTreeSymbolicLinkTarget NvimTreeSymlink
	highlight! link NeoTreeRootName NvimTreeRootFolder
	highlight! link NeoTreeDirectoryName NvimTreeOpenedFolderName
	highlight! link NeoTreeFileNameOpened NvimTreeOpenedFile
]])
vim.cmd.colorscheme("dracula")
