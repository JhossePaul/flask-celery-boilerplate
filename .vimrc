" Encoding 
set encoding=utf-8

" Split configuration
set splitbelow splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Indent configuration
set expandtab autoindent

" Python PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set shiftwidth=4 
    \ set softtabstop=4
    \ set fileformat=unix

" Web development codestyle
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
    \ match BadWhitespace /\s\+$/

" Screen configuration
set background=dark
set textwidth=80 
set fo+=t

" Syntax configuration
syntax on

" Folding configuration
set foldmethod=indent 
set foldlevel=99 
nnoremap <space> za


" Vundle configuration and plugins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tmhedberg/SimpylFold'

call vundle#end()
filetype plugin indent on

let g:SimpylFold_docstring_preview=1
