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
	{ "nvim-treesitter/nvim-treesitter",            lazy = true },

	--indents with pretty lines uwu
	{ "lukas-reineke/indent-blankline.nvim",        dependencies = { "nvim-treesitter/nvim-treesitter" }, lazy = true },

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
	{ "glepnir/lspsaga.nvim",    lazy = true },
	{ "akinsho/bufferline.nvim", dependencies = "kyazdani42/nvim-web-devicons", lazy = true },

	--	heirline, for the true heir
	"rebelot/heirline.nvim",

	--	gitsigns, for heirline to work
	"lewis6991/gitsigns.nvim",

	--rust tools
	{
		'mrcjkb/rustaceanvim',
		version = '^5', -- Recommended
		lazy = false, -- This plugin is already lazy
	},

	--	outline list thingy for navigating my code really goodly
	"hedyhli/outline.nvim",

	--	shows me where i am in the code
	"SmiteshP/nvim-navic",

	--help me figure out what to put in functions with lsp! lsp signature help
	"ray-x/lsp_signature.nvim",

	--nvim dap ui
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },

	--lazydev, for making it easier to work on neovim
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	-- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
	--flash, for better movement
	"folke/flash.nvim",

	--lsp loading pretty stuff
	"j-hui/fidget.nvim",

	-- prettier windows
	"stevearc/dressing.nvim",

	-- pretty startup
	"startup-nvim/startup.nvim",

	-- org mode in neovim
	"nvim-neorg/neorg",

	-- image support
	"3rd/image.nvim",

	-- crates plugin for rust
	{
		'saecki/crates.nvim',
		event = { "BufRead Cargo.toml" },
	},
}

require("lazy").setup({ plugins })
