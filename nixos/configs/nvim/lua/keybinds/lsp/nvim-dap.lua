vim.keymap.set("n", "<leader>dt", "<cmd>DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<leader>dx", "<cmd>DapTerminate<CR>")
vim.keymap.set("n", "<leader>do", "<cmd>DapStepOver<CR>")
vim.keymap.set("n", "<leader>di", "<cmd>DapStepInto<CR>")
vim.keymap.set("n", "<leader>du", "<cmd>DapStepOut<CR>")
vim.keymap.set("n", "<leader>dn", "<cmd>DapContinue<CR>")
vim.keymap.set("n", "<leader>de", require("dapui").eval)
vim.keymap.set("n", "<leader>df", require("dapui").float_element)
vim.keymap.set("n", "<leader>dd", require("dapui").toggle)
