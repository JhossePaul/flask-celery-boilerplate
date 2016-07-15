"""""""""""""""""""""
" Plugins
"""""""""""""""""""""
syntax on
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Themes
Plugin 'altercation/vim-colors-solarized'

" File Navigation
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" Syntax, linters and completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'

" Input Plugins
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'

" Control Version (GIT) support
" Plugin 'tpope/vim-fugitive'

" Screen Plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
Plugin 'ryanoasis/vim-devicons'

" HTML plugins
Plugin 'rstacruz/sparkup', { 'rtp': 'vim/' }

" Stylesheets Plugins
Plugin 'skammer/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'

" Javascript plugins
Plugin 'marijnh/tern_for_vim'
Plugin 'moll/vim-node'
Plugin 'othree/yajs.vim'
Plugin 'othree/jspc.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'othree/javascript-libraries-syntax.vim'

" Typescript
Plugin 'HerringtonDarkholme/yats.vim'

" Python plugins
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'tmhedberg/SimpylFold'

call vundle#end()
filetype plugin indent on


"""""""""""""""""""""""""""
" Plugins Configuration
"""""""""""""""""""""""""""

" CtrlP Config
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" NerdTree config
let g:NERDTreeFileExtensionHighlightFullName = 1

let NERDTreeIgnore = ['\.pyc$', '\~$'] "ignore files in NERDTree

" Quit VIM if NERDTree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree custom highlight colors
let g:NERDTreeExtensionHighlightColor = {} 
let g:NERDTreeExtensionHighlightColor['py'] = '009688'
let g:NERDTreeExtensionHighlightColor['js'] = 'F7DF1E'
let g:NERDTreeExtensionHighlightColor['md'] = 'FFFFFF'
let g:NERDTreeExtensionHighlightColor['ts'] = '0179CC'
let g:NERDTreeExtensionHighlightColor['css'] = '1673B6'
let g:NERDTreeExtensionHighlightColor['html'] = 'F16529'
let g:NERDTreeExtensionHighlightColor['php'] = '603994'

" Airline Config
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme="luna"
let g:airline#extensions#tabline#enabled=1

" DevIcons Config
" let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
" let g:webdevicons_conceal_nerdtree_brackets = 1
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
" let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" Syntastic Config
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['eslint'] " JavaScript Syntax
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_typescript_tsc_args = "--experimentalDecorators"
let g:syntastic_python_checkerts = ['pylint']

" Pangloss JavaScript Configuration
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" JavaScript libraries syntax highlight
let g:used_javascript_libs = 'underscore,jquery,angularjs,angularui,angularuirouter,requirejs'

" Tern for Vim Config
let g:tern_map_keys = 1

" TypeScript Vim Configuration
let g:typescript_compiler_options = '--experimentalDecorators'

" Python syntax highlight
let python_highlight_all = 1

" Solarized theme
let g:solarized_termcolors=16
" let g:solarized_contrast = 'high'

"""""""""""""""""""""
" Settings
"""""""""""""""""""""

" Environment
set encoding=utf-8
set fileformat=unix

" Backspace Workarounds
set backspace=2

" Screen Config
set splitbelow splitright
set cursorline
set number
set t_Co=256
set background=dark
colorscheme solarized

" Indent configuration
set textwidth=80
set expandtab autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Folding configuration
set foldmethod=indent
set foldlevel=99

"""""""""""""""""""""
" Mappings
"""""""""""""""""""""

" Leader
let mapleader = "\<Space>"

" Common tasks
"" Toggle numbers
noremap <F3> :set invnumber<CR>
" Write file
nnoremap <Leader>w :w<CR>
" Instert at the beggining of the line
inoremap <I> <i><C-o><S-I>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" NERDTree Mappings
map <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""
" Deprecated Plugins
""""""""""""""""""""""""
" Plugin 'Quramy/vim-js-pretty-template'
" Plugin 'jalvesaq/Nvim-R'
" Plugin 'junegunn/vim-easy-align'
" Plugin 'nvie/vim-flake8'

" Plugin 'othree/html5.vim' " Included in vim-polyglot
" Plugin 'othree/html5-syntax.vim' " Inlcuded in vim-polyglot
" Plugin 'pangloss/vim-javascript' " Included in vim-polyglot
" Plugin 'leafgarland/typescript-vim' " Included in vim-polyglot
" Plugin 'helino/vim-json' " Included in vim-polyglot
" Plugin 'Shougo/vimproc.vim' " Requirement for tsuquyomi
"
" Plugin 'Quramy/tsuquyomi' " Evaluate if YouCompleteMe is active
