return {
  -- add any tools you want to have installed below
  {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "cspell-lsp",
        "doctoc",
        "emmet-ls",
        "glow",
        "just-lsp",
        "ltex-ls-plus",
        "proselint",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "write-good",
      },
    },
  },
}
