-- bootstrap lazy.nvim, LazyVim and your plugins
--
require("config.lazy")
require("godot-setup")

require("render-markdown").setup({
  latex = {
    enabled = false,
  },
})
