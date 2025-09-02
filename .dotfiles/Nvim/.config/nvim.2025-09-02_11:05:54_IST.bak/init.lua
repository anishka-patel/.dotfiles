if vim.g.vscode then
  -- VSCode extension
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap

  keymap("", "<Space>", "<Nop>", opts)



  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  -- keymap("n", "<C-u>", "<C-u>zz", opts)
  -- keymap("n", "<C-d>", "<C-d>zz", opts)
  -- keymap("n", "<C-f>", "<C-f>zz", opts)
  -- keymap("n", "<C-b>", "<C-b>zz", opts)
  keymap("n", "<leader>", ":call VSCodeNotify('whichkey.show')<CR>", opts)
  keymap("x", "<leader>", ":call VSCodeNotify('whichkey.show')<CR>", opts)

  vim.opt.clipboard = "unnamedplus"
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.scrolloff = 30
  require("packer").startup(function(use)
    use {
      "kylechui/nvim-surround",
      config = function()
        require("nvim-surround").setup {}
      end
    }
    use {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup {}
      end
    }
    use {
      "ggandor/leap.nvim",
    }
  end)
  require("leap").add_default_mappings()
else
  -- ordinary Neovim
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap

  keymap("", "<Space>", "<Nop>", opts)

  -- keep cursorline in middle of screen during various operations
  -- keymap("n", "<C-u>", "<C-u>zz", opts)
  -- keymap("n", "<C-d>", "<C-d>zz", opts)
  -- keymap("n", "<C-f>", "<C-f>zz", opts)
  -- keymap("n", "<C-b>", "<C-b>zz", opts)
  -- keymap("n", "n", "nzzzv", opts)
  -- keymap("n", "N", "Nzzzv", opts)

  keymap("n", "J", "mzJ`z", opts)


  -- moving text in visual mode

  keymap("v", "J", ":m '>+1<cr>gv=gv", opts)
  keymap("v", "K", ":m '<-2<cr>gv=gv", opts)

  keymap("x", "<leader>p", [["_dP"]], opts)
  keymap("n", "<leader>y", [["+y]], opts)
  keymap("v", "<leader>y", [["+y]], opts)
  keymap("n", "<leader>Y", [["+Y]], opts)



  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  -- Netrw config
  vim.g.netrw_keepdir = 0
  vim.g.netrw_winsize = 16
  vim.g.netrw_banner = 0
  vim.g.netrw_browse_split = 0


  -- Neovide
  vim.g.neovide_scale_factor = 1.0
  vim.o.guifont = "FiraCode Nerd Font:h12"

  -- Options
  vim.opt.scrolloff = 30
  vim.opt.backup = false
  vim.opt.clipboard = "unnamedplus"
  vim.opt.cmdheight = 2
  vim.opt.hlsearch = true
  vim.opt.mouse = "a"
  vim.opt.pumheight = 10
  vim.opt.showmode = false
  vim.opt.showtabline = 2
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.smartindent = true
  vim.opt.splitbelow = true
  vim.opt.splitright = true
  vim.opt.swapfile = false
  vim.opt.timeoutlen = 1000
  vim.opt.undofile = true
  vim.opt.updatetime = 300
  vim.opt.writebackup = false
  vim.opt.expandtab = true
  vim.opt.shiftwidth = 4
  vim.opt.tabstop = 4
  vim.opt.relativenumber = true
  vim.opt.number = true
  vim.opt.numberwidth = 4
  vim.opt.signcolumn = "yes"
  vim.opt.wrap = false
  vim.opt.colorcolumn = { "80" }
  vim.opt.cursorline = true
  vim.opt.termguicolors = true

  vim.cmd [[colorscheme dracula]]

  local status_ok, packer = pcall(require, "packer")
  if not status_ok then
    return
  end

  packer.init {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  packer.startup(function(use)
    -- Packer related
    use "wbthomason/packer.nvim"
    -- Colorscheme
    use "Mofiqul/dracula.nvim"
    use "ggandor/leap.nvim"
    use {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }
    use {
      "nvim-telescope/telescope.nvim", tag = '0.1.x',
      requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- Ease of life stuff
    use {
      "kylechui/nvim-surround",
      config = function()
        require("nvim-surround").setup {}
      end
    }
    use {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup {}
      end
    }
    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use { "nvim-treesitter/playground" }
    use { "mbbill/undotree" }
    use { "akinsho/toggleterm.nvim", tag = '*',
      config = function()
        require("toggleterm").setup {
          size = 20,
          open_mapping = [[<c-t>]],
          direction = 'float',
          float_opts = {
            border = 'curved',
          }
        }
      end
    }
    use { "nvim-orgmode/orgmode",
      config = function()
        require("orgmode").setup {}
      end
    }
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },

        -- Snippets
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },
      }
    }

    use { "folke/zen-mode.nvim" }
    use { "majutsushi/tagbar" }
    use { "baskerville/vim-sxhkdrc"}
    use { "waycrate/swhkd-vim"}
  end)

  require("lualine").setup {
    options = { theme = "dracula" }
  }
  require("leap").add_default_mappings()

  keymap("n", "<leader>z", ":ZenMode<cr>", opts)
  keymap("n", "<leader>u", ":UndotreeToggle<cr>", opts)
  -- keymap("n", "<leader>f", vim.lsp.buf.format, opts)
  keymap("n", "<leader>tc", ":Lexplore %:p:h<cr>", opts)
  keymap("n", "<leader>tp", ":Lexplore <cr>", opts)
  keymap("n", "<leader>en", ":cnext<cr>", opts)
  keymap("n", "<leader>ep", ":cprev<cr>", opts)
end
