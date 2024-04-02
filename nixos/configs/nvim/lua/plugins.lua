local plugins = {
	--theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},

	--file tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		lazy = false,
	},

	--telescope, fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
	},
	--filebrowser for telescope
	{ "nvim-telescope/telescope-file-browser.nvim", lazy = true },
	{ "nvim-treesitter/nvim-treesitter", lazy = true },

	--indents with pretty lines uwu
	{ "lukas-reineke/indent-blankline.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" }, lazy = true },

	--comment toggler
	"terrortylor/nvim-comment",

	--autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	--LSP completion engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"onsails/lspkind.nvim",
		},
		lazy = true,
	},

	--Lsp saga, makes nice interactions with lsp
	{ "glepnir/lspsaga.nvim", lazy = true },
	{ "akinsho/bufferline.nvim", dependencies = "kyazdani42/nvim-web-devicons", lazy = true },

	--	heirline, for the true heir
	"rebelot/heirline.nvim",

	--	gitsigns, for heirline to work
	"lewis6991/gitsigns.nvim",

	--rust tools
	{ "simrat39/rust-tools.nvim", lazy = true },

	--	outline list thingy for navigating my code really goodly
	"simrat39/symbols-outline.nvim",

	--	shows me where i am in the code
	"SmiteshP/nvim-navic",

	--help me figure out what to put in functions with lsp! lsp signature help
	"ray-x/lsp_signature.nvim",

	--nvim dap ui
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },

	--neodev, for making it easier to work on neovim
	{ "folke/neodev.nvim", opts = {}, lazy = true },

	--flash, for better movement
	"folke/flash.nvim",

	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		run = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}

require("lazy").setup({ plugins })
