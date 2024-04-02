local map = vim.keymap.set
map("n", "<C-h>", "<cmd>BufferLineCyclePrev<cr>")
map("n", "<C-l>", "<cmd>BufferLineCycleNext<cr>")
map("n", "<A-h>", "<cmd>BufferLineMovePrev<cr>")
map("n", "<A-l>", "<cmd>BufferLineMoveNext<cr>")
