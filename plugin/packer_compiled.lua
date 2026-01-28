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
local package_path_str = "/Users/pranabkc/.cache/nvim/packer_hererocks/2.1.1767980792/share/lua/5.1/?.lua;/Users/pranabkc/.cache/nvim/packer_hererocks/2.1.1767980792/share/lua/5.1/?/init.lua;/Users/pranabkc/.cache/nvim/packer_hererocks/2.1.1767980792/lib/luarocks/rocks-5.1/?.lua;/Users/pranabkc/.cache/nvim/packer_hererocks/2.1.1767980792/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/pranabkc/.cache/nvim/packer_hererocks/2.1.1767980792/lib/lua/5.1/?.so"
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
  LuaSnip = {
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n�\t\0\0\b\0\28\00146\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0015\2\5\0=\2\4\0019\1\2\0009\1\6\0014\2\6\0009\3\a\0'\5\b\0'\6\t\0'\a\n\0B\3\4\2>\3\1\0029\3\a\0'\5\v\0'\6\f\0'\a\r\0B\3\4\2>\3\2\0029\3\a\0'\5\14\0'\6\15\0'\a\16\0B\3\4\2>\3\3\0029\3\a\0'\5\17\0'\6\18\0'\a\19\0B\3\4\2>\3\4\0029\3\a\0'\5\20\0'\6\21\0'\a\22\0B\3\4\0?\3\0\0=\2\4\0019\1\2\0009\1\23\1'\2\24\0=\2\4\0016\1\0\0'\3\25\0B\1\2\0029\1\26\0019\3\27\0B\1\2\1K\0\1\0\topts\nsetup\nalpha\21Happy Coding, KC\vfooter\f:qa<CR>\15󰅚  Quit\6q':lua require('kc').open_todo()<CR>\24󰄱  Project Todos\6t\28:Telescope oldfiles<CR>\22  Recent Files\6r\31:ene <BAR> startinsert<CR>\18  New File\6n\30:Telescope find_files<CR>\19  Find File\6f\vbutton\fbuttons\1\v\0\0;                                                      U          ██╗  ██╗             ██████╗                Y          ██║ ██╔╝            ██╔════╝                U          █████╔╝     ██╗     ██║                     U          ██╔═██╗     ╚═╝     ██║                     W          ██║  ██╗            ╚██████╗                U          ╚═╝  ╚═╝             ╚═════╝                ;                                                      ;         K.C - DEVELOPMENT ENVIRONMENT                ;                                                      \bval\vheader\fsection\27alpha.themes.dashboard\frequire\v����\4\0" },
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\5\0\22\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\18\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\3=\3\19\0025\3\20\0=\3\21\2B\0\2\1K\0\1\0\19format_on_save\1\0\2\17lsp_fallback\2\15timeout_ms\3�\3\21formatters_by_ft\1\0\2\19format_on_save\0\21formatters_by_ft\0\bcpp\1\2\0\0\17clang-format\bphp\1\2\0\0\17php-cs-fixer\tdart\1\2\0\0\16dart_format\15typescript\1\3\0\0\14prettierd\rprettier\15javascript\1\3\0\0\14prettierd\rprettier\vpython\1\3\0\0\nisort\nblack\blua\1\0\a\tdart\0\15typescript\0\blua\0\bcpp\0\15javascript\0\bphp\0\vpython\0\1\2\0\0\vstylua\nsetup\fconform\frequire\0" },
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["flutter-tools.nvim"] = {
    config = { "\27LJ\2\n�\1\0\2\t\0\f\0\0255\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\6\0006\a\2\0009\a\a\a9\a\b\a9\a\t\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\n\0006\a\2\0009\a\a\a9\a\b\a9\a\v\a\18\b\2\0B\3\5\1K\0\1\0\nhover\6K\15definition\bbuf\blsp\agd\6n\bset\vkeymap\bvim\vbuffer\1\0\1\vbuffer\0�\2\1\0\b\0\15\0\0213\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0005\4\5\0=\4\6\0035\4\a\0=\0\b\0046\5\1\0'\a\t\0B\5\2\0029\5\n\5B\5\1\2=\5\v\4=\4\f\0035\4\r\0=\4\14\3B\1\2\1K\0\1\0\rdebugger\1\0\2\16run_via_dap\2\fenabled\2\blsp\17capabilities\25default_capabilities\17cmp_nvim_lsp\14on_attach\1\0\2\17capabilities\0\14on_attach\0\18widget_guides\1\0\1\fenabled\2\1\0\5\rdebugger\0\blsp\0\18widget_guides\0\bfvm\1\17flutter_path\0\nsetup\18flutter-tools\frequire\0\0" },
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/flutter-tools.nvim",
    url = "https://github.com/akinsho/flutter-tools.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kanagawa.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\25colorscheme kanagawa\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n~\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\tview\1\0\2\tside\tleft\18adaptive_size\2\1\0\2\tview\0\20respect_buf_cwd\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/pranabkc/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n�\t\0\0\b\0\28\00146\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0015\2\5\0=\2\4\0019\1\2\0009\1\6\0014\2\6\0009\3\a\0'\5\b\0'\6\t\0'\a\n\0B\3\4\2>\3\1\0029\3\a\0'\5\v\0'\6\f\0'\a\r\0B\3\4\2>\3\2\0029\3\a\0'\5\14\0'\6\15\0'\a\16\0B\3\4\2>\3\3\0029\3\a\0'\5\17\0'\6\18\0'\a\19\0B\3\4\2>\3\4\0029\3\a\0'\5\20\0'\6\21\0'\a\22\0B\3\4\0?\3\0\0=\2\4\0019\1\2\0009\1\23\1'\2\24\0=\2\4\0016\1\0\0'\3\25\0B\1\2\0029\1\26\0019\3\27\0B\1\2\1K\0\1\0\topts\nsetup\nalpha\21Happy Coding, KC\vfooter\f:qa<CR>\15󰅚  Quit\6q':lua require('kc').open_todo()<CR>\24󰄱  Project Todos\6t\28:Telescope oldfiles<CR>\22  Recent Files\6r\31:ene <BAR> startinsert<CR>\18  New File\6n\30:Telescope find_files<CR>\19  Find File\6f\vbutton\fbuttons\1\v\0\0;                                                      U          ██╗  ██╗             ██████╗                Y          ██║ ██╔╝            ██╔════╝                U          █████╔╝     ██╗     ██║                     U          ██╔═██╗     ╚═╝     ██║                     W          ██║  ██╗            ╚██████╗                U          ╚═╝  ╚═╝             ╚═════╝                ;                                                      ;         K.C - DEVELOPMENT ENVIRONMENT                ;                                                      \bval\vheader\fsection\27alpha.themes.dashboard\frequire\v����\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\5\0\22\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\18\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\3=\3\19\0025\3\20\0=\3\21\2B\0\2\1K\0\1\0\19format_on_save\1\0\2\17lsp_fallback\2\15timeout_ms\3�\3\21formatters_by_ft\1\0\2\19format_on_save\0\21formatters_by_ft\0\bcpp\1\2\0\0\17clang-format\bphp\1\2\0\0\17php-cs-fixer\tdart\1\2\0\0\16dart_format\15typescript\1\3\0\0\14prettierd\rprettier\15javascript\1\3\0\0\14prettierd\rprettier\vpython\1\3\0\0\nisort\nblack\blua\1\0\a\tdart\0\15typescript\0\blua\0\bcpp\0\15javascript\0\bphp\0\vpython\0\1\2\0\0\vstylua\nsetup\fconform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n~\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\tview\1\0\2\tside\tleft\18adaptive_size\2\1\0\2\tview\0\20respect_buf_cwd\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: kanagawa.nvim
time([[Config for kanagawa.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\25colorscheme kanagawa\bcmd\bvim\0", "config", "kanagawa.nvim")
time([[Config for kanagawa.nvim]], false)
-- Config for: flutter-tools.nvim
time([[Config for flutter-tools.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\2\t\0\f\0\0255\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\6\0006\a\2\0009\a\a\a9\a\b\a9\a\t\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\n\0006\a\2\0009\a\a\a9\a\b\a9\a\v\a\18\b\2\0B\3\5\1K\0\1\0\nhover\6K\15definition\bbuf\blsp\agd\6n\bset\vkeymap\bvim\vbuffer\1\0\1\vbuffer\0�\2\1\0\b\0\15\0\0213\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0005\4\5\0=\4\6\0035\4\a\0=\0\b\0046\5\1\0'\a\t\0B\5\2\0029\5\n\5B\5\1\2=\5\v\4=\4\f\0035\4\r\0=\4\14\3B\1\2\1K\0\1\0\rdebugger\1\0\2\16run_via_dap\2\fenabled\2\blsp\17capabilities\25default_capabilities\17cmp_nvim_lsp\14on_attach\1\0\2\17capabilities\0\14on_attach\0\18widget_guides\1\0\1\fenabled\2\1\0\5\rdebugger\0\blsp\0\18widget_guides\0\bfvm\1\17flutter_path\0\nsetup\18flutter-tools\frequire\0\0", "config", "flutter-tools.nvim")
time([[Config for flutter-tools.nvim]], false)

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
