local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = "rounded"
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.cmd([[
  highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
  highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
  highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]])

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()
local on_attach = function(_, _)
	vim.lsp.inlay_hint.enable(true)
end

local settings = require("setups/lsp/server-settings")
for k, v in pairs(settings) do
	local setting = v
	setting.capabilities = capabilities
	setting.on_attach = on_attach
	lspconfig[k].setup(setting)
end


vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {
	},
	-- LSP configuration
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
		default_settings = {
			-- rust-analyzer language server configuration
			['rust_analyzer'] = {
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
		},
	},
	dap = {
	},
}
