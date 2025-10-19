-- bootstrap lazy.nvim, LazyVim and your plugins
--
require("config.lazy")

if vim.g.vscode then
else
  require("render-markdown").setup({
    latex = {
      enabled = false,
    },
  })
end
