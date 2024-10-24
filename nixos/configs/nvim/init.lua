local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
--Load plugins

require("plugins")

--Load setups

--		Loads settings native to Neovim
require("setups/native")
--		theme
require("setups/catppuccin")

--		File tree
require("setups/neo-tree")
--		Fuzzy finder
require("setups/telescope")
--		Pretty blankline lines
require("setups/indent-blankline")
--		Treesitter, syntax stuff
require("setups/treesitter")
--		Comment toggler
require("setups/nvim-comment")

--THE ORDER OF THE THINGS IN THE FOLLOWING BLOCK IS IMPORTANT
--		Completeion engine for LSP servers
require("setups/lsp/nvim-cmp")
--		Lsp window configuration
require("setups/lsp/lspconfig")
--		pretty lsp menus n shit
require("setups/lsp/lspsaga")
--		pretty lsp stuff
require("setups/lsp/lspkind")
--		buffer bar
require("setups/bufferline")
--		heirline, for the true heir
require("setups/heirline")
--		outline, for going places
require("setups/lsp/outline")
--		git stuff for heirline
require("setups/gitsigns")
--		nvim dap
require("setups/lsp/nvim-dap")
--		flash, for moving better
require("setups/flash")
--      pretty stuff in the bottom right corner
require("setups/lsp/fidget")
--      make windows prettier
require("setups/dressing")
--      startup screen
require("setups/startup")
--      org mode in neovim
require("setups/neorg")
--      images in neovim
require("setups/image")
--      rust crate management in neovim
require("setups/crates")
--		pertty lsp signature
require("setups/lsp/lsp_signature")

--Load keybinds

--		Native
require("keybinds/native")
--		File tree
require("keybinds/neo-tree")
--		Fuzzy finder
require("keybinds/telescope")
--		lsp keybinds
require("keybinds/lsp/lspconfig")
--		pretty lsp menus n shit
require("keybinds/lsp/lspsaga")
--		bufferline keybinds
require("keybinds/bufferline")
--		outline keybinds
require("keybinds/lsp/outline")
--		flash, for moving around faster
require("keybinds/flash")
--		dap, for debugging
require("keybinds/lsp/nvim-dap")
--    neorg, org mode in neovim
require("keybinds/neorg")
--    managing rust crates
require("keybinds/crates")
