-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/data/data/com.termux/files/home/.cache/nvim/packer_hererocks/2.1.1731601260/share/lua/5.1/?.lua;/data/data/com.termux/files/home/.cache/nvim/packer_hererocks/2.1.1731601260/share/lua/5.1/?/init.lua;/data/data/com.termux/files/home/.cache/nvim/packer_hererocks/2.1.1731601260/lib/luarocks/rocks-5.1/?.lua;/data/data/com.termux/files/home/.cache/nvim/packer_hererocks/2.1.1731601260/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/data/data/com.termux/files/home/.cache/nvim/packer_hererocks/2.1.1731601260/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["MASON-LSPCONFIG.NVIM"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/MASON-LSPCONFIG.NVIM",
    url = "https://github.com/WILLIAMBOMAN/MASON-LSPCONFIG.NVIM"
  },
  ["actions-preview.nvim"] = {
    config = { "\27LJ\2\nr\0\0\a\0\b\0\v6\0\0\0009\0\1\0009\0\2\0005\2\3\0'\3\4\0006\4\5\0'\6\6\0B\4\2\0029\4\a\4B\0\4\1K\0\1\0\17code_actions\20actions-preview\frequire\aga\1\3\0\0\6v\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/actions-preview.nvim",
    url = "https://github.com/aznhe21/actions-preview.nvim"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n`\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\vconfig\26alpha.themes.startify\nsetup\nalpha\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["cspell.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/cspell.nvim",
    url = "https://github.com/davidmh/cspell.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["dracula.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/dracula.nvim",
    url = "https://github.com/Mofiqul/dracula.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["focus.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nfocus\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/focus.nvim",
    url = "https://github.com/nvim-focus/focus.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["icon-picker.nvim"] = {
    config = { "\27LJ\2\nY\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\28disable_legacy_commands\2\nsetup\16icon-picker\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/icon-picker.nvim",
    url = "https://github.com/ziontee113/icon-picker.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bibl\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flspsaga\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["ltex-extra.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/ltex-extra.nvim",
    url = "https://github.com/barreiroleo/ltex-extra.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nÆ\5\0\0\t\1\30\0O6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0-\4\0\0=\4\4\0035\4\5\0=\4\6\0035\4\a\0=\4\b\3=\3\n\0025\3\27\0004\4\4\0005\5\17\0006\6\0\0'\b\v\0B\6\2\0029\6\f\0069\6\r\0069\6\14\0069\6\15\6>\6\1\0056\6\0\0'\b\v\0B\6\2\0029\6\f\0069\6\r\0069\6\14\0069\6\16\6=\6\18\0055\6\19\0=\6\20\5>\5\1\0045\5\22\0006\6\0\0'\b\v\0B\6\2\0029\6\f\0069\6\r\0069\6\21\0069\6\15\6>\6\1\0056\6\0\0'\b\v\0B\6\2\0029\6\f\0069\6\r\0069\6\21\0069\6\16\6=\6\18\0055\6\23\0=\6\20\5>\5\2\0045\5\25\0006\6\0\0'\b\v\0B\6\2\0029\6\f\0069\6\r\0069\6\24\0069\6\15\6>\6\1\0056\6\0\0'\b\v\0B\6\2\0029\6\f\0069\6\r\0069\6\24\0069\6\16\6=\6\18\0055\6\26\0=\6\20\5>\5\3\4=\4\28\3=\3\29\2B\0\2\1K\0\1\0\0\0\rsections\14lualine_x\1\0\1\14lualine_x\0\1\0\1\afg\f#ff9e64\1\0\2\tcond\0\ncolor\0\vsearch\1\0\1\afg\f#ff9e64\1\0\2\tcond\0\ncolor\0\tmode\ncolor\1\0\1\afg\f#ff9e64\tcond\1\0\2\tcond\0\ncolor\0\bhas\bget\fcommand\vstatus\bapi\nnoice\foptions\1\0\2\rsections\0\foptions\0\23section_separators\1\0\2\nright\5\tleft\5\25component_separators\1\0\2\nright\5\tleft\5\ntheme\1\0\3\ntheme\0\23section_separators\0\25component_separators\0\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-nvim-dap.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/mason-nvim-dap.nvim",
    url = "https://github.com/jay-babu/mason-nvim-dap.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini.ai"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fmini.ai\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/mini.ai",
    url = "https://github.com/echasnovski/mini.ai"
  },
  ["mini.icons"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/mini.icons",
    url = "https://github.com/echasnovski/mini.icons"
  },
  ["mini.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/opt/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n–%\0\0\b\0w\0´\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\0016\0\v\0'\2\f\0B\0\2\0029\0\r\0005\2\14\0005\3\15\0=\3\16\0025\3\17\0=\3\18\0025\3\20\0005\4\19\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\0035\4\31\0005\5\30\0=\5 \4=\4!\0035\4\"\0=\4#\0035\4$\0=\4%\0035\4&\0=\4'\0035\4(\0=\4)\0035\4*\0=\4+\3=\3,\0024\3\0\0=\3-\0025\3.\0005\4/\0=\0040\0035\0042\0005\0051\0=\0053\0045\0054\0005\0065\0=\0066\5=\0057\0045\0058\0005\0069\0=\0066\5=\5:\4=\4;\3=\3<\0024\3\0\0=\3=\0025\3E\0005\4>\0004\5\0\0=\5?\0044\5\0\0=\5@\0044\5\0\0=\5A\0044\5\0\0=\5B\0044\5\0\0=\5C\0044\5\0\0=\5D\4=\4F\0035\4G\0=\4H\0035\4[\0005\5I\0005\6J\0005\aK\0=\a6\6=\6L\0055\6M\0=\6N\0055\6O\0=\6P\0055\6Q\0=\6R\0055\6S\0=\6T\0055\6U\0=\6V\0055\6W\0=\6X\0055\6Y\0=\6Z\5=\5;\0045\5\\\0=\5]\4=\4<\0034\4\0\0=\4-\3=\3^\0025\3`\0005\4_\0=\4H\0035\4j\0005\5a\0005\6b\0005\ac\0=\a6\6=\6L\0055\6d\0=\6N\0055\6e\0=\6P\0055\6f\0=\6T\0055\6g\0=\6V\0055\6h\0=\6X\0055\6i\0=\6Z\5=\5;\4=\4<\3=\3k\0025\3v\0005\4l\0005\5m\0005\6n\0005\ao\0=\a6\6=\6L\0055\6p\0=\6N\0055\6q\0=\6P\0055\6r\0=\6T\0055\6s\0=\6V\0055\6t\0=\6X\0055\6u\0=\6Z\5=\5;\4=\4<\3=\3!\2B\0\2\1K\0\1\0\1\0\1\vwindow\0\1\2\1\0\18order_by_type\vnowait\1\1\2\1\0\18order_by_size\vnowait\1\1\2\1\0\18order_by_name\vnowait\1\1\2\1\0\22order_by_modified\vnowait\1\1\2\1\0\25order_by_diagnostics\vnowait\1\1\2\1\0\21order_by_created\vnowait\1\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\2\0\14show_help\vnowait\1\vconfig\0\1\0\14\agu\21git_unstage_file\6A\16git_add_all\6o\0\aod\0\aom\0\aon\0\agg\24git_commit_and_push\agc\15git_commit\aoc\0\aos\0\agp\rgit_push\agr\20git_revert_file\aot\0\aga\17git_add_file\1\0\2\rposition\nfloat\rmappings\0\fbuffers\1\0\1\rmappings\0\1\2\1\0\18order_by_type\vnowait\1\1\2\1\0\18order_by_size\vnowait\1\1\2\1\0\18order_by_name\vnowait\1\1\2\1\0\22order_by_modified\vnowait\1\1\2\1\0\25order_by_diagnostics\vnowait\1\1\2\1\0\21order_by_created\vnowait\1\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\2\0\14show_help\vnowait\1\vconfig\0\1\0\n\aon\0\6o\0\aom\0\abd\18buffer_delete\aos\0\aot\0\aod\0\aoc\0\6.\rset_root\t<bs>\16navigate_up\1\0\4\24follow_current_file\0\vwindow\0\21group_empty_dirs\2\18show_unloaded\2\1\0\2\20leave_dirs_open\1\fenabled\2\15filesystem\26fuzzy_finder_mappings\1\0\4\t<up>\19move_cursor_up\n<C-n>\21move_cursor_down\n<C-p>\19move_cursor_up\v<down>\21move_cursor_down\1\0\2\26fuzzy_finder_mappings\0\rmappings\0\aot\1\2\1\0\18order_by_type\vnowait\1\aos\1\2\1\0\18order_by_size\vnowait\1\aon\1\2\1\0\18order_by_name\vnowait\1\aom\1\2\1\0\22order_by_modified\vnowait\1\aog\1\2\1\0\24order_by_git_status\vnowait\1\aod\1\2\1\0\25order_by_diagnostics\vnowait\1\aoc\1\2\1\0\21order_by_created\vnowait\1\6o\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\2\0\14show_help\vnowait\1\vconfig\0\1\0\18\aon\0\6#\17fuzzy_sorter\aom\0\aot\0\aog\0\aod\0\aoc\0\a]g\22next_git_modified\6H\18toggle_hidden\a[g\22prev_git_modified\6f\21filter_on_submit\6o\0\n<c-x>\17clear_filter\aos\0\6/\17fuzzy_finder\6D\27fuzzy_finder_directory\6.\rset_root\t<bs>\16navigate_up\24follow_current_file\1\0\2\20leave_dirs_open\1\fenabled\1\19filtered_items\1\0\a\27use_libuv_file_watcher\1\26hijack_netrw_behavior\17open_default\21group_empty_dirs\1\vwindow\0\24follow_current_file\0\rcommands\0\19filtered_items\0\26never_show_by_pattern\15never_show\27always_show_by_pattern\16always_show\20hide_by_pattern\17hide_by_name\1\0\n\26never_show_by_pattern\0\15never_show\0\27always_show_by_pattern\0\16always_show\0\20hide_by_pattern\0\17hide_by_name\0\16hide_hidden\1\20hide_gitignored\1\18hide_dotfiles\1\fvisible\1\18nesting_rules\vwindow\rmappings\6a\1\0\1\14show_path\tnone\1\2\1\0\badd\vconfig\0\6P\vconfig\1\0\2\14use_float\2\19use_image_nvim\2\1\2\1\0\19toggle_preview\vconfig\0\f<space>\1\0\27\6d\vdelete\6s\16open_vsplit\6A\18add_directory\6C\15close_node\6x\21cut_to_clipboard\6p\25paste_from_clipboard\6z\20close_all_nodes\6m\tmove\6c\tcopy\6?\14show_help\6<\16prev_source\6S\15open_split\6P\0\6i\22show_file_details\6>\16next_source\n<esc>\vcancel\t<cr>\topen\18<2-LeftMouse>\topen\f<space>\0\6w\28open_with_window_picker\6l\18focus_preview\6q\17close_window\6a\0\6R\frefresh\6r\vrename\6y\22copy_to_clipboard\6t\16open_tabnew\1\2\1\0\16toggle_node\vnowait\1\20mapping_options\1\0\2\fnoremap\2\vnowait\2\1\0\4\nwidth\3(\rmappings\0\rposition\tleft\20mapping_options\0\rcommands\30default_component_configs\19symlink_target\1\0\1\fenabled\1\fcreated\1\0\2\19required_width\3n\fenabled\2\18last_modified\1\0\2\19required_width\3X\fenabled\2\ttype\1\0\2\19required_width\3z\fenabled\2\14file_size\1\0\2\19required_width\3@\fenabled\2\15git_status\fsymbols\1\0\1\fsymbols\0\1\0\t\rconflict\bÓúß\vstaged\bÔÅÜ\runstaged\tÛ∞Ñ±\rmodified\5\fignored\bÔë¥\14untracked\bÔÑ®\frenamed\tÛ∞Åï\fdeleted\b‚úñ\nadded\5\tname\1\0\3\19trailing_slash\1\14highlight\20NeoTreeFileName\26use_git_status_colors\2\rmodified\1\0\2\14highlight\20NeoTreeModified\vsymbol\b[+]\ticon\1\0\5\14highlight\20NeoTreeFileIcon\17folder_empty\tÛ∞úå\16folder_open\bÓóæ\fdefault\6*\18folder_closed\bÓóø\vindent\1\0\t\14highlight\24NeoTreeIndentMarker\23expander_highlight\20NeoTreeExpander\22expander_expanded\bÔëº\23expander_collapsed\bÔë†\23last_indent_marker\b‚îî\18indent_marker\b‚îÇ\17with_markers\2\fpadding\3\1\16indent_size\3\2\14container\1\0\v\14file_size\0\15git_status\0\14container\0\rmodified\0\19symlink_target\0\ttype\0\vindent\0\tname\0\fcreated\0\18last_modified\0\ticon\0\1\0\1\26enable_character_fade\2\20source_selector\1\0\2\vwinbar\1\15statusline\1$open_files_do_not_replace_types\1\4\0\0\rterminal\ftrouble\aqf\1\0\14\15filesystem\0\18nesting_rules\0\30default_component_configs\0\rcommands\0\fbuffers\0\20source_selector\0\15git_status\0\26sort_case_insensitive\1\vwindow\0$open_files_do_not_replace_types\0\23enable_diagnostics\2\22enable_git_status\2\23popup_border_style\frounded\25close_if_last_window\1\nsetup\rneo-tree\frequire\1\0\2\vtexthl\23DiagnosticSignHint\ttext\tÛ∞åµ\23DiagnosticSignHint\1\0\2\vtexthl\23DiagnosticSignInfo\ttext\tÔÅö \23DiagnosticSignInfo\1\0\2\vtexthl\23DiagnosticSignWarn\ttext\tÔÅ± \23DiagnosticSignWarn\1\0\2\vtexthl\24DiagnosticSignError\ttext\tÔÅó \24DiagnosticSignError\16sign_define\afn\bvim\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neogit = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/NeogitOrg/neogit"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["noice.nvim"] = {
    config = { "\27LJ\2\nÔ\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\fpresets\1\0\5\26long_message_to_split\2\20command_palette\1\18bottom_search\2\19lsp_doc_border\1\15inc_rename\1\blsp\1\0\2\fpresets\0\blsp\0\rprogress\1\0\1\rthrottle\3Ë\a\roverride\1\0\2\roverride\0\rprogress\0\1\0\0031vim.lsp.util.convert_input_to_markdown_lines\2 cmp.entry.get_documentation\2\"vim.lsp.util.stylize_markdown\2\nsetup\nnoice\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["none-ls.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/none-ls.nvim",
    url = "https://github.com/nvimtools/none-ls.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/opt/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-nio"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-nio",
    url = "https://github.com/nvim-neotest/nvim-nio"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-window-picker"] = {
    config = { "\27LJ\2\nå\2\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\t\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\1\0\1\17filter_rules\0\abo\fbuftype\1\3\0\0\rterminal\rquickfix\rfiletype\1\0\2\rfiletype\0\fbuftype\0\1\4\0\0\rneo-tree\19neo-tree-popup\vnotify\1\0\3\abo\0\19autoselect_one\2\24include_current_win\1\nsetup\18window-picker\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  ["oil.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\boil\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/oil.nvim",
    url = "https://github.com/stevearc/oil.nvim"
  },
  orgmode = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\forgmode\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/orgmode",
    url = "https://github.com/nvim-orgmode/orgmode"
  },
  ["outline.nvim"] = {
    config = { "\27LJ\2\nù\1\0\0\6\0\n\0\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\a\0'\2\b\0B\0\2\0029\0\t\0004\2\0\0B\0\2\1K\0\1\0\nsetup\foutline\frequire\1\0\1\tdesc\19Toggle Outline\21<cmd>Outline<CR>\15<leader>tO\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/outline.nvim",
    url = "https://github.com/hedyhli/outline.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presenting.nvim"] = {
    config = { "\27LJ\2\nc\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\1\0\1\nwidth\3R\nsetup\15presenting\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/presenting.nvim",
    url = "https://github.com/sotte/presenting.nvim"
  },
  ["rainbow-delimiters.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/rainbow-delimiters.nvim",
    url = "https://github.com/HiPhish/rainbow-delimiters.nvim"
  },
  ["render-markdown.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20render-markdown\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/opt/render-markdown.nvim",
    url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nô\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15float_opts\1\0\1\vborder\vcurved\1\0\4\14direction\nfloat\17open_mapping\n<c-`>\tsize\3\24\15float_opts\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  treesj = {
    config = { "\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\24use_default_keymaps\1\nsetup\vtreesj\frequire\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/treesj",
    url = "https://github.com/Wansmer/treesj"
  },
  undotree = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nç#\0\0\5\1S\0¿\0016\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\1\6\0B\1\1\0019\1\a\0004\3\20\0005\4\b\0>\4\1\0035\4\t\0>\4\2\0035\4\n\0>\4\3\0035\4\v\0>\4\4\0035\4\f\0>\4\5\0035\4\r\0>\4\6\0035\4\14\0>\4\a\0035\4\15\0>\4\b\0035\4\16\0>\4\t\0035\4\17\0>\4\n\0035\4\18\0>\4\v\0035\4\19\0>\4\f\0035\4\20\0>\4\r\0035\4\21\0>\4\14\0035\4\22\0>\4\15\0035\4\23\0>\4\16\0035\4\24\0>\4\17\0035\4\25\0>\4\18\0035\4\26\0>\4\19\3B\1\2\0019\1\a\0004\3\b\0005\4\27\0>\4\1\0035\4\28\0>\4\2\0035\4\29\0>\4\3\0035\4\30\0>\4\4\0035\4\31\0>\4\5\0035\4 \0>\4\6\0035\4!\0>\4\a\3B\1\2\0019\1\a\0004\3\5\0005\4\"\0>\4\1\0035\4#\0>\4\2\0035\4$\0>\4\3\0035\4%\0>\4\4\3-\4\0\0B\1\3\0019\1\a\0004\3\4\0005\4&\0>\4\1\0035\4'\0>\4\2\0035\4(\0>\4\3\3-\4\0\0B\1\3\0019\1\a\0004\3\6\0005\4)\0>\4\1\0035\4*\0>\4\2\0035\4+\0>\4\3\0035\4,\0>\4\4\0035\4-\0>\4\5\3-\4\0\0B\1\3\0019\1\a\0004\3\3\0005\4.\0>\4\1\0035\4/\0>\4\2\3-\4\0\0B\1\3\0019\1\a\0004\3\3\0005\0040\0>\4\1\3B\1\2\0019\1\a\0004\3#\0005\0041\0>\4\1\0035\0042\0>\4\2\0035\0043\0>\4\3\0035\0044\0>\4\4\0035\0045\0>\4\5\0035\0046\0>\4\6\0035\0047\0>\4\a\0035\0048\0>\4\b\0035\0049\0>\4\t\0035\4:\0>\4\n\0035\4;\0>\4\v\0035\4<\0>\4\f\0035\4=\0>\4\r\0035\4>\0>\4\14\0035\4?\0>\4\15\0035\4@\0>\4\16\0035\4A\0>\4\17\0035\4B\0>\4\18\0035\4C\0>\4\19\0035\4D\0>\4\20\0035\4E\0>\4\21\0035\4F\0>\4\22\0035\4G\0>\4\23\0035\4H\0>\4\24\0035\4I\0>\4\25\0035\4J\0>\4\26\0035\4K\0>\4\27\0035\4L\0>\4\28\0035\4M\0>\4\29\0035\4N\0>\4\30\0035\4O\0>\4\31\0035\4P\0>\4 \0035\4Q\0>\4!\0035\4R\0>\4\"\3B\1\2\1K\0\1\0\1\0\1\3\2\0\16<leader>wsl\20<cmd>vsplit<cr>\nremap\1\tdesc\nRight\1\3\2\0\16<leader>wsj\19<cmd>split<cr>\nremap\1\tdesc\tDown\1\2\2\0\15<leader>ws\ngroup\nSplit\nremap\1\1\3\2\0\15<leader>wx\22<cmd>wincmd x<cr>\nremap\1\tdesc\rExchange\1\3\2\0\15<leader>wq\22<cmd>wincmd q<cr>\nremap\1\tdesc\tQuit\1\3\2\0\15<leader>wc\22<cmd>wincmd c<cr>\nremap\1\tdesc\nClose\1\3\2\0\15<leader>wo\22<cmd>wincmd o<cr>\nremap\1\tdesc\tOnly\1\3\2\0\16<leader>wmu\22<cmd>wincmd R<cr>\nremap\1\tdesc\aUp\1\3\2\0\16<leader>wmd\22<cmd>wincmd r<cr>\nremap\1\tdesc\aDn\1\3\2\0\16<leader>wmx\22<cmd>wincmd x<cr>\nremap\1\tdesc\tExch\1\3\2\0\16<leader>wmt\22<cmd>wincmd T<cr>\nremap\1\tdesc\bTab\1\3\2\0\16<leader>wml\22<cmd>wincmd L<cr>\nremap\1\tdesc\aRi\1\3\2\0\16<leader>wmk\22<cmd>wincmd K<cr>\nremap\1\tdesc\aUp\1\3\2\0\16<leader>wmj\22<cmd>wincmd J<cr>\nremap\1\tdesc\aDn\1\3\2\0\16<leader>wmh\22<cmd>wincmd H<cr>\nremap\1\tdesc\aLf\1\2\2\0\15<leader>wm\ngroup\tMove\nremap\1\1\3\2\0\16<leader>wfp\22<cmd>wincmd W<cr>\nremap\1\tdesc\tPrev\1\3\2\0\16<leader>wfn\22<cmd>wincmd w<cr>\nremap\1\tdesc\tNext\1\3\2\0\16<leader>wfl\22<cmd>wincmd l<cr>\nremap\1\tdesc\aRi\1\3\2\0\16<leader>wfk\22<cmd>wincmd k<cr>\nremap\1\tdesc\aUp\1\3\2\0\16<leader>wfj\22<cmd>wincmd j<cr>\nremap\1\tdesc\aDn\1\3\2\0\16<leader>wfh\22<cmd>wincmd h<cr>\nremap\1\tdesc\aLf\1\2\2\0\15<leader>wf\ngroup\nFocus\nremap\1\1\3\2\0\17<leader>wrwm\22<cmd>wincmd |<cr>\nremap\1\tdesc\bMax\1\3\2\0\17<leader>wrwd\22<cmd>wincmd <<cr>\nremap\1\tdesc\bDec\1\3\2\0\17<leader>wrwi\22<cmd>wincmd ><cr>\nremap\1\tdesc\bInc\1\2\2\0\16<leader>wrw\ngroup\nWidth\nremap\1\1\3\2\0\17<leader>wrhm\22<cmd>wincmd _<cr>\nremap\1\tdesc\bMax\1\3\2\0\17<leader>wrhd\22<cmd>wincmd -<cr>\nremap\1\tdesc\bDec\1\3\2\0\17<leader>wrhi\22<cmd>wincmd +<cr>\nremap\1\tdesc\bInc\1\2\2\0\16<leader>wrh\ngroup\vHeight\nremap\1\1\3\2\0\16<leader>wrr\22<cmd>wincmd =<cr>\nremap\1\tdesc\nReset\1\2\2\0\15<leader>wr\ngroup\vResize\nremap\1\1\2\2\0\14<leader>w\ngroup\vWindow\nremap\1\1\2\2\0\14<leader>d\ngroup\nDebug\nremap\1\1\2\2\0\14<leader>s\ngroup\vSearch\nremap\1\1\2\2\0\14<leader>o\ngroup\bOrg\nremap\1\1\3\2\0\15<leader>bb\29<cmd>Neotree buffers<cr>\nremap\1\tdesc\16Buffer List\1\3\2\0\15<leader>bp\16<cmd>bp<cr>\nremap\1\tdesc\20Buffer Previous\1\3\2\0\15<leader>bn\16<cmd>bn<cr>\nremap\1\tdesc\16Buffer Next\1\3\2\0\15<leader>bd\16<cmd>bd<cr>\nremap\1\tdesc\18Buffer Delete\1\2\2\0\14<leader>b\ngroup\vBuffer\nremap\1\1\3\2\0\15<leader>Ep\19<cmd>cprev<cr>\nremap\1\tdesc\tPrev\1\3\2\0\15<leader>En\19<cmd>cnext<cr>\nremap\1\tdesc\tNext\1\2\2\0\14<leader>E\ngroup\nError\nremap\1\1\3\2\0\15<leader>tp\24<cmd>Presenting<cr>\nremap\1\tdesc\15Presenting\1\3\2\0\15<leader>tt\24<cmd>ToggleTerm<cr>\nremap\1\tdesc\rTerminal\1\3\2\0\15<leader>te\28<cmd>Neotree toggle<cr>\nremap\1\tdesc\rNeo Tree\1\2\2\0\14<leader>t\ngroup\vToggle\nremap\1\1\3\2\0\15<leader>et\31<cmd>edit ~/.tmux.conf<cr>\nremap\1\tdesc\14Edit Tmux\1\3\2\0\15<leader>eb\28<cmd>edit ~/.bashrc<cr>\nremap\1\tdesc\14Edit Bash\1\3\2\0\15<leader>ee%<cmd>edit ~/.emacs.d/init.el<cr>\nremap\1\tdesc\15Edit Emacs\1\3\2\0\15<leader>ek#<cmd>edit ~/.config/kitty/<cr>\nremap\1\tdesc\15Edit Kitty\1\3\2\0\15<leader>ew)<cmd>edit ~/.config/hypr/waybar/<cr>\nremap\1\tdesc\16Edit Waybar\1\3\2\0\15<leader>eh/<cmd>edit ~/.config/hypr/hyprland.conf<cr>\nremap\1\tdesc\18Edit Hyprland\1\3\2\0\15<leader>en*<cmd>edit ~/.config/nvim/init.lua<cr>\nremap\1\tdesc\16Edit Neovim\1\2\2\0\15<leader>sl\ngroup\bLSP\nremap\1\1\2\2\0\14<leader>w\ngroup\vWindow\nremap\1\1\2\2\0\14<leader>l\ngroup\bLsp\nremap\1\1\2\2\0\14<leader>i\ngroup\vInsert\nremap\1\1\2\2\0\14<leader>g\ngroup\bGit\nremap\1\1\2\2\0\14<leader>p\ngroup\vPacker\nremap\1\1\2\2\0\14<leader>n\ngroup\fNeotree\nremap\1\1\2\2\0\14<leader>f\ngroup\tFile\nremap\1\1\2\2\0\14<leader>e\ngroup\tEdit\nremap\1\1\3\2\0\20<leader><space>\28<cmd>Neotree toggle<cr>\nremap\1\tdesc\fNeotree\1\3\2\0\14<leader>`\24<cmd>ToggleTerm<cr>\nremap\1\tdesc\16Toggle Term\1\3\2\0\14<leader>]\26<cmd>PackerUpdate<cr>\nremap\1\tdesc\18Packer Update\1\3\2\0\14<leader>[\25<cmd>PackerClean<cr>\nremap\1\tdesc\17Packer Clean\1\3\2\0\14<leader>\\\24<cmd>PackerSync<cr>\nremap\1\tdesc\16Packer Sync\1\3\2\0\14<leader>'\20<cmd>Neogit<cr>\nremap\1\tdesc\vNeogit\1\3\2\0\14<leader>;\23<cmd>Telescope<cr>\nremap\1\tdesc\14Telescope\1\3\2\0\14<leader>/!<cmd>Telescope live_grep<cr>\nremap\1\tdesc\14Live Grep\1\3\2\0\14<leader>,\17<cmd>Oil<cr>\nremap\1\tdesc\bOil\1\3\2\0\14<leader>.\"<cmd>Telescope find_files<cr>\nremap\1\tdesc\14Find File\badd\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0" },
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/data/data/com.termux/files/home/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: treesj
time([[Config for treesj]], true)
try_loadstring("\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\24use_default_keymaps\1\nsetup\vtreesj\frequire\0", "config", "treesj")
time([[Config for treesj]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: outline.nvim
time([[Config for outline.nvim]], true)
try_loadstring("\27LJ\2\nù\1\0\0\6\0\n\0\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\a\0'\2\b\0B\0\2\0029\0\t\0004\2\0\0B\0\2\1K\0\1\0\nsetup\foutline\frequire\1\0\1\tdesc\19Toggle Outline\21<cmd>Outline<CR>\15<leader>tO\6n\bset\vkeymap\bvim\0", "config", "outline.nvim")
time([[Config for outline.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: orgmode
time([[Config for orgmode]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\forgmode\frequire\0", "config", "orgmode")
time([[Config for orgmode]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bibl\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nô\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15float_opts\1\0\1\vborder\vcurved\1\0\4\14direction\nfloat\17open_mapping\n<c-`>\tsize\3\24\15float_opts\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: ltex-extra.nvim
time([[Config for ltex-extra.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "ltex-extra.nvim")
time([[Config for ltex-extra.nvim]], false)
-- Config for: focus.nvim
time([[Config for focus.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nfocus\frequire\0", "config", "focus.nvim")
time([[Config for focus.nvim]], false)
-- Config for: actions-preview.nvim
time([[Config for actions-preview.nvim]], true)
try_loadstring("\27LJ\2\nr\0\0\a\0\b\0\v6\0\0\0009\0\1\0009\0\2\0005\2\3\0'\3\4\0006\4\5\0'\6\6\0B\4\2\0029\4\a\4B\0\4\1K\0\1\0\17code_actions\20actions-preview\frequire\aga\1\3\0\0\6v\6n\bset\vkeymap\bvim\0", "config", "actions-preview.nvim")
time([[Config for actions-preview.nvim]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nÆ\5\0\0\t\1\30\0O6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0-\4\0\0=\4\4\0035\4\5\0=\4\6\0035\4\a\0=\4\b\3=\3\n\0025\3\27\0004\4\4\0005\5\17\0006\6\0\0'\b\v\0B\6\2\0029\6\f\0069\6\r\0069\6\14\0069\6\15\6>\6\1\0056\6\0\0'\b\v\0B\6\2\0029\6\f\0069\6\r\0069\6\14\0069\6\16\6=\6\18\0055\6\19\0=\6\20\5>\5\1\0045\5\22\0006\6\0\0'\b\v\0B\6\2\0029\6\f\0069\6\r\0069\6\21\0069\6\15\6>\6\1\0056\6\0\0'\b\v\0B\6\2\0029\6\f\0069\6\r\0069\6\21\0069\6\16\6=\6\18\0055\6\23\0=\6\20\5>\5\2\0045\5\25\0006\6\0\0'\b\v\0B\6\2\0029\6\f\0069\6\r\0069\6\24\0069\6\15\6>\6\1\0056\6\0\0'\b\v\0B\6\2\0029\6\f\0069\6\r\0069\6\24\0069\6\16\6=\6\18\0055\6\26\0=\6\20\5>\5\3\4=\4\28\3=\3\29\2B\0\2\1K\0\1\0\0\0\rsections\14lualine_x\1\0\1\14lualine_x\0\1\0\1\afg\f#ff9e64\1\0\2\tcond\0\ncolor\0\vsearch\1\0\1\afg\f#ff9e64\1\0\2\tcond\0\ncolor\0\tmode\ncolor\1\0\1\afg\f#ff9e64\tcond\1\0\2\tcond\0\ncolor\0\bhas\bget\fcommand\vstatus\bapi\nnoice\foptions\1\0\2\rsections\0\foptions\0\23section_separators\1\0\2\nright\5\tleft\5\25component_separators\1\0\2\nright\5\tleft\5\ntheme\1\0\3\ntheme\0\23section_separators\0\25component_separators\0\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: icon-picker.nvim
time([[Config for icon-picker.nvim]], true)
try_loadstring("\27LJ\2\nY\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\28disable_legacy_commands\2\nsetup\16icon-picker\frequire\0", "config", "icon-picker.nvim")
time([[Config for icon-picker.nvim]], false)
-- Config for: noice.nvim
time([[Config for noice.nvim]], true)
try_loadstring("\27LJ\2\nÔ\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\fpresets\1\0\5\26long_message_to_split\2\20command_palette\1\18bottom_search\2\19lsp_doc_border\1\15inc_rename\1\blsp\1\0\2\fpresets\0\blsp\0\rprogress\1\0\1\rthrottle\3Ë\a\roverride\1\0\2\roverride\0\rprogress\0\1\0\0031vim.lsp.util.convert_input_to_markdown_lines\2 cmp.entry.get_documentation\2\"vim.lsp.util.stylize_markdown\2\nsetup\nnoice\frequire\0", "config", "noice.nvim")
time([[Config for noice.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nç#\0\0\5\1S\0¿\0016\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\1\6\0B\1\1\0019\1\a\0004\3\20\0005\4\b\0>\4\1\0035\4\t\0>\4\2\0035\4\n\0>\4\3\0035\4\v\0>\4\4\0035\4\f\0>\4\5\0035\4\r\0>\4\6\0035\4\14\0>\4\a\0035\4\15\0>\4\b\0035\4\16\0>\4\t\0035\4\17\0>\4\n\0035\4\18\0>\4\v\0035\4\19\0>\4\f\0035\4\20\0>\4\r\0035\4\21\0>\4\14\0035\4\22\0>\4\15\0035\4\23\0>\4\16\0035\4\24\0>\4\17\0035\4\25\0>\4\18\0035\4\26\0>\4\19\3B\1\2\0019\1\a\0004\3\b\0005\4\27\0>\4\1\0035\4\28\0>\4\2\0035\4\29\0>\4\3\0035\4\30\0>\4\4\0035\4\31\0>\4\5\0035\4 \0>\4\6\0035\4!\0>\4\a\3B\1\2\0019\1\a\0004\3\5\0005\4\"\0>\4\1\0035\4#\0>\4\2\0035\4$\0>\4\3\0035\4%\0>\4\4\3-\4\0\0B\1\3\0019\1\a\0004\3\4\0005\4&\0>\4\1\0035\4'\0>\4\2\0035\4(\0>\4\3\3-\4\0\0B\1\3\0019\1\a\0004\3\6\0005\4)\0>\4\1\0035\4*\0>\4\2\0035\4+\0>\4\3\0035\4,\0>\4\4\0035\4-\0>\4\5\3-\4\0\0B\1\3\0019\1\a\0004\3\3\0005\4.\0>\4\1\0035\4/\0>\4\2\3-\4\0\0B\1\3\0019\1\a\0004\3\3\0005\0040\0>\4\1\3B\1\2\0019\1\a\0004\3#\0005\0041\0>\4\1\0035\0042\0>\4\2\0035\0043\0>\4\3\0035\0044\0>\4\4\0035\0045\0>\4\5\0035\0046\0>\4\6\0035\0047\0>\4\a\0035\0048\0>\4\b\0035\0049\0>\4\t\0035\4:\0>\4\n\0035\4;\0>\4\v\0035\4<\0>\4\f\0035\4=\0>\4\r\0035\4>\0>\4\14\0035\4?\0>\4\15\0035\4@\0>\4\16\0035\4A\0>\4\17\0035\4B\0>\4\18\0035\4C\0>\4\19\0035\4D\0>\4\20\0035\4E\0>\4\21\0035\4F\0>\4\22\0035\4G\0>\4\23\0035\4H\0>\4\24\0035\4I\0>\4\25\0035\4J\0>\4\26\0035\4K\0>\4\27\0035\4L\0>\4\28\0035\4M\0>\4\29\0035\4N\0>\4\30\0035\4O\0>\4\31\0035\4P\0>\4 \0035\4Q\0>\4!\0035\4R\0>\4\"\3B\1\2\1K\0\1\0\1\0\1\3\2\0\16<leader>wsl\20<cmd>vsplit<cr>\nremap\1\tdesc\nRight\1\3\2\0\16<leader>wsj\19<cmd>split<cr>\nremap\1\tdesc\tDown\1\2\2\0\15<leader>ws\ngroup\nSplit\nremap\1\1\3\2\0\15<leader>wx\22<cmd>wincmd x<cr>\nremap\1\tdesc\rExchange\1\3\2\0\15<leader>wq\22<cmd>wincmd q<cr>\nremap\1\tdesc\tQuit\1\3\2\0\15<leader>wc\22<cmd>wincmd c<cr>\nremap\1\tdesc\nClose\1\3\2\0\15<leader>wo\22<cmd>wincmd o<cr>\nremap\1\tdesc\tOnly\1\3\2\0\16<leader>wmu\22<cmd>wincmd R<cr>\nremap\1\tdesc\aUp\1\3\2\0\16<leader>wmd\22<cmd>wincmd r<cr>\nremap\1\tdesc\aDn\1\3\2\0\16<leader>wmx\22<cmd>wincmd x<cr>\nremap\1\tdesc\tExch\1\3\2\0\16<leader>wmt\22<cmd>wincmd T<cr>\nremap\1\tdesc\bTab\1\3\2\0\16<leader>wml\22<cmd>wincmd L<cr>\nremap\1\tdesc\aRi\1\3\2\0\16<leader>wmk\22<cmd>wincmd K<cr>\nremap\1\tdesc\aUp\1\3\2\0\16<leader>wmj\22<cmd>wincmd J<cr>\nremap\1\tdesc\aDn\1\3\2\0\16<leader>wmh\22<cmd>wincmd H<cr>\nremap\1\tdesc\aLf\1\2\2\0\15<leader>wm\ngroup\tMove\nremap\1\1\3\2\0\16<leader>wfp\22<cmd>wincmd W<cr>\nremap\1\tdesc\tPrev\1\3\2\0\16<leader>wfn\22<cmd>wincmd w<cr>\nremap\1\tdesc\tNext\1\3\2\0\16<leader>wfl\22<cmd>wincmd l<cr>\nremap\1\tdesc\aRi\1\3\2\0\16<leader>wfk\22<cmd>wincmd k<cr>\nremap\1\tdesc\aUp\1\3\2\0\16<leader>wfj\22<cmd>wincmd j<cr>\nremap\1\tdesc\aDn\1\3\2\0\16<leader>wfh\22<cmd>wincmd h<cr>\nremap\1\tdesc\aLf\1\2\2\0\15<leader>wf\ngroup\nFocus\nremap\1\1\3\2\0\17<leader>wrwm\22<cmd>wincmd |<cr>\nremap\1\tdesc\bMax\1\3\2\0\17<leader>wrwd\22<cmd>wincmd <<cr>\nremap\1\tdesc\bDec\1\3\2\0\17<leader>wrwi\22<cmd>wincmd ><cr>\nremap\1\tdesc\bInc\1\2\2\0\16<leader>wrw\ngroup\nWidth\nremap\1\1\3\2\0\17<leader>wrhm\22<cmd>wincmd _<cr>\nremap\1\tdesc\bMax\1\3\2\0\17<leader>wrhd\22<cmd>wincmd -<cr>\nremap\1\tdesc\bDec\1\3\2\0\17<leader>wrhi\22<cmd>wincmd +<cr>\nremap\1\tdesc\bInc\1\2\2\0\16<leader>wrh\ngroup\vHeight\nremap\1\1\3\2\0\16<leader>wrr\22<cmd>wincmd =<cr>\nremap\1\tdesc\nReset\1\2\2\0\15<leader>wr\ngroup\vResize\nremap\1\1\2\2\0\14<leader>w\ngroup\vWindow\nremap\1\1\2\2\0\14<leader>d\ngroup\nDebug\nremap\1\1\2\2\0\14<leader>s\ngroup\vSearch\nremap\1\1\2\2\0\14<leader>o\ngroup\bOrg\nremap\1\1\3\2\0\15<leader>bb\29<cmd>Neotree buffers<cr>\nremap\1\tdesc\16Buffer List\1\3\2\0\15<leader>bp\16<cmd>bp<cr>\nremap\1\tdesc\20Buffer Previous\1\3\2\0\15<leader>bn\16<cmd>bn<cr>\nremap\1\tdesc\16Buffer Next\1\3\2\0\15<leader>bd\16<cmd>bd<cr>\nremap\1\tdesc\18Buffer Delete\1\2\2\0\14<leader>b\ngroup\vBuffer\nremap\1\1\3\2\0\15<leader>Ep\19<cmd>cprev<cr>\nremap\1\tdesc\tPrev\1\3\2\0\15<leader>En\19<cmd>cnext<cr>\nremap\1\tdesc\tNext\1\2\2\0\14<leader>E\ngroup\nError\nremap\1\1\3\2\0\15<leader>tp\24<cmd>Presenting<cr>\nremap\1\tdesc\15Presenting\1\3\2\0\15<leader>tt\24<cmd>ToggleTerm<cr>\nremap\1\tdesc\rTerminal\1\3\2\0\15<leader>te\28<cmd>Neotree toggle<cr>\nremap\1\tdesc\rNeo Tree\1\2\2\0\14<leader>t\ngroup\vToggle\nremap\1\1\3\2\0\15<leader>et\31<cmd>edit ~/.tmux.conf<cr>\nremap\1\tdesc\14Edit Tmux\1\3\2\0\15<leader>eb\28<cmd>edit ~/.bashrc<cr>\nremap\1\tdesc\14Edit Bash\1\3\2\0\15<leader>ee%<cmd>edit ~/.emacs.d/init.el<cr>\nremap\1\tdesc\15Edit Emacs\1\3\2\0\15<leader>ek#<cmd>edit ~/.config/kitty/<cr>\nremap\1\tdesc\15Edit Kitty\1\3\2\0\15<leader>ew)<cmd>edit ~/.config/hypr/waybar/<cr>\nremap\1\tdesc\16Edit Waybar\1\3\2\0\15<leader>eh/<cmd>edit ~/.config/hypr/hyprland.conf<cr>\nremap\1\tdesc\18Edit Hyprland\1\3\2\0\15<leader>en*<cmd>edit ~/.config/nvim/init.lua<cr>\nremap\1\tdesc\16Edit Neovim\1\2\2\0\15<leader>sl\ngroup\bLSP\nremap\1\1\2\2\0\14<leader>w\ngroup\vWindow\nremap\1\1\2\2\0\14<leader>l\ngroup\bLsp\nremap\1\1\2\2\0\14<leader>i\ngroup\vInsert\nremap\1\1\2\2\0\14<leader>g\ngroup\bGit\nremap\1\1\2\2\0\14<leader>p\ngroup\vPacker\nremap\1\1\2\2\0\14<leader>n\ngroup\fNeotree\nremap\1\1\2\2\0\14<leader>f\ngroup\tFile\nremap\1\1\2\2\0\14<leader>e\ngroup\tEdit\nremap\1\1\3\2\0\20<leader><space>\28<cmd>Neotree toggle<cr>\nremap\1\tdesc\fNeotree\1\3\2\0\14<leader>`\24<cmd>ToggleTerm<cr>\nremap\1\tdesc\16Toggle Term\1\3\2\0\14<leader>]\26<cmd>PackerUpdate<cr>\nremap\1\tdesc\18Packer Update\1\3\2\0\14<leader>[\25<cmd>PackerClean<cr>\nremap\1\tdesc\17Packer Clean\1\3\2\0\14<leader>\\\24<cmd>PackerSync<cr>\nremap\1\tdesc\16Packer Sync\1\3\2\0\14<leader>'\20<cmd>Neogit<cr>\nremap\1\tdesc\vNeogit\1\3\2\0\14<leader>;\23<cmd>Telescope<cr>\nremap\1\tdesc\14Telescope\1\3\2\0\14<leader>/!<cmd>Telescope live_grep<cr>\nremap\1\tdesc\14Live Grep\1\3\2\0\14<leader>,\17<cmd>Oil<cr>\nremap\1\tdesc\bOil\1\3\2\0\14<leader>.\"<cmd>Telescope find_files<cr>\nremap\1\tdesc\14Find File\badd\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: presenting.nvim
time([[Config for presenting.nvim]], true)
try_loadstring("\27LJ\2\nc\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\1\0\1\nwidth\3R\nsetup\15presenting\frequire\0", "config", "presenting.nvim")
time([[Config for presenting.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n`\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\vconfig\26alpha.themes.startify\nsetup\nalpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: nvim-window-picker
time([[Config for nvim-window-picker]], true)
try_loadstring("\27LJ\2\nå\2\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\t\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\1\0\1\17filter_rules\0\abo\fbuftype\1\3\0\0\rterminal\rquickfix\rfiletype\1\0\2\rfiletype\0\fbuftype\0\1\4\0\0\rneo-tree\19neo-tree-popup\vnotify\1\0\3\abo\0\19autoselect_one\2\24include_current_win\1\nsetup\18window-picker\frequire\0", "config", "nvim-window-picker")
time([[Config for nvim-window-picker]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n–%\0\0\b\0w\0´\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\0016\0\v\0'\2\f\0B\0\2\0029\0\r\0005\2\14\0005\3\15\0=\3\16\0025\3\17\0=\3\18\0025\3\20\0005\4\19\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\0035\4\31\0005\5\30\0=\5 \4=\4!\0035\4\"\0=\4#\0035\4$\0=\4%\0035\4&\0=\4'\0035\4(\0=\4)\0035\4*\0=\4+\3=\3,\0024\3\0\0=\3-\0025\3.\0005\4/\0=\0040\0035\0042\0005\0051\0=\0053\0045\0054\0005\0065\0=\0066\5=\0057\0045\0058\0005\0069\0=\0066\5=\5:\4=\4;\3=\3<\0024\3\0\0=\3=\0025\3E\0005\4>\0004\5\0\0=\5?\0044\5\0\0=\5@\0044\5\0\0=\5A\0044\5\0\0=\5B\0044\5\0\0=\5C\0044\5\0\0=\5D\4=\4F\0035\4G\0=\4H\0035\4[\0005\5I\0005\6J\0005\aK\0=\a6\6=\6L\0055\6M\0=\6N\0055\6O\0=\6P\0055\6Q\0=\6R\0055\6S\0=\6T\0055\6U\0=\6V\0055\6W\0=\6X\0055\6Y\0=\6Z\5=\5;\0045\5\\\0=\5]\4=\4<\0034\4\0\0=\4-\3=\3^\0025\3`\0005\4_\0=\4H\0035\4j\0005\5a\0005\6b\0005\ac\0=\a6\6=\6L\0055\6d\0=\6N\0055\6e\0=\6P\0055\6f\0=\6T\0055\6g\0=\6V\0055\6h\0=\6X\0055\6i\0=\6Z\5=\5;\4=\4<\3=\3k\0025\3v\0005\4l\0005\5m\0005\6n\0005\ao\0=\a6\6=\6L\0055\6p\0=\6N\0055\6q\0=\6P\0055\6r\0=\6T\0055\6s\0=\6V\0055\6t\0=\6X\0055\6u\0=\6Z\5=\5;\4=\4<\3=\3!\2B\0\2\1K\0\1\0\1\0\1\vwindow\0\1\2\1\0\18order_by_type\vnowait\1\1\2\1\0\18order_by_size\vnowait\1\1\2\1\0\18order_by_name\vnowait\1\1\2\1\0\22order_by_modified\vnowait\1\1\2\1\0\25order_by_diagnostics\vnowait\1\1\2\1\0\21order_by_created\vnowait\1\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\2\0\14show_help\vnowait\1\vconfig\0\1\0\14\agu\21git_unstage_file\6A\16git_add_all\6o\0\aod\0\aom\0\aon\0\agg\24git_commit_and_push\agc\15git_commit\aoc\0\aos\0\agp\rgit_push\agr\20git_revert_file\aot\0\aga\17git_add_file\1\0\2\rposition\nfloat\rmappings\0\fbuffers\1\0\1\rmappings\0\1\2\1\0\18order_by_type\vnowait\1\1\2\1\0\18order_by_size\vnowait\1\1\2\1\0\18order_by_name\vnowait\1\1\2\1\0\22order_by_modified\vnowait\1\1\2\1\0\25order_by_diagnostics\vnowait\1\1\2\1\0\21order_by_created\vnowait\1\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\2\0\14show_help\vnowait\1\vconfig\0\1\0\n\aon\0\6o\0\aom\0\abd\18buffer_delete\aos\0\aot\0\aod\0\aoc\0\6.\rset_root\t<bs>\16navigate_up\1\0\4\24follow_current_file\0\vwindow\0\21group_empty_dirs\2\18show_unloaded\2\1\0\2\20leave_dirs_open\1\fenabled\2\15filesystem\26fuzzy_finder_mappings\1\0\4\t<up>\19move_cursor_up\n<C-n>\21move_cursor_down\n<C-p>\19move_cursor_up\v<down>\21move_cursor_down\1\0\2\26fuzzy_finder_mappings\0\rmappings\0\aot\1\2\1\0\18order_by_type\vnowait\1\aos\1\2\1\0\18order_by_size\vnowait\1\aon\1\2\1\0\18order_by_name\vnowait\1\aom\1\2\1\0\22order_by_modified\vnowait\1\aog\1\2\1\0\24order_by_git_status\vnowait\1\aod\1\2\1\0\25order_by_diagnostics\vnowait\1\aoc\1\2\1\0\21order_by_created\vnowait\1\6o\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\2\0\14show_help\vnowait\1\vconfig\0\1\0\18\aon\0\6#\17fuzzy_sorter\aom\0\aot\0\aog\0\aod\0\aoc\0\a]g\22next_git_modified\6H\18toggle_hidden\a[g\22prev_git_modified\6f\21filter_on_submit\6o\0\n<c-x>\17clear_filter\aos\0\6/\17fuzzy_finder\6D\27fuzzy_finder_directory\6.\rset_root\t<bs>\16navigate_up\24follow_current_file\1\0\2\20leave_dirs_open\1\fenabled\1\19filtered_items\1\0\a\27use_libuv_file_watcher\1\26hijack_netrw_behavior\17open_default\21group_empty_dirs\1\vwindow\0\24follow_current_file\0\rcommands\0\19filtered_items\0\26never_show_by_pattern\15never_show\27always_show_by_pattern\16always_show\20hide_by_pattern\17hide_by_name\1\0\n\26never_show_by_pattern\0\15never_show\0\27always_show_by_pattern\0\16always_show\0\20hide_by_pattern\0\17hide_by_name\0\16hide_hidden\1\20hide_gitignored\1\18hide_dotfiles\1\fvisible\1\18nesting_rules\vwindow\rmappings\6a\1\0\1\14show_path\tnone\1\2\1\0\badd\vconfig\0\6P\vconfig\1\0\2\14use_float\2\19use_image_nvim\2\1\2\1\0\19toggle_preview\vconfig\0\f<space>\1\0\27\6d\vdelete\6s\16open_vsplit\6A\18add_directory\6C\15close_node\6x\21cut_to_clipboard\6p\25paste_from_clipboard\6z\20close_all_nodes\6m\tmove\6c\tcopy\6?\14show_help\6<\16prev_source\6S\15open_split\6P\0\6i\22show_file_details\6>\16next_source\n<esc>\vcancel\t<cr>\topen\18<2-LeftMouse>\topen\f<space>\0\6w\28open_with_window_picker\6l\18focus_preview\6q\17close_window\6a\0\6R\frefresh\6r\vrename\6y\22copy_to_clipboard\6t\16open_tabnew\1\2\1\0\16toggle_node\vnowait\1\20mapping_options\1\0\2\fnoremap\2\vnowait\2\1\0\4\nwidth\3(\rmappings\0\rposition\tleft\20mapping_options\0\rcommands\30default_component_configs\19symlink_target\1\0\1\fenabled\1\fcreated\1\0\2\19required_width\3n\fenabled\2\18last_modified\1\0\2\19required_width\3X\fenabled\2\ttype\1\0\2\19required_width\3z\fenabled\2\14file_size\1\0\2\19required_width\3@\fenabled\2\15git_status\fsymbols\1\0\1\fsymbols\0\1\0\t\rconflict\bÓúß\vstaged\bÔÅÜ\runstaged\tÛ∞Ñ±\rmodified\5\fignored\bÔë¥\14untracked\bÔÑ®\frenamed\tÛ∞Åï\fdeleted\b‚úñ\nadded\5\tname\1\0\3\19trailing_slash\1\14highlight\20NeoTreeFileName\26use_git_status_colors\2\rmodified\1\0\2\14highlight\20NeoTreeModified\vsymbol\b[+]\ticon\1\0\5\14highlight\20NeoTreeFileIcon\17folder_empty\tÛ∞úå\16folder_open\bÓóæ\fdefault\6*\18folder_closed\bÓóø\vindent\1\0\t\14highlight\24NeoTreeIndentMarker\23expander_highlight\20NeoTreeExpander\22expander_expanded\bÔëº\23expander_collapsed\bÔë†\23last_indent_marker\b‚îî\18indent_marker\b‚îÇ\17with_markers\2\fpadding\3\1\16indent_size\3\2\14container\1\0\v\14file_size\0\15git_status\0\14container\0\rmodified\0\19symlink_target\0\ttype\0\vindent\0\tname\0\fcreated\0\18last_modified\0\ticon\0\1\0\1\26enable_character_fade\2\20source_selector\1\0\2\vwinbar\1\15statusline\1$open_files_do_not_replace_types\1\4\0\0\rterminal\ftrouble\aqf\1\0\14\15filesystem\0\18nesting_rules\0\30default_component_configs\0\rcommands\0\fbuffers\0\20source_selector\0\15git_status\0\26sort_case_insensitive\1\vwindow\0$open_files_do_not_replace_types\0\23enable_diagnostics\2\22enable_git_status\2\23popup_border_style\frounded\25close_if_last_window\1\nsetup\rneo-tree\frequire\1\0\2\vtexthl\23DiagnosticSignHint\ttext\tÛ∞åµ\23DiagnosticSignHint\1\0\2\vtexthl\23DiagnosticSignInfo\ttext\tÔÅö \23DiagnosticSignInfo\1\0\2\vtexthl\23DiagnosticSignWarn\ttext\tÔÅ± \23DiagnosticSignWarn\1\0\2\vtexthl\24DiagnosticSignError\ttext\tÔÅó \24DiagnosticSignError\16sign_define\afn\bvim\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: oil.nvim
time([[Config for oil.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\boil\frequire\0", "config", "oil.nvim")
time([[Config for oil.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: mini.ai
time([[Config for mini.ai]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fmini.ai\frequire\0", "config", "mini.ai")
time([[Config for mini.ai]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd render-markdown.nvim ]]

-- Config for: render-markdown.nvim
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20render-markdown\frequire\0", "config", "render-markdown.nvim")

time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
