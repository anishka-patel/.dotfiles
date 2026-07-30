-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.shell = "/bin/bash"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 16
vim.opt.pumheight = 10
vim.opt.showtabline = 1
vim.opt.numberwidth = 5
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.colorcolumn = { "80", "120" }
vim.opt.signcolumn = "yes"
vim.opt.wrap = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.list = true
vim.opt.listchars = { eol = "↵", tab = ">-", space = "·", nbsp = "␣", trail = "~", multispace = "|···" }

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.undofile = false
vim.opt.termguicolors = true
