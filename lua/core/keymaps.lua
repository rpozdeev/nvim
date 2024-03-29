vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { silent = false })
vim.keymap.set("i", "<C-s>", "<cmd>w<cr><esc>", { silent = false })

vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { silent = false })
vim.keymap.set("i", "<leader>q", "<cmd>q<cr>", { silent = false })

vim.keymap.set("n", "<leader>bx", "<cmd>bd<cr>", { silent = false })
vim.keymap.set("i", "<leader>bx", "<cmd>bd<cr>", { silent = false })

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

