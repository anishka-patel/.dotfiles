-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.vscode then
  local keymap = vim.keymap.set
  keymap("n", "<leader>", "<cmd>call VSCodeNotify('whichkey.show')<CR>", opts)
  keymap("x", "<leader>", "<cmd>call VSCodeNotify('whichkey.show')<CR>", opts)
end
