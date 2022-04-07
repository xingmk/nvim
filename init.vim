" __  ____   __  _   ___     _____ __  __ 
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| |  
"| |  | | | |   | |\  | \ V /  | || |  | |
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|

" ===
" === Auto load for first time uses
" ===
"""if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
"""	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
"""				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"""	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"""endif

""if empty(glob($HOME.'/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
""	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
""endif

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
"""let has_machine_specific_file = 1
"""if empty(glob('~/.config/nvim/_machine_specific.vim'))
"""	let has_machine_specific_file = 0
"""	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
"""endif
"""source $HOME/.config/nvim/default_configs/_machine_specific_default.vim

" === Restore Cursor Position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === System
" ===
" Scanf kinds of files
filetype on         
filetype indent on      
filetype plugin on     
filetype plugin indent on 
" For coding
syntax on
syntax enable
set encoding=utf-8       
set clipboard=unnamed
set foldmethod=indent              "fold the codes 
set foldlevel=99
" Set nobackup
set writebackup                    " the backup file is immediately deleted after a successful write
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
" Search
set hlsearch                       " high light
 exec "nohlsearch"  
set incsearch                      " one inseart,and one search with high light
set ignorecase		               " ignore capital case
set smartcase		               " smart capital case
set path+=**
set grepprg=grep\ -nH\ $*
" Let mouse have a change by inseart 
set mouse=a                        " using mouse
" set mouse-=a                       " forbid mouse
set cursorcolumn                   "  vertical mouse_line

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" Auto complete
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h


let mapleader =" "             " Set leader as space 
let &t_ut=''                   " Prevent incorrect backgroung rendering (to make fixed background)
set wrap	                   " Prevent auto line split
set autochdir                  " change the current working directory
set wildmenu                   " give more chances for commands
set nocompatible               " make the plugs smooth running
set cursorline                 " make a line
set number                     " set line number 
set relativenumber             " set relative number
set showcmd			           " watch the command
set laststatus=2                 " to set the status line
set showmatch	               " match () 
set ruler                
set clipboard+=unnamedplus

" ===
" === Basic Mappings
" ===
" Copy to system clipboard
vnoremap Y "+y 
" Adjacent duplicate words
map <LEADER>dw /\(\<\w\+\>\)\_s*\1
" Quit && Save
map Q :q<CR>
map W :w<CR>
map WQ :wq<CR>
" Back to screen center 
imap <C-a> <Esc>zza
nmap <C-a> zz
" replace
nnoremap <leader>re :s/
nnoremap <leader>rea :%s/
" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>
noremap <C-s> ea<C-x>s
inoremap <C-s> <Esc>ea<C-x>s
" Bookmarks 
noremap bm :SignatureToggle<CR>
noremap bmr :SignatureRefresh<CR>
" Cancle high light
noremap <leader><CR> :nohlsearch<CR>  
" Open the vimrc file anytime
noremap <LEADER>in :e $HOME/.config/nvim/init.vim<CR>


" Press ` to change case (instead of ~)
    "map ` ~
" Others
    "map <LEADER>u u<Esc>u
    
" Disabling the default s key
"noremap s <nop>
        " Example : let something empty
        " map x <nop>

" ===
" === Cursor Movement
" ===
" New cursor movement
"     ^
"     i
" < j  	l >                
"     k
"     v
noremap <silent> j h
noremap <silent> k j
noremap <silent> i k
noremap <silent> gu gk
noremap <silent> ge gj
" When in insert
inoremap <silent> <C-j> <left>
inoremap <silent> <C-l> <right>
inoremap <silent> <C-k> <down>
inoremap <silent> <C-p> <up>
inoremap jj <esc>
" Insert Key
noremap <silent> h i
noremap <silent> H I
" i/k keys for 5 times k/j (faster navigation)
 noremap <silent> <C-k> 5j
 noremap <silent> <C-n> 5j
 noremap <silent> <C-i> 5k
 noremap <silent> <C-p> 5k
" noremap <silent> K 5j
" noremap <silent> I 5k
" Ctrl + U or N will move up/down the view port without moving the cursor
" noremap <C-u> 5<C-y>
" noremap <C-n> 5<C-e>
" inoremap <C-u> <Esc>5<C-y>a
" inoremap <C-n> <Esc>5<C-e>a
noremap <C-e> 5<C-y>
noremap <C-f> 5<C-e>
"inoremap I <Esc>5<C-y>a
"inoremap K <Esc>5<C-e>a
 "inoremap <silent> <C-i> <Esc>5<C-y>a
 "inoremap <silent> <C-k> <Esc>5<C-e>a
 "inoremap <silent> <C-n> <Esc>5<C-e>a
 "inoremap <silent> <C-p> <Esc>5<C-y>a
 inoremap <silent> <C-e> <Esc>5<C-y>a
 inoremap <silent> <C-f> <Esc>5<C-e>a
" Change the world
"noremap <C-w> 5w
"noremap <C-b> 5b
"inoremap <C-w> <Esc>5wa
"inoremap <C-b> <Esc>5ba
map <silent> s b
noremap <silent> <C-w> 5w
noremap <silent> <C-s> 5b
inoremap <silent> <C-w> <Esc>5wa
inoremap <silent> <C-s> <Esc>5ba
" Search
noremap - N
noremap = n

source  $HOME/.config/nvim/cursor.vim

" ===
" === Window management

" Split the screens to up (horizontal), down (horizonta), left (vertical), right (vertical)
map sj :set splitright<CR>:vsplit<CR>                     
map sl :set nosplitright<CR>:vsplit<CR>:set splitright<CR> 
map sk :set splitbelow<CR>:split<CR>                       
map si :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>  
" Use <space> + new arrow keys for moving the cursor around windows
noremap ei  <C-w>k       
noremap ek  <C-w>j       
noremap ej  <C-w>h       
noremap el  <C-w>l       

noremap ew  <C-w>w
noremap er  <C-w>r
" Place the two screens up and down (splitscreen to H)
" Place the two screens side by side   (splitscreen to V)
noremap sg <C-w>t<C-w>K        
noremap sv <C-w>t<C-w>H     
" Rotate screens   (move splitscreen to H ,move splitscreen to V)
noremap smg <C-w>b<C-w>K        
noremap smv <C-w>b<C-w>H        
" Resize splits with arrow keys
map <up>    :res -5<CR>         
map <down>  :res +5<CR>         
map <left>  :vertical resize-5<CR>      
map <right> :vertical resize+5<CR>      

" === Tab management Buffers
" ===
" Create a new tab with tu
map tn :tabe<CR>       
" Close a tab with t
" Close all the tab with twa
map tw :tabc<CR>      
map taw :tabo<CR>    
" Move around tabs with tn and ti
map tj :-tabnext<CR>    
map tl :+tabnext<CR>  
" Move the tabs with tmj and tml
map tmj :-tabmove<CR>
map tml :+tabmove<CR> 

" ===
" === Command Mode Cursor Movement
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>

" ===
" === Markdown Settings
" ===
" Snippets
source $HOME/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell

" ===
" === Compile function
" ===
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		:sp
		:res -5
		term gcc -ansi -Wall % -o %< && time ./%<
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
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
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

" let g:plug_url_format='https//git::@hub.fastgit.org/%s.git'

" ===
" === Install Plugins with Vim-Plug
" ===
call plug#begin('~/.vim/plugged')

" === Dressed

" Pretty Dressed-vim
Plug 'vim-airline/vim-airline'          " state of nvim
Plug 'vim-airline/vim-airline-themes'   " themes of airline
Plug 'bling/vim-bufferline'             " state of bufferline

Plug 'ayu-theme/ayu-vim'
Plug 'theniceboy/nvim-deus'
Plug 'arzg/vim-colors-xcode'

" === Config

" Vim Applications
Plug 'itchyny/calendar.vim'

" Taglist
Plug 'liuchengxu/vista.vim'

" Debugger
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" Undo Tree
" Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'

" File navigation
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'kevinhwang91/rnvimr'
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'

" Auto delete
Plug 'jiangmiao/auto-pairs'
"Plug 'wellle/tmux-complete.vim'

" Explation
Plug 'preservim/nerdcommenter'

" Smart visual
"Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Auto Complete
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'davidhalter/jedi-vim'

"Bookmarks
 " Plug 'kshenoy/vim-signature'

" Git
Plug 'tpope/vim-fugitive'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" Snippets
" Plug 'SirVer/ultisnips'
Plug 'theniceboy/vim-snippets'

" Debugger 

Plug 'puremourning/vimspector'


" === Language

" Markdown
" 实时预览
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
" vim 中个人的 wiki
Plug 'vimwiki/vimwiki'

Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" Python
" Plug 'vim-scripts/indentpython.vim'
" Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
" Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
" Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }

" Swift
Plug 'keith/swift.vim'
Plug 'arzg/vim-swift'

" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
" Plug 'hail2u/vim-css3-syntax' " , { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
" Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'jaxbot/browserlink.vim'
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'posva/vim-vue'
" Plug 'evanleck/vim-svelte', {'branch': 'main'}
" Plug 'leafOfTree/vim-svelte-plugin'
" Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pantharshit00/vim-prisma'

"=== Other useful utilities

Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
" Plug 'makerj/vim-pdf'
"Plug 'xolox/vim-session'
"Plug 'xolox/vim-misc' " vim-session dep

" Dependencies
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'kana/vim-textobj-user'
" Plug 'roxma/nvim-yarp'

call plug#end()

" ===
" === Dress up my vim
" ===
" forbid tmux && nvim background 混乱
if &term =~ '256color'
    set t_ut=
endif

set termguicolors              " enable true colors support
"set background=light
"set background=dark

"color dracula
"color one
color deus
"color gruvbox
"let ayucolor="light"
"color ayu
"color xcodelighthc

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1

hi NonText ctermfg=gray guifg=grey10
" hi SpecialKey ctermfg=blue guifg=grey70


" ===================== Start of Plugin Settings =====================

" ===
" === vim-instant-markdown
" ===
nnoremap mp :InstantMarkdownPreview<CR>

filetype plugin on
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
let g:instant_markdown_open_to_the_world = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_mermaid = 1
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autoscroll = 0
let g:instant_markdown_port = 8888
let g:instant_markdown_python = 1
" let g:instant_markdown_browser = "firefox --new-window"
let g:instant_markdown_browser = "chromium"

" ===
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

" ===
" === vim-table-mode (markdown)
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

" ==
" == Vim-multiple-cursor (markdown)
" ==
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<c-k>'
let g:multi_cursor_select_all_word_key = '<a-k>'
let g:multi_cursor_start_key           = 'g<c-k>'
let g:multi_cursor_select_all_key      = 'g<a-k>'
let g:multi_cursor_next_key            = '<c-k>'
let g:multi_cursor_prev_key            = '<c-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

let g:vimwiki_list = [{
  \ 'automatic_nested_syntaxes':1,
  \ 'path_html': '~/wiki_html',
  \ 'path': '~/wiki',
  \ 'template_path': '~/.vim/vimwiki/template/',
  \ 'syntax': 'markdown',
  \ 'ext':'.md',
  \ 'template_default':'markdown',
  \ 'custom_wiki2html': '~/.vim/vimwiki/wiki2html.sh',
  \ 'template_ext':'.html'
\}]

au BufRead,BufNewFile *.md set filetype=vimwiki

let g:taskwiki_sort_orders={"C": "pri-"}
let g:taskwiki_syntax = 'markdown'
let g:taskwiki_markdown_syntax='markdown'
let g:taskwiki_markup_syntax='markdown'
 
source ~/.config/nvim/md-snippets.vim

"===
"=== Coc.nvim
"==
nnoremap tt :CocCommand explorer<CR>

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

au Filetype FILETYPE let b:AutoPairs = {"(": ")"}
au FileType php      let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})

" TextEdit might fail if hidden is not set.
" 设置缓冲区 为保存文件时可以打开其他的文件
set hidden	

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" nvim 响应跟快
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
" 补全时少打出一些没有用的东西
set shortmess+=c

" Recently vim can merge signcolumn and number column into one
" 行号报错合成一个数列
" set signcolumn=number

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" 可用tab 补全
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" 写入模式下 使用 control+o  调出补全
inoremap <silent><expr> <c-o> coc#refresh()

inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" 查找代码报错
nmap <silent> cp <Plug>(coc-diagnostic-prev)
nmap <silent> cn <Plug>(coc-diagnostic-next)

" Symbol renaming.
" 重命名变量
nmap <leader>rn <Plug>(coc-rename)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
	
" Use h to show documentation in preview window.
" 显示相关文档
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
      
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
 endfunction

" 相同函数进行高亮度
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for do codeAction of selected region
" 选中后可给予更多选项
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)
" nmap <leader>aw  <Plug>(coc-codeaction-selected)w

let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-diagnostic',
	\ 'coc-docker',
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
	\ 'coc-tailwindcss',
	\ 'coc-tasks',
	\ 'coc-translator',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-vimlsp',
	\ 'coc-yaml',
	\ 'coc-yank']

"===
"=== Ariline 
"===
set t_Co=256
"永远显示状态栏
set laststatus=2

"支持 powerline 字体
let g:airline_powerline_fonts = 1  
let g:airline#extensions#tabline#enabled = 1 

"murmur配色不错
"let g:airline_theme='moloai' 
"if !exists('g:airline_symbols')
"let g:airline_symbols = {}
"endif
"let g:airline_left_sep = '▶'
"let g:airline_left_alt_sep = '❯'
"let g:airline_right_sep = '◀'
"let g:airline_right_alt_sep = '❮'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'


"===
"===NerdCommenter   (Explation) 
"===
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
" === Leaderf
" ===
" let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_CommandMap = {
\   '<C-k>': ['<C-i>'],
\   '<C-j>': ['<C-k>'],
\   '<C-]>': ['<C-v>'],
\   '<C-p>': ['<C-n>'],
\}
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', 'vendor', 'node_modules'],
        \ 'file': ['__vim_project_root', 'class']
        \}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0

" ===
" === Undotree
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc

"===
"=== NERDTree
"===
"nnoremap  nt  :NERDTree <CR> 
"nnoremap  nto :NERDTreeToggle<CR>
"nnoremap  nfi :NERDTreeFind <CR>
"nnoremap  nfo :NERDTreeFocus <CR> 
"
"let NERDTreeMapOpenExpl = ""
"let NERDTreeMapUpdir = "i"
"let NERDTreeMapUpdirKeepOpen = "l"
"let NERDTreeMapOpenSplit = ""
"let NERDTreeOpenVSplit = ""
"let NERDTreeMapActivateNode = "a"
"let NERDTreeMapOpenInTab = "o"
"let NERDTreeMapPreview = ""
"let NERDTreeMapCloseDir = "n"
"let NERDTreeMapChangeRoot = "y"

" ===
" === vim-bookmarks
" ===
" let g:bookmark_no_default_key_mappings = 1
" nmap mt <Plug>BookmarkToggle
" nmap ma <Plug>BookmarkAnnotate
" nmap ml <Plug>BookmarkShowAll
" nmap mi <Plug>BookmarkNext
" nmap mn <Plug>BookmarkPrev
" nmap mC <Plug>BookmarkClear
" nmap mX <Plug>BookmarkClearAll
" nmap mu <Plug>BookmarkMoveUp
" nmap me <Plug>BookmarkMoveDown
" nmap <Leader>g <Plug>BookmarkMoveToLine
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_auto_save = 1
" let g:bookmark_highlight_lines = 1
" let g:bookmark_manage_per_buffer = 1
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_center = 1
" let g:bookmark_auto_close = 1
" let g:bookmark_location_list = 1

" ===
" === vim-visual-multi
" ===
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
"let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
"let g:VM_maps                       = {}
"let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
"let g:VM_maps['i']                  = 'k'
"let g:VM_maps['I']                  = 'K'
"let g:VM_maps['Find Under']         = '<C-k>'
"let g:VM_maps['Find Subword Under'] = '<C-k>'
"let g:VM_maps['Find Next']          = ''
"let g:VM_maps['Find Prev']          = ''
"let g:VM_maps['Remove Region']      = 'q'
"let g:VM_maps['Skip Region']        = '<c-n>'
"let g:VM_maps["Undo"]               = 'l'
"let g:VM_maps["Redo"]               = '<C-r>'

" ===
" === Bullets.vim
" ===
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]

" ===
" === vim-calendar
" ===
" noremap \c :Calendar -position=here<CR>
" nnoremap cd :Calendar<CR>
noremap \\ :Calendar -view=clock -position=here<CR>
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
augroup calendar-mappings
	autocmd!
	" diamond cursor
	autocmd FileType calendar nmap <buffer> i <Plug>(calendar_up)
	autocmd FileType calendar nmap <buffer> l <Plug>(calendar_left)
	autocmd FileType calendar nmap <buffer> d <Plug>(calendar_down)
	autocmd FileType calendar nmap <buffer> j <Plug>(calendar_right)
	autocmd FileType calendar nmap <buffer> <c-i> <Plug>(calendar_move_up)
	autocmd FileType calendar nmap <buffer> <c-l> <Plug>(calendar_move_left)
	autocmd FileType calendar nmap <buffer> <c-k> <Plug>(calendar_move_down)
	autocmd FileType calendar nmap <buffer> <c-j> <Plug>(calendar_move_right)
	autocmd FileType calendar nmap <buffer> h <Plug>(calendar_start_insert)
	autocmd FileType calendar nmap <buffer> H <Plug>(calendar_start_insert_head)
	" unmap <C-n>, <C-p> for other plugins
	autocmd FileType calendar nunmap <buffer> <C-n>
	autocmd FileType calendar nunmap <buffer> <C-p>
augroup END


" ===
" === vim-go
" ===
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0

" ===
" === lazygit.nvim
" ===
noremap <c-g> :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support


" ===================== End of Plugin Settings =====================

" ===
" === Terminal Colors
" ===

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


" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"


" Open the _machine_specific.vim file if it has just been created
"if has_machine_specific_file == 0
"	exec "e ~/.config/nvim/_machine_specific.vim"
"endif


