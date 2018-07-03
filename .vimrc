"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ____ ____ _  _ ____ ____ ____ _       ____ ____ ___ ___ _ _  _ ____ ____
"  | __ |___ |\ | |___ |__/ |__| |       [__  |___  |   |  | |\ | | __ [__
"  |__] |___ | \| |___ |  \ |  | |___    ___] |___  |   |  | | \| |__] ___]
"
syntax on
set nocompatible
filetype off

" Python syntax highlight
let python_highlight_all = 1

" Environment
set encoding=utf-8
set fileformat=unix

" Backspace Workarounds
set backspace=2

" Screen Config
set number
set cursorline
set splitbelow splitright
set conceallevel=1

" Theme Configuration
set background=dark
set t_Co=256
" colorscheme default

" Indent configuration
set expandtab autoindent
au BufNewFile,BufRead *.py,*.ts set
  \ tabstop=4
  \ softtabstop=4
  \ textwidth=80
  \ shiftwidth=4
au BufNewFile,BufRead *.js,*.css,*.html,*.sass,*.r set
  \ tabstop=2
  \ softtabstop=2
  \ textwidth=80
  \ shiftwidth=2

" Folding configuration
set foldlevel=99
set foldmethod=indent

" Highlight
"" Trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  _  _ ____ ___  ___  _ _  _ ____ ____
"  |\/| |__| |__] |__] | |\ | | __ [__
"  |  | |  | |    |    | | \| |__] ___]
"
"  _    ____ ____ ___  ____ ____
"  |___ |=== |--| |__> |=== |--<
"
" let mapleader = "\"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ____ ____ _  _ _  _ ____ __ _   ___ ____ ____ _  _ ____
"  |___ [__] |\/| |\/| [__] | \|    |  |--| ==== |-:_ ====
"
" Toggle numbers
noremap <F3> :set invnumber<CR>

" Write file
nnoremap <Leader>w :w<CR>

" Insert at the beggining of the line
inoremap <I> <i><C-o><S-I>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" Highlight trailing spaces
" :nnoremap <Leader>wn :match ExtraWhitespace /^\s* \s*\<Bar>\s\+$/<CR>
" :nnoremap <Leader>wf :match<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ___  _    _  _ ____ _ _  _ ____
"  |__] |    |  | | __ | |\ | [__
"  |    |___ |__| |__] | | \| ___]
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ____ _ _    ____   _  _ ____ __ _ ____ ____ ____ _  _ ____ __ _ ___
"  |--- | |___ |===   |\/| |--| | \| |--| |__, |=== |\/| |=== | \|  |
"
" CtrlP
"
" Source: https://github.com/ctrlpvim/ctrlp.vim
"
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
"
" Basic Usage
"     - Run :CtrlP or :CtrlP [starting-directory] to invoke CtrlP in find file
"     mode.
"     - Run :CtrlPBuffer or :CtrlPMRU to invoke CtrlP in find buffer or find MRU
"     file mode.
"     - Run :CtrlPMixed to search in Files, Buffers and MRU files at the same
"     time.
"
" Check :help ctrlp-commands and :help ctrlp-extensions for other commands.
"
" Once CtrlP is open:
"     - Press <F5> to purge the cache for the current directory to get new
"     files, remove deleted files and apply new ignore options.
"     - Press <c-f> and <c-b> to cycle between modes.
"     - Press <c-d> to switch to filename only search instead of full path.
"     - Press <c-r> to switch to regexp mode.
"     - Use <c-j>, <c-k> or the arrow keys to navigate the result list.
"     - Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in
"     a new split.
"     - Use <c-n>, <c-p> to select the next/previous string in the prompt's
"     history.
"     - Use <c-y> to create a new file and its parent directories.
"     - Use <c-z> to mark/unmark multiple files and <c-o> to open them.
"
" Run :help ctrlp-mappings or submit ? in CtrlP for more mapping help.
Plugin 'ctrlpvim/ctrlp.vim'

let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = 'node_modules|DS_Store|git|__pycache__'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The NERDTree
"
" The NERDTree is a file system explorer for the Vim editor. Using this
" plugin, users can visually browse complex directory hierarchies, quickly
" open files for reading or editing, and perform basic file system operations.
"
" See also :help NERDTree
" Source: https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'

" NERDTree Mappings
map <C-n> :NERDTreeToggle<CR>

" Blacklist for NERDTree
let NERDTreeIgnore = ['\.pyc$', '\~$', "__pycache__", "node_modules"]

" Quit VIM if NERDTree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 &&
  \ exists("b:NERDTree") &&
  \ b:NERDTree.isTabTree()) | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM DevIcons
"
" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline,
" Powerline, Unite, vim-startify and more
"
" Source: https://github.com/ryanoasis/vim-devicons
Plugin 'ryanoasis/vim-devicons'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim NERDTree Syntax Highlight
"
" This adds syntax for nerdtree on most common file extensions. Whether you
" want to easily see what is going on in a new project, trying to learn a new
" framework with a different folder structure, or just trying to make your
" NERDTree look better, this plugin can help you. This is intended to be used
" with vim-devicons to add color to icons or entire labels, but will work
" without it. It is possible to disable highlight, but the syntax will still
" be available if you want to make something specific with it. The file icons
" are linked to their labels which are linked to NERDTreeFile, so it will not
" break anything.
"
" Source: https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" Highlight full name (not only icons)
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" NERDTree custom highlight colors
let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['py'] = '009688'
let g:NERDTreeExtensionHighlightColor['js'] = 'F7DF1E'
let g:NERDTreeExtensionHighlightColor['ts'] = '0179CC'
let g:NERDTreeExtensionHighlightColor['css'] = '1673B6'
let g:NERDTreeExtensionHighlightColor['sass'] = 'CC6699'
let g:NERDTreeExtensionHighlightColor['scss'] = 'CC6699'
let g:NERDTreeExtensionHighlightColor['md'] = 'FFFFFF'
let g:NERDTreeExtensionHighlightColor['html'] = 'F16529'
let g:NERDTreeExtensionHighlightColor['php'] = '603994'

" Disable highlight for uncommon file extensions
" let g:NERDTreeLimitedSyntax = 1
" let g:NERDTreeSyntaxDisableDefaultExtensions = 1
" let g:NERDTreeDisableExactMatchHighlight = 1
" let g:NERDTreeDisablePatternMatchHighlight = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar: a class outline viewer for Vim
"
" Tagbar is a Vim plugin that provides an easy way to browse the tags of the
" current file and get an overview of its structure. It does this by creating a
" sidebar that displays the ctags-generated tags of the current file, ordered by
" their scope. This means that for example methods in C++ are displayed under
" the class they are defined in.
"
" Source: https://github.com/majutsushi/tagbar
Plugin 'majutsushi/tagbar'

nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  _  _ ____ ____ ____ _ ____ __ _   ____ ____ __ _ ___ ____ ____ _
"   \/  |=== |--< ==== | [__] | \|   |___ [__] | \|  |  |--< [__] |___
"
" NERDTree Git Plugin
"
" A plugin of NERDTree showing git status flags.
"
" Source: https://github.com/Xuyuanp/nerdtree-git-plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive.vim: A Git wrapper so awesome, it should be illegal
"
" View any blob, tree, commit, or tag in the repository with :Gedit (and
" :Gsplit, :Gvsplit, :Gtabedit, ...).  Edit a file in the index and write to it
" to stage the changes.
"
" Use :Gdiff to bring up the staged version of the file side by side with the
" working tree version and use Vim's diff handling capabilities to stage a
" subset of the file's changes.
"
" Bring up the output of git status with :Gstatus. Press - to add/reset a file's
" changes, or p to add/reset --patch. And guess what :Gcommit does!
"
" :Gblame brings up an interactive vertical split with git blame output. Press
" enter on a line to edit the commit where the line changed, or o to open it in
" a split. When you're done, use :Gedit in the historic buffer to go back to the
" work tree version.
"
" :Gmove does a git mv on a file and simultaneously renames the buffer. :Gdelete
" does a git rm on a file and simultaneously deletes the buffer.
"
" Use :Ggrep to search the work tree (or any arbitrary commit) with git grep,
" skipping over that which is not tracked in the repository.
"
" :Glog loads all previous revisions of a file into the quickfix list so you can
" iterate over them and watch the file evolve!
"
" :Gread is a variant of git checkout -- filename that operates on the buffer
" rather than the filename. This means you can use u to undo it and you never
" get any warnings about the file changing outside Vim.
"
" :Gwrite writes to both the work tree and index versions of a file, making it
" like git add when called from a work tree file and like git checkout when
" called from the index or a blob in history.
"
" Use :Gbrowse to open the current file on the web front-end of your favorite
" hosting provider, with optional line range (try it in visual mode!). Built-in
" support is provided for git instaweb, and plugins are available for popular
" providers such as GitHub, GitLab, and Bitbucket.
"
" Add %{FugitiveStatusline()} to 'statusline' to get an indicator with the
" current branch in (surprise!) your statusline.
"
" Last but not least, there's :Git for running any arbitrary command, and Git!
" to open the output of a command in a temp file.
"
" Source: https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sifnify
"
" Signify (or just Sy) uses the sign column to indicate added, modified and
" removed lines in a file that is managed by a version control system (VCS).
"
" Source: https://github.com/mhinz/vim-signify
Plugin 'mhinz/vim-signify'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ____ ___ ____ ___ _  _ ____   _    _ __ _ ____
"  ====  |  |--|  |  |__| ====   |___ | | \| |===
"
" VIM Airline: Lean & mean status/tabline for vim that's light as air.
"
" When the plugin is correctly loaded, Vim will draw a nice statusline at the
" bottom of each window.
"
" Source: https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = "luna"
let g:airline#extensions#tabline#enabled = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ___ _ _ ___  _ __ _ ____
"   |   Y  |--' | | \| |__,
"
" Easymotion
"
" EasyMotion provides a much simpler way to use some motions in vim. It takes
" the <number> out of <number>w or <number>f{char} by highlighting all
" possible choices and allowing you to press one key to jump directly to the
" target.
"
" When one of the available motions is triggered, all visible text preceding
" or following the cursor is faded, and motion targets are highlighted.
"
" EasyMotion is triggered by the provided mappings. This readme only covers
" the basics; please refer to :help easymotion.txt to see all the available
" mappings.
"
" Source: https://github.com/easymotion/vim-easymotion
Plugin 'easymotion/vim-easymotion'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sorround VIM
"
" Surround.vim is all about 'surroundings': parentheses, brackets, quotes, XML
" tags, and more. The plugin provides mappings to easily delete, change and add
" such surroundings in pairs.
"
" Source: https://github.com/tpope/vim-surround
Plugin 'tpope/vim-surround'

" Raimondi/delimitMate
"
" This plug-in provides automatic closing of quotes, parenthesis, brackets,
" etc., besides some other related features that should make your time in
" insert mode a little bit easier, like syntax awareness (will not insert the
" closing delimiter in comments and other configurable regions), and
" expansions (off by default), and some more.
"
" Source: https://github.com/Raimondi/delimitMate
Plugin 'Raimondi/delimitMate'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD Commenter
"
" Comment functions so powerful—no comment necessary.
"
" Mappings:
" [count]<leader>cc |NERDComComment| Comment out the current line or text
" selected in visual mode.
" [count]<leader>cn |NERDComNestedComment| Same as cc but forces nesting.
" [count]<leader>c<space> |NERDComToggleComment| Toggles the comment state of
" the selected line(s). If the topmost selected line is commented, all selected
" lines are uncommented and vice versa.
" [count]<leader>cm |NERDComMinimalComment| Comments the given lines using only
" one set of multipart delimiters.
" [count]<leader>ci |NERDComInvertComment| Toggles the comment state of the
" selected line(s) individually.
" [count]<leader>cs |NERDComSexyComment| Comments out the selected lines with a
" pretty block formatted layout.
" [count]<leader>cy |NERDComYankComment| Same as cc except that the commented
" line(s) are yanked first.
" <leader>c$ |NERDComEOLComment| Comments the current line from the cursor to
" the end of line.
" <leader>cA |NERDComAppendComment| Adds comment delimiters to the end of line
" and goes into insert mode between them.
" <leader>ca |NERDComAltDelim| Switches to the alternative set of delimiters.
" [count]<leader>cl [count]<leader>cb |NERDComAlignedComment| Same as
" |NERDComComment| except that the delimiters are aligned down the left side
" (<leader>cl) or both sides (<leader>cb).
" [count]<leader>cu |NERDComUncommentLine| Uncomments the selected line(s).
"
" Source: https://github.com/scrooloose/nerdcommenter
Plugin 'scrooloose/nerdcommenter'

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ____ ____ _  _ ___  _    ____ ___ _ ____ __ _
"  |___ [__] |\/| |--' |___ |===  |  | [__] | \|
"
" YouCompleteMe: a code-completion engine for Vim
"
" YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine
" for Vim. It has several completion engines: an identifier-based engine that
" works with every programming language, a semantic, Clang-based engine that
" provides native semantic code completion for C/C++/Objective-C/Objective-C++
" (from now on referred to as the C-family languages), a Jedi-based
" completion engine for Python and an omnifunc-based completer that uses data
" from Vim's omnicomplete system to provide semantic completions for many
" other languages (Ruby, PHP etc.).
"
" Source: https://github.com/queezythegreat/vim-YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" YouCompleteMe Configuration
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = '/usr/bin/python3'

" YouCompleteMe mappings
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ____ _ _ __ _ ___ ____ _ _  / ____ _ _ ____ ____ ____ __ _ ___  _ _
"  ====  Y  | \|  |  |--| _X_ /  |===  Y  |=== |___ |--| | \| |__>  Y
"
" Syntastic: Syntax checking hacks for vim
"
" Syntastic is a syntax checking plugin for Vim created by Martin Grenfell. It
" runs files through external syntax checkers and displays any resulting errors
" to the user. This can be done on demand, or automatically as files are saved.
" If syntax errors are detected, the user is notified and is happy because they
" didn't have to compile their code or execute their script to find them.
"
" Source: https://github.com/vim-syntastic/syntastic
Plugin 'scrooloose/syntastic'

" let g:syntastic_markdown_checkers = ['mdl']
" let g:syntastic_dockerfile_checkers = ['hadolint']
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_html_checkers = ['htmlhint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_sass_checkers = ['sass_lint', 'stylelint']
let g:syntastic_css_checkers = ['stylelint']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine
"
" This plugin is used for displaying thin vertical lines at each indentation
" level for code indented with spaces. For code indented with tabs I think
" there is no need to support it, because you can use :set list lcs=tab:\|\
" (here is a space).
"
" Source: https://github.com/Yggdroot/indentLine
Plugin 'Yggdroot/indentLine'

let g:indentLine_char = '┆'
let g:indentLine_enabled = 1
" let g:indentLine_setColors = 0
" let g:indentLine_bgcolor_term = 202

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Polyglot
"
" A collection of language packs for Vim.
"
" Source: https://github.com/sheerun/vim-polyglot
Plugin 'sheerun/vim-polyglot'

" Pangloss JavaScript Configuration
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Cute Python
"
" Unicode goodness for Python code by using vim's “conceal” feature
"
" Source: https://github.com/ehamberg/vim-cute-python
Plugin 'ehamberg/vim-cute-python'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _  _ ____ ___    ___  ____ _  _ ____ _    ____ ___  _  _ ____ __ _ ___
" |/\| |=== |==]   |__> |===  \/  |=== |___ [__] |--' |\/| |=== | \|  |
"
" Emmet VIM
"
" emmet-vim is a vim plug-in which provides support for expanding
" abbreviations similar to emmet.
"
" Tutorial: https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
" Source: https://github.com/mattn/emmet-vim
Plugin 'mattn/emmet-vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSS Color
"
" A very fast, multi-syntax context-sensitive color name highlighter
"
" Source: https://github.com/ap/vim-css-color
Plugin 'ap/vim-css-color'

let g:user_emmet_leader_key = '<C-E>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modern Javascript Syntax Highlight
"
" Sources:
"   - https://github.com/othree/yajs.vim
"   - https://github.com/othree/es.next.syntax.vim
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" javascript-libraries-syntax.vim
"
" Syntax file for JavaScript libraries. Supports JavaScript libraries I am
" using (patches welcome). Should work well with other JavaScript syntax
" files. SyntaxComplete also works well on all supported languages.
"
" Recommends to use local vimrc files
"
" Support libs id:
"   jQuery: jquery
"   underscore.js: underscore
"   Lo-Dash: underscore "   Backbone.js: backbone
"   prelude.ls: prelude
"   AngularJS: angularjs
"   AngularUI: angularui
"   AngularUI Router: angularuirouter
"   React: react
"   Flux: flux
"   RequireJS: requirejs
"   Sugar.js: sugar
"   Jasmine: jasmine
"   Chai: chai
"   Handlebars: handlebars
"   Ramda: ramda
"   Vue.js: vue
"   d3.js: d3
"   tape: tape
"
" Source: https://github.com/othree/javascript-libraries-syntax.vim
Plugin 'othree/javascript-libraries-syntax.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YATS: Yet Another TypeScript Syntax
"
" Yet Another TypeScript Syntax file for Vim, adapted from YAJS. Key differences:
"    - Exuberant Highlighting. The most elaborate or byzatine syntax
"    highlighting for TypeScript.
"    - Bundled with snippets for UltiSnips!
"    - Builtin Support for tagbar!
"    - Use 'typescript' as group name's prefix, not 'typeScript' nor
"    'TypeScript'. Works great with SyntaxComplete.
"    - Inherit Web API and DOM keywords from YAJS
"    - Syntax fold. Fold long code block, semantically!
"    - Remove old, unused syntax definitions.
"
" Source: https://github.com/HerringtonDarkholme/yats.vim
Plugin 'HerringtonDarkholme/yats.vim'

autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
autocmd BufReadPre *.js let b:javascript_lib_use_d3 = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1

"""""""""""""""""""""""
" Experimental area
" Consider using https://github.com/Shougo/denite.nvim
" Consider using https://github.com/vim-ctrlspace/vim-ctrlspace
" Consider using https://github.com/jreybert/vimagit
" Plugin 'jmcantrell/vim-virtualenv'
" Plugin 'embear/vim-localvimrc'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""
" Per Project Plugins
" Consider using https://github.com/mbbill/undotree " Need extra undo control?
" Plugin 'hail2u/vim-css3-syntax' " Are you going to use modern CSS3 features?
" Plugin 'junegunn/vim-easy-align' " Do you need to align on complex patterns?
" Plugin 'haya14busa/incsearch.vim' " Complex searching patterns?
