" serguey's vimrc

set background=dark " dark background
colorscheme jellybeans " color scheme of the week/month/year
set guifont=Consolas:h10 " font if we're running a GUI
set encoding=utf-8 " utf-8
set guicursor+=a:blinkon0 " no blinking
" this doesn't work if it's all one line
set go-=T " remove toolbar
set go-=m " remove menu bar
set go-=L " remove left toolbar
set go-=r " remove right toolbar

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
set cul " highlight current line
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

" mail stuff
autocmd Filetype mail setl spell

" space to stop hilighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" tidy json
nnoremap <silent> <Leader>j :%!python -m json.tool<CR> 

" platform-specific setup
if has('win32') || has('win64') " looks like we're using windows
    " vundle
    set rtp+=~/vimfiles/bundle/vundle/
    call vundle#rc('$HOME/vimfiles/bundle/')
    " temp dir for windows
    set directory=.,$TEMP
else
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
endif

filetype off " necessary for vundle
" vundle bundles
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'elzr/vim-json'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}

filetype plugin indent on " turn on filetypes

" nerdtree 
nnoremap <F2> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=1 " fancy arrows
