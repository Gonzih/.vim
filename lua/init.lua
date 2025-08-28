-- Modern Neovim Lua configuration loader

-- Load plugin configurations
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.hop')

-- Set up autocmd to load Lua configuration for Neovim
vim.cmd([[
  augroup LoadLuaConfig
    autocmd!
    autocmd VimEnter * lua require('init')
  augroup END
]])