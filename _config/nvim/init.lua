vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "manual"
vim.opt.hidden = true
vim.opt.inccommand = "split"
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
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
vim.cmd [[set clipboard+=unnamedplus]]

vim.cmd [[imap <F2> <C-o>:w<CR>]]
vim.cmd [[nmap <F2> :w<CR>]]
vim.cmd [[imap <M-.> <esc>gt]]
vim.cmd [[imap <M-,> <esc>gT]]
vim.cmd [[nmap <M-.> gt]]
vim.cmd [[nmap <M-,> gT]]
vim.cmd [[imap <F8> <C-O>dd]]
vim.cmd [[imap <C-.> <C-o>:bnext<CR>]]
vim.cmd [[imap <C-,> <C-o>:bprev<CR>]]
vim.cmd [[nmap <C-.> :bnext<CR>]]
vim.cmd [[nmap <C-,> :bprev<CR>]]
vim.cmd [[colorscheme my]]
vim.cmd [[packadd packer.nvim]]
vim.cmd [[let g:neo_tree_remove_legacy_commands = 1]]
vim.cmd [[inoremap <C-S-Up> <C-o>:m-2<CR>]]
vim.cmd [[inoremap <C-S-Down> <C-o>:m+1<CR>]]
vim.cmd [[noremap <C-S-Up> :m-2<CR>]]
vim.cmd [[noremap <C-S-Down> :m+1<CR>]]
vim.cmd [[imap <C-S-d> <C-o>yy<C-o>p]]
vim.cmd [[inoremap {<CR> {<CR>}<C-o>O]]
vim.cmd [[imap <C-Up> <C-o><C-y><Up>]]
vim.cmd [[imap <C-Down> <C-o><C-e><Down>]]
vim.cmd [[nmap <C-Up> <Up><C-y>]]
vim.cmd [[nmap <C-Down> <Down><C-e>]]
--vim.cmd [[inoremap <C-R><C-V> <C-R>. = <C-R>"]]

vim.api.nvim_exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup end
]], false)

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

