vim.opt.background = "dark"
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "noinsert,menuone,noselect"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.expandtab = true
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "manual"
vim.opt.hidden = true
vim.opt.inccommand = "split"
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.ttimeoutlen = 0
vim.opt.wildmenu = true
vim.opt.wrap = true

vim.cmd [[set noshowmode]] 
vim.cmd [[set ignorecase]]
vim.cmd [[set formatoptions-=cro]]

vim.cmd [[imap <F2> <esc>:w<CR>i<right>]]
vim.cmd [[nmap <F2> :w<CR>]]
vim.cmd [[imap <M-.> <esc>gt]]
vim.cmd [[imap <M-,> <esc>gT]]
vim.cmd [[nmap <M-.> gt]]
vim.cmd [[nmap <M-,> gT]]
vim.cmd [[imap <F8> <C-O>dd]]
vim.cmd [[colorscheme my]]
vim.cmd [[packadd packer.nvim]]
vim.cmd [[let g:neo_tree_remove_legacy_commands = 1]]

--local function GitStatusLine()
--  local res = GitGutterGetHunkSummary()
--  return string.format('+%d ~%d -%d', res[0], res[1], res[2])
--end
--vim.opt.statusline=vim.opt.statusline+GitStatusLine()
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'famiu/feline.nvim'
  require('feline').setup()
  --require('feline').winbar.setup()
  --use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  vim.cmd [[autocmd VimEnter * GitGutterLineNrHighlightsEnable]]
  vim.cmd [[highlight IndentBlanklineChar guifg=#000000 gui=nocombine]]
  use "lukas-reineke/indent-blankline.nvim"
  require("indent_blankline").setup{
    char = '▎' --'▏' -- ''▎' -- '▏' --'⎸' -- '⸾' --
  }
  use 'neovim/nvim-lspconfig'
  use 'dart-lang/dart-vim-plugin'
  --use 'thosakwe/vim-flutter'
  use 'natebosch/vim-lsc'
  use 'natebosch/vim-lsc-dart'
  use {
    'akinsho/flutter-tools.nvim',
    --opt = true,
    --module = 'flutter-tools',
    requires = {'nvim-lua/plenary.nvim'}
  }
  require("flutter-tools").setup {} -- use default

 local signs = { Error = "✖", Warn = "❗", Hint = "▶", Info = "i" }
 for type, icon in pairs(signs) do
   local hl = "DiagnosticSign" .. type
   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
 end
end);
