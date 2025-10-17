return {
  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      require("colorizer").setup()
    end,
    keys = {
      { "<leader>tc", "<cmd>ColorizerToggle<cr>", desc = "Toggle Colorizer" },
    },
  },
}
