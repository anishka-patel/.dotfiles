-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
if vim.g.vscode then
  local opts = { noremap = true, silent = true }
  local keymap = vim.keymap.set
  keymap({ "n", "x" }, "<leader>", "<cmd>call VSCodeNotify('whichkey.show')<CR>", opts)
end
