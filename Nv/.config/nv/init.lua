local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keeping the view centered
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-f>", "<C-f>zz", opts)
keymap("n", "<C-b>", "<C-b>zz", opts)

-- Keeping the search term centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Switch between buffers
keymap("n", "H", "<cmd>bp<cr>", opts)
keymap("n", "L", "<cmd>bn<cr>", opts)

-- Move text in visual mode
keymap("v", "J", "<cmd>m '>+1<cr>gv=gv", opts)
keymap("v", "K", "<cmd>m '<-2<cr>gv=gv", opts)

-- moving between splits
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Dont copy to registers on cut or paste
keymap("n", "x", '"_x', opts)
keymap("v", "p", '"_p', opts)

vim.opt.clipboard:append({ "unnamedplus" })
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 16
vim.opt.termguicolors = true
vim.opt.hlsearch = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.showmode = true
vim.opt.showtabline = 1
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.autoindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.tabstop = 4
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.signcolumn = "yes"
vim.opt.wrap = true
vim.opt.colorcolumn = { "80" }
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.termguicolors = true
vim.opt.list = true

vim.opt.listchars = { eol = "↵", tab = ">-", space = "·", nbsp = "␣", trail = "~", multispace = "|···" }
vim.opt.foldcolumn = "auto"
vim.opt.cmdheight = 1

-- Netrw config
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 32
vim.g.netrw_banner = 0

vim.cmd("filetype on")
vim.cmd("filetype plugin on")

if not pcall(vim.cmd, "colorscheme dracula") then
    vim.cmd("colorscheme sorbet")
end


vim.o.completeopt = "menuone,noselect,preview"

-- Setup GUI Fonts
vim.opt.guifont = "FiraCode Nerd Font:h12"

keymap("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap("n", "<esc>", "<cmd>nohlsearch<cr>", {})
keymap("n", "<leader>e", "<cmd>Lex<cr>", {})
keymap("n", "<leader>t", "<cmd>terminal<cr>", {})
keymap("n", "\\", "<cmd>Lex<cr>", {})
