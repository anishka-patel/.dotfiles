local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

if vim.g.vscode then
    -- if true then  -- Uncomment to checkout vscode config in neovim
    -- VSCode extension
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
    keymap("n", "n", "nzz", opts)
    keymap("n", "N", "Nzz", opts)

    -- Switch between buffers
    keymap("n", "H", "<cmd>bp<cr>", opts)
    keymap("n", "L", "<cmd>bn<cr>", opts)

    -- Move text in visual mode
    keymap("v", "J", "<cmd>m '>+1<cr>gv=gv", opts)
    keymap("v", "K", "<cmd>m '<-2<cr>gv=gv", opts)

    -- Dont copy to registers on cut or paste
    keymap("n", "x", '"_x', opts)
    keymap("v", "p", '"_p', opts)

    -- Calling whichkey functionality in VSCode
    keymap("n", "<leader>", "<cmd>call VSCodeNotify('whichkey.show')<CR>", opts)
    keymap("x", "<leader>", "<cmd>call VSCodeNotify('whichkey.show')<CR>", opts)

    vim.opt.clipboard:append({ "unnamedplus" })
    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    vim.opt.scrolloff = 8
    vim.opt.sidescrolloff = 16
    vim.opt.termguicolors = true

    require("lazy").setup({
        spec = {
            {
                "folke/flash.nvim",
                event = "VeryLazy",
                ---@type Flash.Config
                opts = {},
                -- stylua: ignore
                keys = {
                    { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
                    { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
                    { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
                    { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
                    { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
                },
            },
            {
                "kylechui/nvim-surround",
                config = function()
                    require("nvim-surround").setup()
                end
            },
            {
                "windwp/nvim-autopairs",
                config = function()
                    require("nvim-autopairs").setup()
                end
            },
            {
                "numToStr/Comment.nvim",
                config = function()
                    require("Comment").setup()
                end
            },
            {
                "echasnovski/mini.ai",
                config = function()
                    require("mini.ai").setup()
                end
            },
            {
                "Wansmer/treesj",
                dependencies = { "nvim-treesitter/nvim-treesitter" },
                config = function()
                    require("treesj").setup({ use_default_keymaps = false })
                end
            }
        },
        checker = { enabled = true },
    })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
        callback = function(_)
            vim.cmd([[TSDisable highlight]])
        end,
    })
else
    -- ordinary Neovim

    local opts = { noremap = true, silent = true }
    local keymap = vim.keymap.set

    keymap("", "<Space>", "<Nop>", opts)

    -- keep cursorline in middle of screen during scrolling
    keymap("n", "<C-u>", "<C-u>zz", opts)
    keymap("n", "<C-d>", "<C-d>zz", opts)
    keymap("n", "<C-f>", "<C-f>zz", opts)
    keymap("n", "<C-b>", "<C-b>zz", opts)

    -- keep cursorline in the middle of the screen during search navigation
    keymap("n", "n", "nzzzv", opts)
    keymap("n", "N", "Nzzzv", opts)

    -- keep cursorline in the middle of the screen during join operations
    keymap("n", "J", "mzJ`z", opts)

    -- moving text in visual mode
    keymap("v", "J", "<cmd>m '>+1<cr>gv=gv", opts)
    keymap("v", "K", "<cmd>m '<-2<cr>gv=gv", opts)

    -- moving between buffers
    keymap("n", "H", "<cmd>bp<cr>", opts)
    keymap("n", "L", "<cmd>bn<cr>", opts)

    -- moving between splits
    keymap("n", "<C-h>", "<C-w>h", opts)
    keymap("n", "<C-j>", "<C-w>j", opts)
    keymap("n", "<C-k>", "<C-w>k", opts)
    keymap("n", "<C-l>", "<C-w>l", opts)

    -- delete without copying to registers
    keymap("n", "x", '"_x', opts)
    keymap("v", "p", '"_p', opts)

    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    -- Netrw config
    vim.g.netrw_keepdir = 0
    vim.g.netrw_winsize = 16
    vim.g.netrw_banner = 0
    vim.g.netrw_browse_split = 0

    -- Netrw disable b/ using nvim-tree
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Neovide
    vim.g.neovide_scale_factor = 1.0
    vim.g.neovide_transparency = 1.0
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_refresh_rate = 60

    vim.o.completeopt = "menu,menuone,preview,noselect"

    -- Setup GUI Fonts
    vim.opt.guifont = "FiraCode Nerd Font:h12"

    -- Options
    vim.opt.scrolloff = 8
    vim.opt.sidescrolloff = 16
    vim.opt.backup = false
    vim.opt.clipboard:append({ "unnamedplus" })
    vim.opt.hlsearch = true
    vim.opt.mouse = "a"
    vim.opt.pumheight = 10
    vim.opt.showmode = true
    vim.opt.showtabline = 1
    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    vim.opt.smartindent = true
    vim.opt.breakindent = true
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

    require("lazy").setup({
        spec = {
            {
                "folke/flash.nvim",
                event = "VeryLazy",
                ---@type Flash.Config
                opts = {},
                -- stylua: ignore
                keys = {
                    { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
                    { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
                    { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
                    { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
                    { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
                },
            },
            {
                "NeogitOrg/neogit",
                dependencies = {
                    { "nvim-lua/plenary.nvim" },
                    { "sindrets/diffview.nvim" },
                    { "nvim-telescope/telescope.nvim" },
                },
                config = function()
                    local neogit = require("neogit")
                    neogit.setup({})
                end,
            },
            { "habamax/vim-asciidoctor" },
            { "Mofiqul/dracula.nvim" },

            -- Lualine
            { "nvim-lualine/lualine.nvim" },
            { "kyazdani42/nvim-web-devicons" },
            -- Telescope
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run =
                "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
            },
            {
                "nvim-telescope/telescope.nvim",
                tag = "0.1.8",
                dependencies = { { "nvim-lua/plenary.nvim" } },
            },
            -- Ease of life stuff
            {
                "kylechui/nvim-surround",
                config = function()
                    require("nvim-surround").setup()
                end
            },
            {
                "windwp/nvim-autopairs",
                config = function()
                    require("nvim-autopairs").setup()
                end
            },
            { "windwp/nvim-ts-autotag" },
            {
                "numToStr/Comment.nvim",
                config = function()
                    require("Comment").setup()
                end
            },
            -- Display hexcodes as colors
            {
                "norcalli/nvim-colorizer.lua",
                config = function()
                    require("colorizer").setup()
                end
            },
            -- Treesitter
            { "nvim-treesitter/nvim-treesitter", run = "<cmd>TSUpdate" },
            { "HiPhish/rainbow-delimiters.nvim" },
            {
                "echasnovski/mini.ai",
                config = function()
                    require("mini.ai").setup()
                end
            },
            -- Undo Tree
            { "mbbill/undotree" },
            -- Terminal
            { "akinsho/toggleterm.nvim" },
            -- LSP
            {
                "VonHeikemen/lsp-zero.nvim",
                branch = "v1.x",
                dependencies = {
                    -- LSP Support
                    { "neovim/nvim-lspconfig" },
                    { "williamboman/mason.nvim" },
                    { "williamboman/mason-lspconfig.nvim" },

                    -- Autocompletion
                    { "hrsh7th/nvim-cmp" },
                    { "hrsh7th/cmp-buffer" },
                    { "hrsh7th/cmp-path" },
                    { "saadparwaiz1/cmp_luasnip" },
                    { "hrsh7th/cmp-nvim-lsp" },
                    { "hrsh7th/cmp-nvim-lua" },

                    -- Snippets
                    { "L3MON4D3/LuaSnip" },
                    { "rafamadriz/friendly-snippets" },
                },
            },
            { "L3MON4D3/LuaSnip",   run = "make install_jsregexp" },
            -- Zen mode
            { "folke/zen-mode.nvim" },
            -- Orgmode
            {
                "nvim-orgmode/orgmode",
                ft = { "org" }
            },

            {
                "dhruvasagar/vim-table-mode",
                ft = { "md", "org" }
            },

            {
                "folke/todo-comments.nvim",
                config = function()
                    require("todo-comments").setup()
                end
            },
            -- Indent
            { "lukas-reineke/indent-blankline.nvim" },
            {
                "nvim-focus/focus.nvim",
                config = function()
                    require("focus").setup({})
                end
            },
            {
                "aznhe21/actions-preview.nvim"
            },
            -- Which key
            { "folke/which-key.nvim" },
            { "barreiroleo/ltex-extra.nvim" },
            { "echasnovski/mini.icons" },
            {
                "3rd/image.nvim",
                build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
                opts = {
                    processor = "magick_cli",
                }
            },
            {
                "nvim-neo-tree/neo-tree.nvim",
                branch = "v3.x",
                dependencies = {
                    "nvim-lua/plenary.nvim",
                    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                    "MunifTanjim/nui.nvim",
                    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
                    {
                        "s1n7ax/nvim-window-picker",
                        version = "2.*",
                        config = function()
                            require("window-picker").setup({
                                filter_rules = {
                                    include_current_win = false,
                                    autoselect_one = true,
                                    -- filter using buffer options
                                    bo = {
                                        -- if the file type is one of following, the window will be ignored
                                        filetype = { "neo-tree", "neo-tree-popup", "notify" },
                                        -- if the buffer type is one of following, the window will be ignored
                                        buftype = { "terminal", "quickfix" },
                                    },
                                },
                            })
                        end,
                    },
                },
            },
            {
                "glepnir/lspsaga.nvim",
                branch = "main",
                dependencies = {
                    { "nvim-tree/nvim-web-devicons" },
                    { "nvim-treesitter/nvim-treesitter" },
                },
                config = function()
                    require("lspsaga").setup()
                end
            },
            { "onsails/lspkind.nvim" },
            { "delphinus/vim-firestore" },
            { "lewis6991/gitsigns.nvim" },
            -- lazy.nvim
            { "folke/noice.nvim" },
            { "MunifTanjim/nui.nvim" },
            { "rcarriga/nvim-notify" },
            {
                "davidmh/cspell.nvim",
                config = function()
                    local has_cspell, cspell = pcall(require, "cspell")
                    local has_null_ls, null_ls = pcall(require, "null-ls")
                    if has_cspell and has_null_ls then
                        null_ls.setup({
                            sources = {
                                cspell.diagnostics,
                                cspell.code_actions,
                            },
                        })
                    end
                end
            },
            {
                "jay-babu/mason-null-ls.nvim",
                event = { "BufReadPre", "BufNewFile" },
                dependencies = {
                    "williamboman/mason.nvim",
                    "nvimtools/none-ls.nvim",
                },

            },
            {
                "nvimtools/none-ls.nvim",
                dependencies = { "nvim-lua/plenary.nvim" },

            },
            { "nvim-telescope/telescope-ui-select.nvim" },
            {
                "mfussenegger/nvim-dap",
                dependencies = {
                    { "rcarriga/nvim-dap-ui" },
                    { "nvim-neotest/nvim-nio" },
                    { "williamboman/mason.nvim" },
                    { "jay-babu/mason-nvim-dap.nvim" },
                },
            },
            {
                "goolord/alpha-nvim",
                dependencies = { "nvim-tree/nvim-web-devicons" },
                config = function()
                    require("alpha").setup(require("alpha.themes.startify").config)
                end,
            },
            {
                "MeanderingProgrammer/render-markdown.nvim",
                after = { "nvim-treesitter" },
                dependencies = { "echasnovski/mini.nvim", opt = true }, -- if you use the mini.nvim suite
                -- dependencies = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
                -- dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
                config = function()
                    require("render-markdown").setup({})
                end,
            },
            {
                "sotte/presenting.nvim",
                config = function()
                    require("presenting").setup({
                        options = {
                            width = 82,
                        }
                    })
                end,
            },
            { "stevearc/dressing.nvim" },
            {
                "ziontee113/icon-picker.nvim",
                config = function()
                    require("icon-picker").setup({
                        disable_legacy_commands = true
                    })
                end,
            },
            {
                "Wansmer/treesj",
                dependencies = { "nvim-treesitter/nvim-treesitter" },
                config = function()
                    require("treesj").setup({ use_default_keymaps = false })
                end
            },
            {
                "stevearc/oil.nvim",
                config = function()
                    require("oil").setup()
                end
            },
            {
                "karb94/neoscroll.nvim",
                config = function()
                    require("neoscroll").setup()
                end
            },
            { "kevinhwang91/nvim-bqf", ft = "qf" },
            {
                "junegunn/fzf",
                run = function()
                    vim.fn['fzf#install']()
                end
            },
            {
                "hedyhli/outline.nvim",
                config = function()
                    require("outline").setup {

                    }
                end,
            }
        },
        install = { colorscheme = { "dracula" } },
        checker = { enabled = true, notify = false },

    })

    local has_toggleterm, toggleterm = pcall(require, "toggleterm")
    if has_toggleterm then
        toggleterm.setup({
            size = 24,
            open_mapping = [[<c-`>]],
            direction = "float",
            float_opts = {
                border = "curved",
            },
        })

        keymap("n", "<leader>tt", "<cmd>ToggleTerm<cr>", opts)
        keymap("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
    end
    local has_ibl, ibl = pcall(require, "ibl")
    if has_ibl then
        ibl.setup()
    end

    local has_dracula, _ = pcall(vim.cmd, "colorscheme dracula")
    -- Setup Colorscheme
    if not has_dracula then
        print("Colorscheme Dracula not found!")
    end

    local has_lualine, lualine = pcall(require, "lualine")
    if has_lualine then
        lualine.setup({
            options = {
                theme = "dracula",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_x = {
                    -- {
                    -- 	require("noice").api.status.message.get_hl,
                    -- 	cond = require("noice").api.status.message.has,
                    -- },
                    {
                        require("noice").api.status.command.get,
                        cond = require("noice").api.status.command.has,
                        color = { fg = "#ff9e64" },
                    },
                    {
                        require("noice").api.status.mode.get,
                        cond = require("noice").api.status.mode.has,
                        color = { fg = "#ff9e64" },
                    },
                    {
                        require("noice").api.status.search.get,
                        cond = require("noice").api.status.search.has,
                        color = { fg = "#ff9e64" },
                    },
                },
            },
        })
    end

    local has_noice, noice = pcall(require, "noice")
    if has_noice then
        noice.setup({
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
                progress = {
                    throttle = 1000 / 1,
                },
            },
            presets = {
                bottom_search = true,         -- use a classic bottom cmdline for search
                command_palette = false,      -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false,       -- add a border to hover docs and signature help
            },
        })
    end

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local has_null_ls, null_ls = pcall(require, "null-ls")

    if has_null_ls then
        null_ls.setup({
            -- you can reuse a shared lspconfig on_attach callback here
            sources = {
                -- Formatters
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.cbfmt,
                null_ls.builtins.formatting.csharpier,
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.formatting.goimports,
                null_ls.builtins.formatting.markdownlint,
                null_ls.builtins.formatting.mdformat,
                null_ls.builtins.formatting.nixfmt,
                -- null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.rustywind,
                -- null_ls.builtins.formatting.shellharden,
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.formatting.stylelint,
                null_ls.builtins.formatting.yamlfmt,
                -- diagnostics
                null_ls.builtins.diagnostics.gitlint,
                null_ls.builtins.diagnostics.markdownlint,
                null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.diagnostics.solhint,
                null_ls.builtins.diagnostics.staticcheck,
                null_ls.builtins.diagnostics.stylelint,
                null_ls.builtins.diagnostics.write_good,
                null_ls.builtins.diagnostics.yamllint,
                null_ls.builtins.diagnostics.commitlint,
                null_ls.builtins.diagnostics.codespell,
                -- Completions
                null_ls.builtins.completion.spell,
                null_ls.builtins.completion.tags,
                -- Hover
                null_ls.builtins.hover.dictionary,
                -- Code Actions
                null_ls.builtins.code_actions.textlint,
                null_ls.builtins.code_actions.gitsigns,
                null_ls.builtins.code_actions.refactoring,
                null_ls.builtins.code_actions.impl,
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        })
    end
    local has_gitsigns, gitsigns = pcall(require, "gitsigns")
    if has_gitsigns then
        gitsigns.setup()
    end

    keymap("n", "<esc>", "<cmd>nohlsearch<cr>", {})
    keymap("n", "<leader>tj", "<cmd>TSJToggle<cr>", opts)
    keymap("n", "<leader>ii", "<cmd>IconPickerNormal<cr>", opts)
    keymap("n", "<leader>z", "<cmd>ZenMode<cr>", opts)
    keymap("n", "<leader>tz", "<cmd>ZenMode<cr>", opts)

    keymap("n", "<leader>u", "<cmd>UndotreeToggle<cr>", opts)
    keymap("n", "<leader>tu", "<cmd>UndotreeToggle<cr>", opts)

    keymap("n", "<leader>tc", "<cmd>ColorizerToggle<cr>", opts)
    keymap("n", "<leader>oT", "<cmd>TableModeToggle<cr>", opts)
    keymap("n", "<leader>ta", "<cmd>Alpha<cr>", opts)

    local has_oil, oil = pcall(require, "oil")
    if has_oil then
        keymap("n", "<leader>oT", "<cmd>TableModeToggle<cr>", opts)
    end
    keymap("n", "<leader>to", "<cmd>Oil<cr>", opts)

    local has_neotree, neotree = pcall(require, "neo-tree")
    if has_neotree then
        keymap("n", "<leader>e", "<cmd>Neotree toggle<cr>", opts)
        keymap("n", "<leader>ne", "<cmd>Neotree toggle<cr>", opts)
        keymap("n", "<leader>ng", "<cmd>Neotree git_status<cr>", opts)
        keymap("n", "<leader>nb", "<cmd>Neotree buffers<cr>", opts)
        keymap("n", "<leader>ns", "<cmd>Neotree document_symbols<cr>", opts)
        keymap("n", "\\", "<cmd>Neotree reveal<cr>", opts)
    end

    local has_ltex_extra, ltex_extra = pcall(require, "ltex_extra")
    if has_ltex_extra then
        keymap("n", "<leader>tl", "<cmd>lua require('ltex_extra').reload()<cr>", { desc = "Ltex Reload" })
        ltex_extra.setup({
            -- table <string> : languages for witch dictionaries will be loaded, e.g. { "es-AR", "en-US" }
            -- https://valentjn.github.io/ltex/supported-languages.html#natural-languages
            load_langs = { "en-US" }, -- en-US as default
            -- boolean : whether to load dictionaries on startup
            init_check = false,
            -- string : relative or absolute path to store dictionaries
            -- e.g. subfolder in the project root or the current working directory: ".ltex"
            -- e.g. shared files for all projects:  vim.fn.expand("~") .. "/.local/share/ltex"
            path = "", -- project root or current working directory
            -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
            log_level = "none",
            -- table : configurations of the ltex language server.
            -- Only if you are calling the server from ltex_extra
            server_opts = nil,
        })
    end

    local has_neogit, neogit = pcall(require, "neogit")

    if has_neogit then
        keymap("n", "<leader>gg", "<cmd>Neogit<cr>", opts)
        keymap("n", "<leader>gl", "<cmd>Neogit log<cr>", opts)
    end

    keymap("n", "<leader>bn", "<cmd>bn<cr>", opts)
    keymap("n", "<leader>bp", "<cmd>bp<cr>", opts)
    keymap("n", "<leader>bd", "<cmd>bd<cr>", opts)

    local has_nvim_tree, nvim_tree = pcall(require, "nvim-tree")

    if has_nvim_tree then
        nvim_tree.setup({
            sort_by = "case_sensitive",
            view = {
                width = 24,
            },
        })
    end

    local has_orgmode, orgmode = pcall(require, "orgmode")

    if has_orgmode then
        orgmode.setup({})
    end

    local has_treesitter_configs, treesitter_configs = pcall(require, "nvim-treesitter.configs")

    local treesitter_list = {
        "http",
        "javascript",
        "typescript",
        "c",
        "lua",
        "rust",
        "go",
        "regex",
        "markdown",
        "c_sharp",
        "bash",
        "css",
        "html",
        "python",
        "solidity",
        "vue",
        "yaml",
        "markdown",
        "markdown_inline",
    }

    if has_treesitter_configs then
        treesitter_configs.setup({
            -- A list of parser names, or "all"
            indent = { enable = true },
            autotag = { enable = true },
            ensure_installed = treesitter_list,

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                -- `false` will disable the whole extension
                enable = true,
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = { "org" },
            },
        })
    end

    local has_lspconfig, lspconfig = pcall(require, "lspconfig")

    if has_lspconfig then
        lspconfig.nil_ls.setup({})
        lspconfig.ltex.setup({})
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" }, },
                },
            },
        })
    end

    local has_lspzero, lspzero = pcall(require, "lsp-zero")
    if has_lspzero then
        lspzero.preset('system-lsp') -- or recommended, or whatever...
        lspzero.setup_nvim_cmp({
            preselect = 'none',
            completion = {
                completeopt = 'menu,menuone,noinsert,noselect'
            },
        })
        lspzero.setup()
    end
    local has_cmp, cmp = pcall(require, "cmp")
    local has_lspkind, lspkind = pcall(require, "lspkind")

    if has_cmp and has_lspkind then
        cmp.setup({
            formatting = {
                -- here is where the change happens
                fields = { "abbr", "kind", "menu" },
                format = lspkind.cmp_format({
                    mode = "symbol",
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
        })
    end

    if has_cmp then
        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
        })
    end

    local lsp_list = {
        "bashls",
        "clangd",
        -- "cmake",
        "cssls",
        -- "csharp_ls",
        "denols",
        "diagnosticls",
        "dockerls",
        "docker_compose_language_service",
        "emmet_ls",
        "eslint",
        -- "gopls",
        "html",
        "jsonls",
        "ltex",
        "lua_ls",
        "marksman",
        "omnisharp",
        "pylsp",
        "pyright",
        "rome",
        "rust_analyzer",
        "solidity",
        "sqlls",
        "stylelint_lsp",
        -- "tsserver",
        "vimls",
        -- "volar",
        "yamlls",
        "zls",
    }

    if has_lspzero then
        lspzero.preset("recommended")

        lspzero.ensure_installed(lsp_list)

        -- Fix Undefined global 'vim'
        lspzero.configure("lua-language-server", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        lspzero.set_preferences({
            suggest_lsp_servers = false,
        })

        lspzero.on_attach(function(client, bufnr)
            local lspzero_opts = { buffer = bufnr, remap = false }

            keymap("i", "<C-h>", vim.lsp.buf.signature_help, {
                desc = "Signature",
                buffer = bufnr,
                remap = false,
            })
            keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover", buffer = bufnr, remap = false })
            keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration", buffer = bufnr, remap = false })
            keymap("n", "gd", vim.lsp.buf.definition, { desc = "Definition", buffer = bufnr, remap = false })
            keymap("n", "gh", vim.lsp.buf.hover, { desc = "Hover", buffer = bufnr, remap = false })
            keymap(
                "n",
                "gl",
                vim.diagnostic.open_float,
                { desc = "Diagnostics", buffer = bufnr, remap = false }
            )

            keymap("n", "<leader>lc", vim.lsp.buf.completion, {
                desc = "Completion",
                buffer = bufnr,
                remap = false,
            })
            keymap(
                "n",
                "<leader>EK",
                vim.diagnostic.open_float,
                { desc = "Show Diagnostics", buffer = bufnr, remap = false }
            )
            keymap(
                "n",
                "<leader>lh",
                vim.lsp.buf.signature_help,
                { desc = "Signature", buffer = bufnr, remap = false }
            )
            keymap(
                "n",
                "<leader>Ej",
                vim.diagnostic.goto_next,
                { desc = "Next Diagnostics", buffer = bufnr, remap = false }
            )
            keymap(
                "n",
                "<leader>Ek",
                vim.diagnostic.goto_prev,
                { desc = "Prev Diagnostics", buffer = bufnr, remap = false }
            )
            keymap(
                "n",
                "<leader>Ed",
                vim.diagnostic.disable,
                { desc = "Disable Diagnostics", buffer = bufnr, remap = false }
            )
            keymap(
                "n",
                "<leader>Ee",
                vim.diagnostic.enable,
                { desc = "Enable Diagnostics", buffer = bufnr, remap = false }
            )
            keymap(
                "n",
                "]d",
                vim.diagnostic.goto_prev,
                { desc = "Prev Diagnostics", buffer = bufnr, remap = false }
            )
            keymap("n", "gr", vim.lsp.buf.references, { desc = "References", buffer = bufnr, remap = false })
            keymap(
                "n",
                "gi",
                vim.lsp.buf.implementation,
                { desc = "Implementation", buffer = bufnr, remap = false }
            )
            keymap(
                "n",
                "[d",
                vim.diagnostic.goto_next,
                { desc = "Next Diagnostics", buffer = bufnr, remap = false }
            )
            keymap(
                "n",
                "]d",
                vim.diagnostic.goto_prev,
                { desc = "Prev Diagnostics", buffer = bufnr, remap = false }
            )

            keymap(
                "n",
                "<leader>lE",
                vim.diagnostic.open_float,
                { desc = "Diagnostics", buffer = bufnr, remap = false }
            )
            keymap("n", "<leader>lc", vim.lsp.buf.completion, {
                desc = "Completion",
                buffer = bufnr,
                remap = false,
            })
            keymap(
                "n",
                "<leader>li",
                vim.lsp.buf.implementation,
                { desc = "Implementation", buffer = bufnr, remap = false }
            )
            keymap(
                "n",
                "<leader>lD",
                vim.lsp.buf.declaration,
                { desc = "Declaration", buffer = bufnr, remap = false }
            )

            keymap("n", "<leader>lR", vim.lsp.buf.rename, { desc = "Rename", buffer = bufnr, remap = false })

            keymap(
                "i",
                "<leader>lh",
                vim.lsp.buf.signature_help,
                { desc = "Signature", buffer = bufnr, remap = false }
            )


            keymap("n", "<leader>ls", vim.lsp.buf.workspace_symbol, {
                desc = "Symbols",
                buffer = bufnr,
                remap = false,
            })
            keymap(
                "n",
                "<leader>ld",
                vim.diagnostic.open_float,
                { desc = "Diagnostics", buffer = bufnr, remap = false }
            )
            keymap("n", "<leader>lj", vim.diagnostic.goto_next, {
                desc = "Next Diagnostics",
                buffer = bufnr,
                remap = false,
            })
            keymap(
                "n",
                "<leader>lk",
                vim.diagnostic.goto_prev,
                { desc = "Prev Diagnostics", buffer = bufnr, remap = false }
            )
            keymap(
                "n",
                "<leader>la",
                vim.lsp.buf.code_action,
                { desc = "Code Action", buffer = bufnr, remap = false }
            )
            keymap(
                "n",
                "<leader>lr",
                vim.lsp.buf.references,
                { desc = "References", buffer = bufnr, remap = false }
            )
            keymap("n", "<leader>lR", vim.lsp.buf.rename, { desc = "Rename", buffer = bufnr, remap = false })
            keymap(
                "i",
                "<leader>lh",
                vim.lsp.buf.signature_help,
                { desc = "Signature", buffer = bufnr, remap = false }
            )
            keymap("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format", buffer = bufnr, remap = false })
        end)

        lspzero.setup()

        vim.diagnostic.config({
            virtual_text = true,
        })
    end

    local has_telescope, telescope = pcall(require, "telescope")

    if has_telescope then
        -- To get ui-select loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        telescope.load_extension("ui-select")
        telescope.setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                }
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
        })
    end

    local has_telescope_builtin, telescope_builtin = pcall(require, "telescope.builtin")
    if has_telescope_builtin then
        keymap("n", "<leader>sf", telescope_builtin.find_files, { desc = "Find Files" })
        keymap("n", "<leader>st", telescope_builtin.live_grep, { desc = "Find Text" })
        keymap("n", "<leader>sg", telescope_builtin.live_grep, { desc = "Find Text" })
        keymap("n", "<leader>sb", telescope_builtin.buffers, { desc = "Find Buffer" })
        keymap("n", "<leader>bb", telescope_builtin.buffers, { desc = "Find Buffer" })
        keymap("n", "<leader>sh", telescope_builtin.help_tags, { desc = "Find Help" })
        keymap("n", "<leader>sb", telescope_builtin.buffers, { desc = "Find Buffer" })
        keymap("n", "<leader>sm", telescope_builtin.marks, { desc = "Find Marks" })
        keymap("n", "<leader>sr", telescope_builtin.registers, { desc = "Find Registers" })
        keymap("n", "<leader>sc", telescope_builtin.commands, { desc = "Find Commands" })
        keymap("n", "<leader>sq", telescope_builtin.quickfix, { desc = "Find Quickfix" })
        keymap("n", "<leader>sl", telescope_builtin.loclist, { desc = "Find Loclist" })
        keymap("n", "<leader>so", telescope_builtin.oldfiles, { desc = "Find Oldfiles" })
        keymap("n", "<leader>sM", telescope_builtin.man_pages, { desc = "Find Man pages" })
        keymap("n", "<leader>sC", telescope_builtin.colorscheme, { desc = "Find colorscheme " })
        keymap("n", "<leader>sk", telescope_builtin.keymaps, { desc = "Find keymaps" })
        keymap("n", "<leader>sj", telescope_builtin.jumplist, { desc = "Find jumplist" })
        keymap("n", "<leader>sd", telescope_builtin.diagnostics, { desc = "Find diagnostics" })
        keymap("n", "<leader>El", telescope_builtin.diagnostics, { desc = "Find diagnostics" })
        keymap("n", "<leader>le", telescope_builtin.diagnostics, { desc = "Diagnostics" })
        keymap("n", "<leader>slr", telescope_builtin.lsp_references, { desc = "Lsp References" })
        keymap("n", "<leader>sld", telescope_builtin.lsp_definitions, { desc = "Lsp Definitions" })
        keymap("n", "<leader>sli", telescope_builtin.lsp_implementations, { desc = "Lsp Implementations" })
        keymap("n", "<leader>sls", telescope_builtin.lsp_document_symbols, { desc = "Lsp Symbols" })
        keymap("n", "<leader>slt", telescope_builtin.lsp_type_definitions, { desc = "Lsp Typedefs" })
        keymap("n", "<leader>slS", telescope_builtin.lsp_workspace_symbols, { desc = "Lsp Workspace Symbols" })
        keymap("n", "<leader>ss", "<cmd>Telescope<cr>", { desc = "Find all" })
        keymap("n", "<leader>sp", "<cmd>Telescope project<cr>", { desc = "Find project" })
    end




    -- This is your opts table
    require("telescope").setup({
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown({
                    -- even more opts
                }),

                -- pseudo code / specification for writing custom displays, like the one
                -- for "codeactions"
                -- specific_opts = {
                --   [kind] = {
                --     make_indexed = function(items) -> indexed_items, width,
                --     make_displayer = function(widths) -> displayer
                --     make_display = function(displayer) -> function(e)
                --     make_ordinal = function(e) -> string
                --   },
                --   -- for example to disable the custom builtin "codeactions" display
                --      do the following
                --   codeactions = false,
                -- }
            },
        },
    })

    local has_dap, dap = pcall(require, "dap")
    local has_dapui, dapui = pcall(require, "dapui")
    local has_dapwidgets, dapwidgets = pcall(require, "dap.ui.widgets")

    if has_dap then
        keymap("n", "<leader>dd", dap.continue, { desc = "Debug: Start/Continue", remap = false })
        keymap("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue", remap = false })
        keymap("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into", remap = false })
        keymap("n", "<F10>", dap.step_into, { desc = "Debug: Step Into", remap = false })
        keymap("n", "<leader>do", dap.step_over, { desc = "Debug: Step Over", remap = false })
        keymap("n", "<F11>", dap.step_over, { desc = "Debug: Step Over", remap = false })
        keymap("n", "<leader>dO", dap.step_out, { desc = "Debug: Step Out", remap = false })
        keymap("n", "<F12>", dap.step_out, { desc = "Debug: Step Out", remap = false })
        keymap("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint", remap = false })
        keymap("n", "<F6>", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint", remap = false })
        keymap("n", "<leader>dB", function()
            dap.set_breakpoint(vim.fn.input, "Breakpoint condition: ")
        end, { desc = "Debug: Set Breakpoint", remap = false })
        keymap("n", "<leader>dr", dap.repl.open, { desc = "Debug: Toggle Repl" })
        keymap("n", "<leader>dl", dap.run_last, { desc = "Debug: Run last" })
        dap.listeners.after.event_initialized["dapui_config"] = dapui.open
        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close
    end

    if has_dap and has_dapui then
        keymap("n", "<leader>dt", dapui.toggle, { desc = "Debug: Toggle Session" })
        keymap("n", "<F7>", dapui.toggle, { desc = "Debug: Toggle Session" })
        dapui.setup({
            -- Set icons to characters that are more likely to work in every terminal.
            --    Feel free to remove or use ones that you like more! :)
            --    Don't feel like these are good choices.
            icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
            controls = {
                icons = {
                    pause = "⏸",
                    play = "▶",
                    step_into = "⏎",
                    step_over = "⏭",
                    step_out = "⏮",
                    step_back = "b",
                    run_last = "▶▶",
                    terminate = "⏹",
                    disconnect = "⏏",
                },
            },
        })
    end

    if has_dapwidgets then
        keymap({ "n", "v" }, "<leader>dh", dapwidgets.hover, { desc = "Debug: Hover" })
        keymap({ "n", "v" }, "<leader>dp", dapwidgets.preview, { desc = "Debug: Preview" })
        keymap({ "n", "v" }, "<leader>df", function()
            dapwidgets.centered_float(dapwidgets.frames)
        end, { desc = "Debug: Float" })
        keymap({ "n", "v" }, "<leader>ds", function()
            dapwidgets.centered_float(dapwidgets.scopes)
        end, { desc = "Debug: Scope" })
    end

    require("mason-nvim-dap").setup({
        automatic_installation = true,
        handlers = {},
        ensure_installed = {},
    })

    local has_wk, wk = pcall(require, "which-key")

    if has_wk then
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        wk.setup()

        wk.add({

            { "<leader>.",       "<cmd>Telescope find_files<cr>", desc = "Find File",   remap = false },
            { "<leader>,",       "<cmd>Oil<cr>",                  desc = "Oil",         remap = false },
            { "<leader>/",       "<cmd>Telescope live_grep<cr>",  desc = "Live Grep",   remap = false },
            { "<leader>;",       "<cmd>Telescope<cr>",            desc = "Telescope",   remap = false },
            { "<leader>'",       "<cmd>Neogit<cr>",               desc = "Neogit",      remap = false },
            { "<leader>`",       "<cmd>ToggleTerm<cr>",           desc = "Toggle Term", remap = false },
            { "<leader><space>", "<cmd>Neotree toggle<cr>",       desc = "Neotree",     remap = false },

            { "<leader>e",       group = "Edit",                  remap = false },
            { "<leader>f",       group = "File",                  remap = false },
            { "<leader>n",       group = "Neotree",               remap = false },
            { "<leader>g",       group = "Git",                   remap = false },
            { "<leader>i",       group = "Insert",                remap = false },
            { "<leader>l",       group = "Lsp",                   remap = false },
            { "<leader>w",       group = "Window",                remap = false },
            { "<leader>sl",      group = "LSP",                   remap = false },
            { "<leader>o",       group = "Org",                   remap = false },
            { "<leader>s",       group = "Search",                remap = false },
            { "<leader>d",       group = "Debug",                 remap = false },
            { "<leader>l",       group = "Lsp",                   remap = false },

        })

        wk.add({
            { "<leader>en", "<cmd>edit ~/.config/nvim/init.lua<cr>",      desc = "Edit Neovim",   remap = false },
            { "<leader>eh", "<cmd>edit ~/.config/hypr/hyprland.conf<cr>", desc = "Edit Hyprland", remap = false },
            { "<leader>ew", "<cmd>edit ~/.config/hypr/waybar/<cr>",       desc = "Edit Waybar",   remap = false },
            { "<leader>ek", "<cmd>edit ~/.config/kitty/<cr>",             desc = "Edit Kitty",    remap = false },
            { "<leader>ee", "<cmd>edit ~/.emacs.d/init.el<cr>",           desc = "Edit Emacs",    remap = false },
            { "<leader>eb", "<cmd>edit ~/.bashrc<cr>",                    desc = "Edit Bash",     remap = false },
            { "<leader>et", "<cmd>edit ~/.tmux.conf<cr>",                 desc = "Edit Tmux",     remap = false },
        })

        wk.add({
            { "<leader>t",  group = "Toggle",          remap = false },
            { "<leader>te", "<cmd>Neotree toggle<cr>", desc = "Neo Tree",   remap = false },
            { "<leader>tt", "<cmd>ToggleTerm<cr>",     desc = "Terminal",   remap = false },
            { "<leader>tp", "<cmd>Presenting<cr>",     desc = "Presenting", remap = false },
            { "<leader>tf", "<cmd>FocusToggle<cr>",    desc = "Focus",      remap = false },

        }, opts)

        wk.add({
            { "<leader>E",  group = "Error",  remap = false },
            { "<leader>En", "<cmd>cnext<cr>", desc = "Next", remap = false },
            { "<leader>Ep", "<cmd>cprev<cr>", desc = "Prev", remap = false },
        }, opts)

        wk.add({
            { "<leader>b",  group = "Buffer",           remap = false },
            { "<leader>bd", "<cmd>bd<cr>",              desc = "Buffer Delete",   remap = false },
            { "<leader>bn", "<cmd>bn<cr>",              desc = "Buffer Next",     remap = false },
            { "<leader>bp", "<cmd>bp<cr>",              desc = "Buffer Previous", remap = false },
            { "<leader>bb", "<cmd>Neotree buffers<cr>", desc = "Buffer List",     remap = false },
        }, opts)

        wk.add({
            { "<leader>w",    group = "Window",    remap = false },

            { "<leader>wr",   group = "Resize",    remap = false },
            { "<leader>wrr",  "<cmd>wincmd =<cr>", desc = "Reset",    remap = false },
            { "<leader>wrh",  group = "Height",    remap = false },
            { "<leader>wrhi", "<cmd>wincmd +<cr>", desc = "Inc",      remap = false },
            { "<leader>wrhd", "<cmd>wincmd -<cr>", desc = "Dec",      remap = false },
            { "<leader>wrhm", "<cmd>wincmd _<cr>", desc = "Max",      remap = false },
            { "<leader>wrw",  group = "Width",     remap = false },
            { "<leader>wrwi", "<cmd>wincmd ><cr>", desc = "Inc",      remap = false },
            { "<leader>wrwd", "<cmd>wincmd <<cr>", desc = "Dec",      remap = false },
            { "<leader>wrwm", "<cmd>wincmd |<cr>", desc = "Max",      remap = false },

            { "<leader>wf",   group = "Focus",     remap = false },
            { "<leader>wfh",  "<cmd>wincmd h<cr>", desc = "Lf",       remap = false },
            { "<leader>wfj",  "<cmd>wincmd j<cr>", desc = "Dn",       remap = false },
            { "<leader>wfk",  "<cmd>wincmd k<cr>", desc = "Up",       remap = false },
            { "<leader>wfl",  "<cmd>wincmd l<cr>", desc = "Ri",       remap = false },
            { "<leader>wfn",  "<cmd>wincmd w<cr>", desc = "Next",     remap = false },
            { "<leader>wfp",  "<cmd>wincmd W<cr>", desc = "Prev",     remap = false },

            { "<leader>wm",   group = "Move",      remap = false },
            { "<leader>wmh",  "<cmd>wincmd H<cr>", desc = "Lf",       remap = false },
            { "<leader>wmj",  "<cmd>wincmd J<cr>", desc = "Dn",       remap = false },
            { "<leader>wmk",  "<cmd>wincmd K<cr>", desc = "Up",       remap = false },
            { "<leader>wml",  "<cmd>wincmd L<cr>", desc = "Ri",       remap = false },
            { "<leader>wmt",  "<cmd>wincmd T<cr>", desc = "Tab",      remap = false },
            { "<leader>wmx",  "<cmd>wincmd x<cr>", desc = "Exch",     remap = false },
            { "<leader>wmd",  "<cmd>wincmd r<cr>", desc = "Dn",       remap = false },
            { "<leader>wmu",  "<cmd>wincmd R<cr>", desc = "Up",       remap = false },

            { "<leader>wo",   "<cmd>wincmd o<cr>", desc = "Only",     remap = false },
            { "<leader>wc",   "<cmd>wincmd c<cr>", desc = "Close",    remap = false },
            { "<leader>wq",   "<cmd>wincmd q<cr>", desc = "Quit",     remap = false },
            { "<leader>wx",   "<cmd>wincmd x<cr>", desc = "Exchange", remap = false },

            { "<leader>ws",   group = "Split",     remap = false },
            { "<leader>wsj",  "<cmd>split<cr>",    desc = "Down",     remap = false },
            { "<leader>wsl",  "<cmd>vsplit<cr>",   desc = "Right",    remap = false },
        })
    end

    keymap({ "v", "n" }, "ga", require("actions-preview").code_actions)

    require("image").setup({
        backend = "kitty",
        processor = "magick_cli", -- or "magick_rock"
        integrations = {
            markdown = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = false,
                only_render_image_at_cursor_mode = "popup", -- or "inline"
                floating_windows = false,                   -- if true, images will be rendered in floating markdown windows
                filetypes = { "markdown", "vimwiki" },      -- markdown extensions (ie. quarto) can go here
            },
            neorg = {
                enabled = true,
                filetypes = { "norg" },
            },
            typst = {
                enabled = true,
                filetypes = { "typst" },
            },
            html = {
                enabled = true,
            },
            css = {
                enabled = false,
            },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        scale_factor = 1.0,
        window_overlap_clear_enabled = false,                                               -- toggles images when windows are overlapped
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
        editor_only_render_when_focused = false,                                            -- auto show/hide images when the editor gains/looses focus
        tmux_show_only_in_active_window = false,                                            -- auto show/hide images in the correct Tmux window (needs visual-activity off)
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
    })

    vim.api.nvim_create_autocmd('TextYankPost', {
        desc = 'Highlight when yanking (copying) text',
        group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
        callback = function()
            vim.highlight.on_yank()
        end,
    })
end
