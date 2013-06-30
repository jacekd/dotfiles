" Vimrc file
" maintained by Jacek Dominiak
set nocompatible "starts with the basics
execute pathogen#infect()
call pathogen#incubate()
call pathogen#helptags()

syntax on
filetype plugin indent on

" Functions {
function! SuperCleverTab()
  "check if at beginning of line or after a space
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    " do we have omni completion available
    if &omnifunc != ''
      "use omni-completion 1. priority
      return "\<C-X>\<C-O>"
    elseif &dictionary != ''
      " no omni completion, try dictionary completio
      return “\<C-K>”
    else
      "use omni completion or dictionary completion
      "use known-word completion
      return "\<C-N>"
    endif
  endif
endfunction
" }

set number
set nowrap
set background=light
set title " set window title
set softtabstop=2 tabstop=2 shiftwidth=2
set expandtab "spaces instead of tabs
set encoding=utf-8
set autoindent
set smartindent
set pastetoggle=<F12>
let mapleader=","
set cursorline
colorscheme lucius
LuciusLight

" history {
  set history=1000
  set undolevels=1000
" }

" Statusline {
  set laststatus=2
  set statusline=
  set statusline +=\ %n\            "buffer number
  set statusline +=%{&ff}            "file format
  set statusline +=%y                "file type
  set statusline +=\ %<%F            "full path
  set statusline +=%m                "modified flag
  set statusline +=%=%5l             "current line
  set statusline +=/%L               "total lines
  set statusline +=%4v\            "virtual column number
" }

" search {
  set shiftround
  set ignorecase
  set smartcase
  set hlsearch
  set incsearch
" }
"
" auto save view {
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
" }

" visual characters {
  set list 
  set listchars=tab:>.,trail:.,extends:#,nbsp:.
" }

" tab completition {
  set wildmode=longest,list,full
  set wildmenu
  inoremap <Tab> <C-R>=SuperCleverTab()<cr>
" }

" plugins {
if exists(":Gstatus")
    nnoremap <leader>gs :Gstatus<CR>
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>gc :Gcommit<CR>
    nnoremap <leader>gb :Gblame<CR>
    nnoremap <leader>gl :Glog<CR>
    nnoremap <leader>gp :Git push<CR>
endif

map <Leader>' :TagbarToggle<CR>

let g:neocomplcache_enable_at_startup=1
" }

