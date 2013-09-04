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

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" autofolding with preserving self folding
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
augroup END

" change bar color based on the mode
"if version >= 700
"  au InsertEnter * hi StatusLine term=reverse ctermfg=15 ctermbg=32
"  au InsertLeave * hi StatusLine term=reverse ctermfg=233 ctermbg=250 
"endif
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
" let mapleader=","
set cursorline
set backspace=indent,eol,start
set autowrite
set autoread
set colorcolumn=120
set clipboard=unnamedplus
"Bubble single lines (kicks butt)
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Buffer switch
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>
map <Leader>] :bnext<cr>
map <Leader>[ :bprevious<cr>

" Tab switch
map <C-Right> :tabnext<cr>
map <C-Left> :tabprevious<cr>

" Global paste
map <S-Insert> "+p<cr>

colorscheme lucius
LuciusLight

" some remapping
cmap W w
cmap Q q


" history {
  set history=1000
  set undolevels=1000
" }

" Statusline {
  set laststatus=2
"  set statusline=
"  set statusline +=\ %n\            "buffer number
"  set statusline +=%{&ff}            "file format
"  set statusline +=%y                "file type
"  set statusline +=\ %<%F            "full path
"  set statusline +=%m                "modified flag
"  set statusline +=%=%5l             "current line
"  set statusline +=/%L               "total lines
"  set statusline +=%4v\            "virtual column number
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" }

" search {
  set shiftround
  set ignorecase
  set smartcase
  set hlsearch
  set incsearch
  nnoremap <CR> :noh<CR><CR>
" }
"
" auto save view {
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
" }

" visual characters {
  set list 
  set listchars=tab:>.,trail:.,extends:#,nbsp:.
  set fillchars=vert:\ 
" }

" tab completition {
  " set wildmode=longest,list,full
  " set wildmenu
  " set wildmenu
  " set wildmode=list:longest

  " set wildignore+=.hg,.git,.svn                    " Version control
  " set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
  " set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
  " set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
  " set wildignore+=*.spl                            " compiled spelling word
  " set wildignore+=*.sw?                            " Vim swap files
  " set wildignore+=*.DS_Store                       " OSX bullshit
  " 
  " set wildignore+=*.luac                           " Lua byte code
  " 
  " set wildignore+=migrations                       " Django migrations
  " set wildignore+=*.pyc                            " Python byte code
  " 
  " set wildignore+=*.orig            "
  " inoremap <Tab> <C-R>=SuperCleverTab()<cr>
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

" gui {
if has("gui_running")
  set guioptions=em
  set guifont=Liberation\ Mono\ for\ Powerline\ 9
  set linespace=5
  let g:lucius_use_bold=0
  set showtabline=2
endif
" }
