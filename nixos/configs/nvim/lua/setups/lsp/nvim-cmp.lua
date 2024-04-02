local cmp = require("cmp")
local lspkind = require("lspkind")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
	vsnip = "[vsnip]",
	cmdline = "[cmdline]",
}

local border_opts =
	{ border = "single", winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None" }
cmp.setup({
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = lspkind.cmp_format({
			maxwidth = 50,
			before = function(entry, vim_item)
				vim_item.menu = source_mapping[entry.source.name]
				return vim_item
			end,
		}),
	},
	window = {
		completion = cmp.config.window.bordered(border_opts),
		documentation = cmp.config.window.bordered(border_opts),
	},
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<C-h>"] = cmp.mapping.scroll_docs(1),
		["<C-l>"] = cmp.mapping.scroll_docs(-1),
		["<C-e>"] = cmp.mapping.close(),
		["<C-Space"] = cmp.mapping.complete({ select = true }),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	source_priority = {
		nvim_lsp = 1000,
		vsnip = 850,
		path = 750,
		buffer = 500,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "path" },
		{ name = "buffer" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git`  source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
