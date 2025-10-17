return {
  {
    "ziontee113/icon-picker.nvim",
    event = "VeryLazy",
    config = function()
      require("icon-picker").setup({
        disable_legacy_commands = true,
      })
    end,
    keys = {
      { "<leader>ii", "<cmd>IconPickerNormal<cr>", desc = "Icon Picker" },
    },
  },
}
