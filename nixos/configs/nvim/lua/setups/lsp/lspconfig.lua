local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = "single"
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
vim.diagnostic.config({
	virtual_text = true,
	update_ininsert = true,
	severity_sort = true,
})

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
}
local on_attach = function(_, bufnr)
	require("lsp_signature").on_attach(signature_setup, bufnr)
end

local on_attach_rust = function(_, bufnr)
	require("lsp_signature").on_attach(signature_setup, bufnr)
	vim.keymap.set("n", "<C-space>", "<cmd>RustHoverAction<cr>")
end

local settings = require("setups/lsp/server-settings")
for k, v in pairs(settings) do
	local setting = v
	setting.capabilities = capabilities
	setting.on_attach = on_attach
	lspconfig[k].setup(setting)
end
