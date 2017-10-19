let s:current_file = expand("<sfile>:p")

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
set laststatus=2      " always show the status bar
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

set nowrap                            " don't wrap lines
set tabstop=2                         " a tab is two spaces
set shiftwidth=2                      " an autoindent (with <<) is two spaces
set expandtab                         " use spaces, not tabs
set list listchars=tab:\ \ ,trail:.,extends:>   " a tab should display as "  ", trailing whitespace as "."
set backspace=indent,eol,start        " backspace through everything in insert mode
set background=dark

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Disable swap files
""
set nobackup
set nowritebackup
set noswapfile

""
"" Vundle
""
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'

call vundle#end()
filetype plugin indent on

colorscheme solarized

let mapleader=","

" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s*$//
  ''
  :retab
:endfunction

autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre * :call TrimWhiteSpace()

map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>

set wildmode=list:longest,list:full
set wildignore+=*.gif,*.png,*.jpg,*.o,*.obj,*.rbc,*.class,.svn,tmp/*,log/*,target/*,build/*

" Navigate between split windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" remember last position in file
" see :help last-position-jump
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif

" NERDTree
let g:NERDTreeWinSize=40
let g:NERDTreeChDirMode=2
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
let g:NERDTreeMouseMode=2
map <Leader>n :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>

" Ack
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" fzf
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>

" Ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" GitGutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Airline
let g:airline_theme='solarized'

" highlight current line
set cursorline
hi CursorLine cterm=none ctermbg=black
hi ALEWarning ctermbg=none cterm=underline

" Opens the directory browser for the directory of the current path.
" <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

