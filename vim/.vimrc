" serguey's vimrc

if has('gui_running')
    set guifont=Menlo\ for\ Powerline:h12 " font if we're running a GUI
    set guicursor+=a:blinkon0 " no blinking
    " this doesn't work if it's all one line
    set go-=T " remove toolbar
    set go-=m " remove menu bar
    set go-=L " remove left toolbar
    set go-=r " remove right toolbar
    set lines=999 columns=9999 " default lines and columns on opening
endif

set background=dark " dark background
colorscheme jellybeans " color scheme of the week/month/year
set encoding=utf-8 " utf-8

syntax on " turn on syntax highlighting

set nocompatible " who cares about vi compat, I sure don't

set nu " line numbers
set autoindent " indentation
set shiftwidth=4 " number of spaces for autoindent
set softtabstop=4 " number of spaces when adding/removing tabs
set tabstop=4 " width of a tab character
set expandtab " expand tabs
set showcmd " show the command being typed
set ruler " always show current position
set wildmenu " command-line completion
set laststatus=2 " always show status line
" set cul " highlight current line (makes syntax highlighting super slow)
set hidden " enable hidden buffers
set pastetoggle=<F3> " enable paste toggle

" backup files
set nobackup
set noswapfile " no swap files, please

set backspace=indent,eol,start " make backspace work well

" search related
set incsearch " incremental search
set hlsearch " highlight search terms
set ignorecase " ignore search case
set smartcase " unless there are capital letters in it

" when to have spellcheck
autocmd Filetype mail,markdown setl spell

" space to stop hilighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" tidy json
nnoremap <silent> <Leader>j :%!python -m json.tool<CR>
" nerdtree
nnoremap <F2> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=1 " fancy arrows
" airline
let g:airline_powerline_fonts = 1 " fancy fonts
" dash
nmap <silent> <Leader>d <Plug>DashSearch
" markdown
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json', 'ruby', 'sass', 'xml', 'php', 'sql']
" trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" platform-specific setup
if has('win32') || has('win64') " looks like we're using windows
    " vundle
    set rtp+=~/vimfiles/bundle/Vundle.vim/
    call vundle#begin('$HOME/vimfiles/bundle/')
    " temp dir for windows
    set directory=.,$TEMP
else
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#begin()
endif

filetype off " necessary for vundle and older versions of vim
" FIX: PluginUpdate => git pull: git-sh-setup: No such file or directory in MacVim (OK in non-GUI version of Vim)
if has("gui_macvim")
    set shell=/bin/bash\ -l
endif
" vundle plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'elzr/vim-json'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'gregsexton/MatchTag'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-markdown'
Plugin 'sophacles/vim-processing'
Plugin 'groenewege/vim-less'
Plugin 'vim-scripts/SAS-Syntax'
Plugin 'tpope/vim-abolish'
Plugin 'leafgarland/typescript-vim'

call vundle#end()
filetype plugin indent on " turn on filetypes
