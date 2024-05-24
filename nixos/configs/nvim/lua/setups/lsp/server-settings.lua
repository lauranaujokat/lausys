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
    cmd = {"/run/current-system/sw/bin/openscad-lsp"};
    filetypes = {"openscad", "scad"};
  };
	rust_analyzer = {
		cmd = { "/run/current-system/sw/bin/rust-analyzer" },
		settings = {
			["rust-analyzer"] = {
				procMacro = {
					enable = false,
				},
				cachePriming = {
					numThreads = 4,
				},
				diagnostics = {
					experimental = {
						enable = true,
					},
					disabled = {
						"unresolved-proc-macro",
					},
				},
				checkOnSave = {
					command = "clippy",
				},
				cargo = {
					target = "x86_64-unknown-linux-gnu",
				},
			},
		},
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
