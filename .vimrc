" Environment
syntax enable
set nocompatible
set encoding=utf-8
set number
set background=dark
" set t_Co=256
colorscheme zenburn

" Split configuration
set splitbelow splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Indent configuration
set expandtab autoindent
set tabstop=4
set shiftwidth=4 
set softtabstop=4
set fileformat=unix
set textwidth=80 

" Vundle configuration and plugins
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'marijnh/tern_for_vim'

call vundle#end()
filetype plugin indent on

" Folding configuration
set foldmethod=indent 
set foldlevel=99 
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" YCM configuration
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1

" NerdTree config
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


" Typescript Vim config
let g:syntastic_typescript_tsc_args = '--experimentalDecorators'


let g:syntastic_check_on_open=1
