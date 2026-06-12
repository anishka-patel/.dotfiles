return {
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      -- {
      --   "lukas-reineke/headlines.nvim",
      --   config = function()
      --     require("headlines").setup()
      --   end,
      -- },
      -- {
      --   "akinsho/org-bullets.nvim",
      --   config = function()
      --     require("org-bullets").setup()
      --   end,
      -- },
      -- "danilshvalov/org-modern.nvim",
      -- {
      --   "bitbloxhub/org-notebook.nvim",
      --   dependencies = {
      --     "bitbloxhub/jupyter-api.nvim",
      --   },
      -- },
      {
        "michaelb/sniprun",
        branch = "master",

        build = "sh install.sh",
        -- do 'sh install.sh 1' if you want to force compile locally
        -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

        config = function()
          require("sniprun").setup({
            -- your options
          })
        end,
      },
    },
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      require("orgmode").setup()
      require("blink.cmp").setup({
        sources = {
          per_filetype = {
            org = { "orgmode" },
          },
          providers = {
            orgmode = {
              name = "Orgmode",
              module = "orgmode.org.autocompletion.blink",
              fallbacks = { "buffer" },
            },
          },
        },
      })
      vim.lsp.enable("org")
    end,
  },
}
