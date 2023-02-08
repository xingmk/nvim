"                         _
"   _ ___  ___  _____   _(_)_ __ ____
"  | '_  \/ _ \/ _ \ \ / / | '_ ` _  \
"  | | | |  __/ (_) \ V /| | | | | | |
"  |_| |_|\___|\___/ \_/ |_|_| |_| |_|

" ===
" ===== Vim-Pluggins
" ===
call plug#begin('~/.config/nvim/pluggin')

" === Display
Plug 'ryanoasis/vim-devicons'                           " System devicons
Plug 'mg979/vim-xtabline'                               " Show tabs on tabline
Plug 'bling/vim-bufferline'                             " Show buffers on command bar.
" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Themes
Plug 'theniceboy/nvim-deus'
Plug 'ghifarit53/tokyonight-vim'
Plug 'sainnhe/vim-color-forest-night'
Plug 'sainnhe/sonokai'

" === Effective
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " AutoComplete
Plug 'theniceboy/vim-snippets'                          " Snippets
Plug 'preservim/nerdcommenter'                          " Explation
Plug 'vim-autoformat/vim-autoformat'                    " Auto foramte
Plug 'lambdalisue/suda.vim'                             " Sudo
Plug 'iamcco/dict.vim', { 'on': ['DictW', '<Plug>DictWSearch', '<Plug>DictWVSearch', '<Plug>DictRSearch', '<Plug>DictRVSearch']}                                 " Translate
" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Git
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'

" === Language
" Markdown
Plug 'godlygeek/tabular'
Plug 'dkarter/bullets.vim'              " liver flash
Plug 'preservim/vim-markdown'           " markdown syntax
Plug 'mzlogin/vim-markdown-toc'         " markdown toc
Plug 'dhruvasagar/vim-table-mode'       " markdown table mode
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }     " markdown preview

call plug#end()

" ===
" ===== Editor behavior
" ===
" === Set LEADER to Space
let mapleader =" "
" === Scanf kinds of files
" Avoid incompatibilities
set nocompatible
" Test file types, and load the file type plug-in, for a particular file type load related indentation
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
" === For coding
syntax on                           " Enable vim syntax colors option
syntax enable                       " Turn on syntax highlighting
set wrap                            " Prevent auto line split (自动换行)
set noeb                            " Remove the prompt sound when the input is wrong
" set autochdir                       " Auto change the current working directory
set showcmd                         " Shows command that has not been entered (lower right corner)
set wildmenu                        " Supply more chances for commands
set laststatus=2                    " Always show status line
set encoding=utf-8                  " Support Chinese character
" === Better Fold
set foldlevel=99                    " Default to unfolded when open a file
set foldmethod=indent               " Automatic fold based on the indentation
" === Better clipboard
" Share the clipboard with system
set clipboard=unnamed
set clipboard=unnamedplus
" === Better nobackup
set hidden                          " Hide buffers instead of closing them
set autowrite                       " save the changes done in the files automatically while closing the files
set writebackup                     " The backup file is immediately deleted after a successful write
" === Better Search
set number                          " Line number
set relativenumber                  " Relative number
set hlsearch                        " Highlight all searched content
exec "nohlsearch"
set incsearch                       " The cursor immediately jumps to the searched content
set ignorecase                      " Ignore capital case
set smartcase                       " Smart capital case
" === Better Backspace
set backspace=indent,eol,start      " The first backspace returns to the previous line
" === Better Tab
" set listchars=tab:▸ ,trail:▫        " Rendering Tab and Space
" Converting tabs to spaces
let &t_ut=''
set smarttab
set expandtab
" When auto-indenting, the indentation length is 4
set tabstop=4
set shiftwidth=4
set softtabstop=4
" === Better Course
set tw=0                            " Avoid automatic line break
set mouse+=a                        " Enable mouse support
set cursorline                      " Horizontal cursor
set cursorcolumn                    " Vertical cursor
set scrolloff=5                     " Keep 5-lines in screen
" === Make the Cursor like windows by inserting
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" Restore Cursor Position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Course behavior
" ===
noremap <silent> j h
noremap <silent> k j
noremap <silent> i k
noremap <silent> h i
noremap <silent> H I
" Quit && Save
noremap Q :q!<CR>
noremap W :w!<CR>
noremap <LEADER>q :q<CR>
noremap <LEADER>w :w<CR>
noremap <LEADER>wq :wq<CR>
" Inserting behavior
inoremap <silent> <C-c> <esc>
inoremap <silent> <C-j> <left>
inoremap <silent> <C-l> <right>
" Ctrl + e or f will move up/down the view port without moving the cursor
noremap <C-e> 5<C-y>
noremap <C-f> 5<C-e>
inoremap <silent> <C-e> <Esc>5<C-y>a
inoremap <silent> <C-f> <Esc>5<C-e>a
" Change the world
noremap <silent> <M-w> 3w
noremap <silent> <M-a> 3b
noremap <silent> <M-e> 3e
" i/k keys for 5 times k/j (faster navigation)
noremap <silent> K 5j
noremap <silent> I 5k
" J/L key: go to the start/end of the line
noremap <silent> J 0
noremap <silent> L $
" Command Mode Cursor Movement
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" ===
" ===== Window management
" ===
" Split the screens to up (horizontal), down (horizonta), left (vertical), right (vertical)
map sj :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map sk :set splitbelow<CR>:split<CR>
map si :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
" Use z + j/k/l/i for moving the cursor around windows
noremap <C-i> <C-w>k
noremap <C-k> <C-w>j
noremap <C-j> <C-w>h
noremap <C-l> <C-w>l
" Place the two screens up and down (splitscreen to H)
" Place the two screens side by side   (splitscreen to V)
noremap sh <C-w>t<C-w>H
noremap sv <C-w>t<C-w>K
" Rotate screens (move splitscreen to H ,move splitscreen to V)
noremap <LEADER>sh <C-w>b<C-w>H
noremap <LEADER>sv <C-w>b<C-w>K
" Resize splits with arrow keys
map <up>    :res -5<CR>
map <down>  :res +5<CR>
map <left>  :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
" === Tab management
" Create a new tab
map <C-t> :tabe<CR>
" Close the tab
map <C-w> :tabc<CR>
" Move around tabs
map <C-u> :-tabnext<CR>
map <C-n> :+tabnext<CR>
" Move the tabs
map <LEADER>tj :-tabmove<CR>
map <LEADER>tl :+tabmove<CR>

" ===
" ===== Other useful stuff
" ===
" Copy to system clipboard
vnoremap Y "+y
vnoremap P "+p
vnoremap D "+d
" Change themes
noremap <leader>m :Colors<CR>
" Rolaod file
noremap <leader>so :source %<CR>
" Cancle high light
noremap <leader><CR> :nohlsearch<CR>
" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>
" find and replace
noremap \s :%s//g<left><left>
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>
" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +5<CR>:term<CR>
" Auto chnge directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" === Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        set splitbelow
        :sp
        :res -5
        term gcc % -o %< -lm && time ./%<
    elseif &filetype == 'cpp'
        set splitbelow
        exec "!g++ -std=c++11 % -Wall -o %<"
        :sp
        :res -5
        :term ./%<
    elseif &filetype == 'cs'
        set splitbelow
        silent! exec "!mcs %"
        :sp
        :res -5
        :term mono %<.exe
    elseif &filetype == 'java'
        set splitbelow
        :sp
        :res -5
        term javac % && time java %<
    elseif &filetype == 'javascript'
        set splitbelow
        :sp
        :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'python'
        set splitbelow
        :sp
        :term python3 %
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'html'
        silent! exec "!".g:mkdp_browser." % &"
    elseif &filetype == 'tex'
        silent! exec "VimtexStop"
        silent! exec "VimtexCompile"
    elseif &filetype == 'dart'
        exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
        silent! exec "CocCommand flutter.dev.openDevLog"
    elseif &filetype == 'racket'
        set splitbelow
        :sp
        :res -5
        term racket %
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run .
    endif
endfunc

" :------------------------- Pluggins -------------------------:
" ===
" ===== Effective
" ===
" ===== coc.nvim
" ===
noremap <LEADER>e :CocCommand explorer<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" find wrong code
nmap <silent> - <Plug>(coc-diagnostic-prev)
nmap <silent> = <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Start use document_help
function! Show_documentation()
    call CocActionAsync('highlight')
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
nnoremap <silent> <LEADER>p :call <SID>show_documentation()<CR>

" Enable TAB support
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1):
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

" Enable Enter support
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')

" coc.nvim
set updatetime=100
set shortmess+=c
" CheckHealth needed
let g:loaded_ruby_provider = 0
let g:loaed_perl_provider = 0
" coc-extensions
let g:coc_global_extensions = [
            \ 'coc-css',
            \ 'coc-diagnostic',
            \ 'coc-eslint',
            \ 'coc-explorer',
            \ 'coc-flutter-tools',
            \ 'coc-gitignore',
            \ 'coc-html',
            \ 'coc-import-cost',
            \ 'coc-java',
            \ 'coc-jest',
            \ 'coc-json',
            \ 'coc-lists',
            \ 'coc-omnisharp',
            \ 'coc-prettier',
            \ 'coc-prisma',
            \ 'coc-pyright',
            \ 'coc-snippets',
            \ 'coc-sourcekit',
            \ 'coc-stylelint',
            \ 'coc-syntax',
            \ 'coc-tasks',
            \ 'coc-translator',
            \ 'coc-tsserver',
            \ 'coc-vetur',
            \ 'coc-vimlsp',
            \ 'coc-yaml',
            \ 'coc-yank']

" ===
" === fzf
" ===
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fu :Buffers<CR>
nnoremap <silent> <leader>fh :History<CR>

let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = 'right:40%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
    redir => list
    silent ls
    redir END
    return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
    execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

" ===
" === GitGutter
" ===
" let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap <LEADER>gh :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>

" ===
" === Formate
" ===
noremap <LEADER>fo :Autoformat<CR>

" ===
" === suda.vim
" ===
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%

" ===
" === dict
" ===
" Enter the words need to be translated
noremap <M-d> :DictW
" Translate word under the cursor and the dict window display
nmap <silent> <LEADER>t <Plug>DictWSearch
vmap <silent> <LEADER>t <Plug>DictWVSearch
" Translate word under the cursor and replace the result
nmap <silent> <LEADER>r <Plug>DictRSearch
vmap <silent> <LEADER>r <Plug>DictRVSearch

" ===
" === nerdcommenter (comment)
" ===
" Commented in a visual mode selection on or text.
" <leader>cc
" Uncomment the selected rows.
" <leader>cu
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" ===
" ===== NerdCommenter (Explation)
" ===
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' }}
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1


" ===
" ===== Language
" ===
" === Bullets.vim(live fresh)
" ===
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
            \ 'markdown',
            \ 'text',
            \ 'gitcommit',
            \ 'scratch',
            \ 'html'
            \]
" ===
" === Markdown.Vim
" ===
" Prohibit folding
let g:vim_markdown_folding_disabled = 1
" Set folding level
let g:vim_markdown_folding_level = 6
" Open Syntax concealing
set conceallevel=2
" Prohibit code block
let g:vim_markdown_conceal_code_blocks = 0
" Math
let g:vim_markdown_math = 1
let g:vim_markdown_strikethrough = 1
" Fenced code block languages
let g:vim_markdown_fenced_languages = ['csharp=cs', 'nvim=vim', 'bash=sh', 'c++=cpp']
" Adjust new list item indent
let g:vim_markdown_new_list_item_indent = 4

" ===
" === Markdown-preview.vim
" ===
" Start automatically (the default is 0 to 1 to open automatically start)
let g:mkdp_auto_start = 0
" Refresh automatically (the default is 0 to 1 to open automatically refresh)
let g:mkdp_refresh_slow = 1
" Preview browser
let g:mkdp_browser = 'google-chrome-stable'

" ===
" === vim-markdown-toc
" ===
noremap <silent> <LEADER>tg :GenTocGFM<CR>
noremap <silent> <LEADER>tk :GenTocMarked<CR>

let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

" ===
" === vim-table-mode
" ===
"Start the form template
noremap <silent> <leader>tm :TableModeToggle<CR>
noremap <silent> <leader>tr :TableModeRealign<CR>

function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
            \ <SID>isAtStartOfLine('\|\|') ?
            \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
            \ <SID>isAtStartOfLine('__') ?
            \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" ===
" === Markdown-default.config
" ===
" Snippets
source $HOME/.config/nvim/plugged/md-snippets.vim
" Confilct
source $HOME/.config/nvim/plugged/conflict.vim

" ===
" ===== Display
" ===
" === Airline
" ===
set t_Co=256
" Support powerline fonts
let g:airline_powerline_fonts = 1
let g:magit_git_cmd="git"
" Default Add
let g:airline#extensions#tabline#enabled = 1
" Display Path
let g:airline#extensions#tabline#formatter = 'jsformatter'
" 分隔符可以为标签线单独配置，所以这里是你如定义“直”标签
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 0
let g:xtabline_settings.buffer_format = 2
let g:xtabline_settings.indicators = {
            \ 'modified': '[+]',
            \ 'pinned': '[📌]',
            \}
let g:xtabline_settings.icons = {
            \'pin': '📌',
            \'star': '★',
            \'book': '📖',
            \'lock': '🔒',
            \'hammer': '🔨',
            \'tick': '✔',
            \'cross': '✖',
            \'warning': '⚠',
            \'menu': '☰',
            \'apple': '🍎',
            \'linux': '🐧',
            \'windows': '⌘',
            \'git': '',
            \'palette': '🎨',
            \'lens': '🔍',
            \'flag': '🏁',
            \}
" ===
" === Themes
" ===
set termguicolors

" === everforest
" " For dark version.
" set background=dark
" " For better performance
" let g:everforest_better_performance = 1
" " 设置 1为斜体 0为注释斜体
" let g:everforest_enable_italic = 0
" let g:everforest_disable_italic_comment = 0
"
" " Available values: 'hard', 'medium'(default), 'soft'
" let g:everforest_background = 'medium'
"
" colorscheme everforest
" let g:airline_theme='everforest'

" === sonokai
" 设置 1为斜体 0为注释斜体
let g:sonokai_enable_italic = 0
let g:sonokai_disable_italic_comment =0

" Available values: default, atlantis, andromeda, shusia, maia, espresso
let g:sonokai_style = 'atlantis'

colorscheme sonokai
let g:airline_theme='sonokai'

" === deus
" let g:deus_termcolors=256
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"
" hi NonText ctermfg=gray guifg=grey10
"
" colorscheme deus
"
"  To enable airline support
" let g:airline_theme='deus'

" === tokyonight
" let g:tokyonight_style = 'night'        " available: night, storm
" let g:tokyonight_enable_italic = 1
" " 设置 1背景透明
" let g:tokyonight_transparent_background = 0     " available: 0, 1
" " 控制背景颜色
" let g:tokyonight_menu_selection_background = 'green'    " available: green, red, blue
" " 设置 1禁用斜体 comment
" let g:tokyonight_disable_italic_comment = 0

" colorscheme tokyonight

" " To enable airline support
" let g:airline_theme = "tokyonight"
