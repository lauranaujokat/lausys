return {
	lua_ls = {
		cmd = { "/run/current-system/sw/bin/lua-language-server" },
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				format = {
					command = { "stylua" },
				},
			},
		},
	},
	openscad_lsp = {
		cmd = { "/run/current-system/sw/bin/openscad-lsp" },
		filetypes = { "openscad", "scad" },
	},
	ts_ls = {
		cmd = { "/run/current-system/sw/bin/typescript-language-server", "--stdio" },
		filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	},
	nil_ls = {
		cmd = { "/run/current-system/sw/bin/nil" },
		settings = {
			["nil"] = {
				formatting = {
					command = { "alejandra" },
				},
			},
		},
	},
}
