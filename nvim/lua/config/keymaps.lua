-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set(
  "n",
  "<leader>sg",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { desc = "Live grep args" }
)
vim.keymap.set("n", "<leader>go", "<cmd>:OpenInGHFileLines<CR>", { desc = "Open in GitHub" })

vim.keymap.set("i", "jk", "<ESC>")
