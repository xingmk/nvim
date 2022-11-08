"               _
"    _ ____   _(_)_ __ ____
"   | '_ \ \ / / | '_ ` _  \
"   | | | \ V /| | | | | | |
"   |_| |_|\_/ |_|_| |_| |_|
" ==============================
"  Auto load for first time uses
" ==============================
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ==============================
"       Editor behavior
" ==============================
let &t_ut=''
let mapleader =" "
" Scanf kinds of files
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
" For coding
syntax on
syntax enable
set encoding=utf-8
set clipboard+=unnamed
set foldmethod=indent
set foldlevel=99
" Set nobackup
set writebackup                    " The backup file is immediately deleted after a successful write
set hidden                         " Save in buffers
set autowrite
" Better backspace
set backspace=indent,eol,start
" Better tab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=5
set smarttab
set tw=0
set indentexpr=
" Coc.nvim
set updatetime=100
set shortmess+=c
" Search
set hlsearch
exec "nohlsearch"
set incsearch                      " one inseart,and one search with high light
set ignorecase                     " ignore capital case
set smartcase                      " smart capital case
set cursorcolumn                   " vertical mouse_line
set wrap                           " Prevent auto line split
set autochdir                      " change the current working directory
set wildmenu                       " give more chances for commands
set nocompatible                   " make the plugs smooth running
set cursorline                     " make a line
set number                         " set line number
set relativenumber                 " set relative number
set showcmd                        " watch the command
set laststatus=2                   " to set the status line
set clipboard=unnamedplus          " share the yank with system

" ==============================
"       Course behavior
" ==============================
"     ^
"     i
" < j   l >
"     k
"     v
noremap <silent> j h
noremap <silent> k j
noremap <silent> i k
noremap <silent> h i
noremap <silent> H I
" Quit && Save
nnoremap Q :q!<CR>
nnoremap W :w!<CR>
nnoremap <LEADER>q :q<CR>
nnoremap <LEADER>w :w<CR>
nnoremap <LEADER>wq :wq<CR>
" When in inserting
inoremap <silent> <C-j> <left>
inoremap <silent> <C-l> <right>
" inoremap <silent> <c-c> <esc>
" Ctrl + e or f will move up/down the view port without moving the cursor
noremap <C-e> 5<C-y>
noremap <C-f> 5<C-e>
inoremap <silent> <C-e> <Esc>5<C-y>a
inoremap <silent> <C-f> <Esc>5<C-e>a
" Change the world
noremap <silent> a b
noremap <silent> <M-w> 3w
noremap <silent> <M-a> 3b
noremap <silent> <M-e> 3e
" i/k keys for 5 times k/j (faster navigation)
noremap <silent> K 5j
noremap <silent> I 5k
" J/L key: go to the start/end of the line
noremap <silent> J 0
noremap <silent> L $

" ==============================
"  Command Mode Cursor Movement
" ==============================
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" ==============================
"       Window management
" ==============================
" Split the screens to up (horizontal), down (horizonta), left (vertical), right (vertical)
map sj :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map sk :set splitbelow<CR>:split<CR>
map si :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
" Place the two screens up and down (splitscreen to H)
" Place the two screens side by side   (splitscreen to V)
noremap sh <C-w>t<C-w>H
noremap sv <C-w>t<C-w>K
" Use <space> + new arrow keys for moving the cursor around windows
noremap zi <C-w>k
noremap zk <C-w>j
noremap zj <C-w>h
noremap zl <C-w>l
" Rotate screens   (move splitscreen to H ,move splitscreen to V)
noremap <LEADER>sh <C-w>b<C-w>H
noremap <LEADER>sv <C-w>b<C-w>K
" Resize splits with arrow keys
map <up>    :res -5<CR>
map <down>  :res +5<CR>
map <left>  :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" ==============================
"    Tab management Buffers
" ==============================
" Create a new tab with <C-n>
map <C-t> :tabe<CR>
" Close a tab with t
" Close all the tab with <C-w>
map <C-w> :tabc<CR>
" map <C-w>a :tabo<CR>
" Move around tabs with <M-j> and <M-l>
map <C-s> :-tabnext<CR>
map <C-d> :+tabnext<CR>
" Move the tabs with <C-m>j and <C-m>l
map <LEADER>tj :-tabmove<CR>
map <LEADER>tl :+tabmove<CR>

" ==============================
"      Other useful stuff
" ==============================
" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
" Reload init.vim
nnoremap <LEADER>so :source ~/.config/nvim/init.vim<CR>
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>
" Opening a terminal window
noremap <LEADER>\ :set splitbelow<CR>:split<CR>:res +5<CR>:term<CR>
" find and replace
noremap \s :%s//g<left><left>
" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>
" Cancle high light
noremap <leader><CR> :nohlsearch<CR>
" set wrap
noremap <LEADER>sw :set wrap<CR>
" Copy to system clipboard
vnoremap Y "+y
" Coc.nvim
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
" Restore Cursor Position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Make the Cursor like windows by inserting
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" Make backup
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=$HOME/.config/nvim/tmp/undo,.
endif

" ==============================
"       Compile function
" ==============================
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

" ==============================
"         Vim-Plugins
" ==============================
call plug#begin('~/.config/nvim/plugged')

" --- Dress neovim
" Pretty Dressed-vim
Plug 'jreybert/vimagit'
Plug 'mg979/vim-xtabline'
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Some themes
Plug 'theniceboy/nvim-deus'

" --- Important Plugins
" Complete, Bullets(live fresh), Explation, Foramte
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dkarter/bullets.vim'
Plug 'preservim/nerdcommenter'
Plug 'vim-autoformat/vim-autoformat'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Snippets
Plug 'theniceboy/vim-snippets'

" Fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" --- Language
" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Plug 'mzlogin/vim-markdown-toc'
" Plug 'dhruvasagar/vim-table-mode'

" --- vim_application
" Rnvimr
Plug 'kevinhwang91/rnvimr'

" sudo
Plug 'lambdalisue/suda.vim' 

" Translate
Plug 'iamcco/dict.vim', { 'on': ['DictW', '<Plug>DictWSearch', '<Plug>DictWVSearch', '<Plug>DictRSearch', '<Plug>DictRVSearch']}


call plug#end()

" ==============================
"          Dress neovim
" ==============================
"             Deus
" ==============================
set termguicolors              
silent! color deus

let g:airline_theme='deus'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

hi NonText ctermfg=gray guifg=grey10

" ==============================
"           xtabline
" ==============================
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1

" ==============================
"            Airline
" ==============================
set t_Co=256
set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
" Support powerline fonts
let g:airline_powerline_fonts = 1
let g:magit_git_cmd="git"


" ==============================
"      Important plugins
" ==============================
"      Auto-format.vim
" ==============================
noremap <LEADER>f :Autoformat<CR>

" ==============================
"         GitGutter
" ==============================
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

" ==============================
"             fzf
" ==============================
nnoremap <silent> zf :Files<CR>
nnoremap <silent> zb :Buffers<CR>
nnoremap <silent> zh :History<CR>

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

" ==============================
"    Coc.nvim (auto-complete)
" ==============================
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

noremap <LEADER>e :CocCommand explorer<CR>

" Start use TAB
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1):
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

" Start Enter
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Start use document_help
function! Show_documentation()
    call CocActionAsync('highlight')
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" find wrong code
nmap <silent> - <Plug>(coc-diagnostic-prev)
nmap <silent> = <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" ==============================
"   NerdCommenter (Explation)
" ==============================
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

" ==============================
"    Bullets.vim(live fresh)
" ==============================
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
            \ 'markdown',
            \ 'text',
            \ 'gitcommit',
            \ 'scratch'
            \]

" ==============================
"           Nvim-apps
" ==============================
"          suda.vim
" ==============================
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%

" ==============================
"            rnvimr
" ==============================
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>

let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
highlight link RnvimrNormal CursorLine
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-g>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]
" --- colors
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

" ==============================
"            dict
" ==============================
" Translate the word under the cursor and the dict window display
nmap <silent> <LEADER>t <Plug>DictWSearch
vmap <silent> <LEADER>t <Plug>DictWVSearch
" Translation word under the cursor and replace the result
nmap <silent> <LEADER>r <Plug>DictRSearch
vmap <silent> <LEADER>r <Plug>DictRVSearch
" Enter the words need to be translated
noremap <M-d> :DictW

" ==============================
"           Language
" ==============================
"         Markdown.Vim
" ==============================
" Prohibit folding
" let g:vim_markdown_folding_style_pythonic = 1
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

" ==============================
"      Markdown-preview.vim
" ==============================
" Start automatically (the default is 0 to 1 to open automatically start)
let g:mkdp_auto_start = 0
" Refresh automatically (the default is 0 to 1 to open automatically refresh)
let g:mkdp_refresh_slow = 1
" Preview browser
let g:mkdp_browser = 'google-chrome-stable'

" ==============================
"       vim-markdown-toc
" ==============================
noremap <silent> <LEADER>tg :GenTocGFM<CR>
noremap <silent> <LEADER>tk :GenTocMarked<CR>

let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

" ==============================
"        vim-table-mode
" ==============================
"Start the form template
noremap <silent> <M-m> :TableModeToggle<CR>
" Form template for again
noremap <silent> <M-r> :TableModeRealign<CR>

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

" ==============================
"    Markdown-default.config
" ==============================
" --- Snippets
autocmd FileType md source $HOME/.config/nvim/plugin/md-snippets.vim
" --- Confilct
source $HOME/.config/nvim/plugin/conflict.vim
