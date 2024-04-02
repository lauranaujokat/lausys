local map = vim.keymap.set
map("n", "<C-space>", "<cmd>Lspsaga hover_doc<cr>", { noremap = false })
map("n", "<leader>le", "<cmd>Lspsaga peek_definition<cr>")
map("n", "<leader>la", "<cmd>Lspsaga code_action<cr>")
map("n", "<leader>lr", "<cmd>Lspsaga rename<cr>")
map("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<cr>")
map("n", "<C-k>", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
map("n", "<leader>ll", "<cmd>Lspsaga show_line_diagnostics<cr>")
map("n", "<leader>lw", "<cmd>Lspsaga show_workspace_diagnostics<cr>")
map("n", "<leader>lf", "<cmd>Lspsaga finder<cr>")
map("n", "<leader>lg", "<cmd>Lspsaga goto_definition<cr>")
