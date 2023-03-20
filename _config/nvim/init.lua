local set = vim.opt

set.background = "dark"
set.clipboard = "unnamedplus"
set.completeopt = "noinsert,menuone,noselect"
set.cursorline = true
set.expandtab = true
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldmethod = "manual"
set.hidden = true
set.inccommand = "split"
set.mouse = "a"
set.number = true
set.relativenumber = true
set.shiftwidth = 2
set.smarttab = true
set.splitbelow = true
set.splitright = true
set.swapfile = false
set.tabstop = 2
set.termguicolors = true
set.title = true
set.ttimeoutlen = 0
set.updatetime = 250
set.wildmenu = true
set.wrap = true

vim.cmd [[imap <F2> <esc>:w<CR>i<right>]]
vim.cmd [[nmap <F2> :w<CR>]]
--vim.cmd [[au InsertEnter * hi StatusLine guifg=#303030 guibg=#c0c0c0]]
--vim.cmd [[au InsertLeave * hi StatusLine guifg=#000000 guibg=#cccc00]]
--vim.cmd [[hi StatusLine guibg=#000000 guifg=#cccc00]]
-- This file can be loaded by calling `lua require('plugins')` from your init.vim


-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
vim.cmd [[colorscheme my]]

return require('packer').startup(function(use)
-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
use 'feline-nvim/feline.nvim'
require('feline').setup()
use 'alaviss/nim.nvim' 
--use {
--  "norcalli/nvim-colorizer.lua",
--  cmd = "ColorizerToggle",
--  config = function()
--    require("colorizer").setup()
--  end,
--}
end)
