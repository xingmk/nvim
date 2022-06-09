"   _   ___     _____ __  __ 
"  | \ | \ \   / /_ _|  \/  |  
"  |  \| |\ \ / / | || |\/| |  
"  | |\  | \ V /  | || |  | |
"  |_| \_|  \_/  |___|_|  |_|

" ===
" === Auto load for first time uses
" ===
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:nvim_plugins_installation_competed=1

""" if empty(glob($HOME.'/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
"""	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"""endif

" Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source $HOME/.config/nvim/default_configs/_machine_specific_default.vim


" ===
" === Editor behavior
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
set clipboard+=unnamed              
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
set cursorcolumn                   " vertical mouse_line
set wrap	                       " Prevent auto line split
set autochdir                      " change the current working directory
set wildmenu                       " give more chances for commands
set nocompatible                   " make the plugs smooth running
set cursorline                     " make a line
set number                         " set line number 
set relativenumber                 " set relative number
set showcmd			               " watch the command
set laststatus=2                   " to set the status line
set showmatch	                   " match () 
set clipboard=unnamedplus          " share the yank with system 

" Make the Cursor like windows by inserting
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" Restore Cursor Position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


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
noremap <silent> h i
noremap <silent> H I
" Quit && Save
nnoremap <LEADER>q :q<CR>
nnoremap <LEADER>w :w<CR>
nnoremap <LEADER>wq :wq<CR>
nnoremap Q :q!<CR>
nnoremap W :w!<CR>
nnoremap WQ :wq!<CR>
" When in inserting
inoremap <silent> <C-j> <left>
inoremap <silent> <C-l> <right>
inoremap <silent> <C-k> <down>
inoremap <silent> <C-p> <up>
inoremap <silent> <c-c> <esc>
" Command Mode Cursor Movement
cnoremap <silent> <C-a> <Home>
cnoremap <silent> <C-e> <End>
cnoremap <silent> <C-p> <Up>
cnoremap <silent> <C-n> <Down>
cnoremap <silent> <C-b> <Left>
" Ctrl + e or f will move up/down the view port without moving the cursor
noremap <C-e> 5<C-y>
noremap <C-f> 5<C-e>
inoremap <silent> <C-e> <Esc>5<C-y>a
inoremap <silent> <C-f> <Esc>5<C-e>a
" i/k keys for 5 times k/j (faster navigation)
noremap <silent> K 5j
noremap <silent> I 5k
" J/L key: go to the start/end of the line
noremap <silent> J 0
noremap <silent> L $
" Change the world
noremap <silent> W 3w
noremap <silent> B 3b
" Cancle the map of e
noremap e <nop>
noremap E e 
" Search
noremap - N
noremap = n
cnoremap <C-f> <Right>




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
" ===  Other useful stuff
" ===
" Set leader as space
let mapleader =" "              
" Prevent incorrect backgroung rendering (to make fixed background)
let &t_ut=''                   
" Open / Reload init.vim
nnoremap <LEADER>r :source ~/.config/nvim/init.vim<CR>
nnoremap <LEADER>in :e $HOME/.config/nvim/init.vim<CR>
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>
" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +5<CR>:term<CR>
" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>
" find and replace
noremap \s :%s//g<left><left>
" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
" set wrap
noremap <LEADER>sw :set wrap<CR>

" Copy to system clipboard
vnoremap Y "+y 
noremap yay "ayy
noremap yap "ap 
noremap yAy "yAy       
" Adjacent duplicate words
map <LEADER>dw /\(\<\w\+\>\)\_s*\1
" Back to screen center 
imap <C-a> <Esc>zza
nmap <C-a> zz
" Cancle high light
noremap <leader><CR> :nohlsearch<CR>  
" Auto complete
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

" Markdown Settings
" Snippets
source $HOME/.config/nvim/md-snippets.vim
" Auto spell
autocmd BufRead,BufNewFile *.md setlocal spell

" press f10 to show hlgroup
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map <F10> :call SynGroup()<CR>

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		:sp
		:res -5
		term gcc % -o %< && time ./%<
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

source $HOME/.config/nvim/conflict.vim


" ===
" === Install Plugins with Vim-Plug
" ===
" call plug#begin('~/.vim/plugged')
call plug#begin('~/.config/nvim/plugged')

" === Dressed
" Pretty Dressed-vim
Plug 'theniceboy/eleline.vim',{ 'branch': 'no-scrollbar' }
"Plug 'vim-airline/vim-airline'                                " state of nvim
Plug 'vim-airline/vim-airline-themes'                         " themes of airline
Plug 'bling/vim-bufferline'                                   " state of bufferline
Plug 'mg979/vim-xtabline'                                     " themes of bufferline

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }            " tokyonight themes 
Plug 'theniceboy/nvim-deus'                                   " deus themes


" === Default system
" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Debugger
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" Smart Delete, Explation, Visual
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" File fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" Git
" Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'theniceboy/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'kdheepak/lazygit.nvim'
"Plug 'mhinz/vim-signify'

" Undo Tree
" Plug 'mbbill/undotree'

" Snippets
" Plug 'SirVer/ultisnips'
Plug 'theniceboy/vim-snippets'


" === Language
" Markdown Preview, Wiki
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'vimwiki/vimwiki'

Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }
" Plugkk 'vim-scripts/indentpython.vim'
Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
"Plug 'elzr/vim-json'
"Plug 'neoclide/jsonc.vim'
"Plug 'othree/html5.vim'
"Plug 'alvan/vim-closetag'
"" Plug 'hail2u/vim-css3-syntax' " , { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
"" Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"" Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"" Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
""Plug 'jaxbot/browserlink.vim'
"Plug 'HerringtonDarkholme/yats.vim'
"" Plug 'posva/vim-vue'
"" Plug 'evanleck/vim-svelte', {'branch': 'main'}
"" Plug 'leafOfTree/vim-svelte-plugin'
"" Plug 'leafgarland/typescript-vim'
"Plug 'MaxMEllon/vim-jsx-pretty'
"Plug 'pangloss/vim-javascript'
"Plug 'leafgarland/typescript-vim'
"Plug 'peitalin/vim-jsx-typescript'
"" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"Plug 'pantharshit00/vim-prisma'


" === Others
" Other useful utilities
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
" Plug 'makerj/vim-pdf'
"Plug 'xolox/vim-session'
"Plug 'xolox/vim-misc' " vim-session dep

" Dependencies
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'kana/vim-textobj-user'
" Plug 'roxma/nvim-yarp'

" File navigation
Plug 'kevinhwang91/rnvimr'
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'

" Taglist
Plug 'liuchengxu/vista.vim'

"Bookmarks
" Plug 'kshenoy/vim-signature'
 
" Vim Applications
Plug 'itchyny/calendar.vim'

call plug#end()

" ===
" === Dress up my vim
" ===
" === deus
" forbid tmux && nvim background 混乱
if &term =~ '256color'
    set t_ut=
endif

set termguicolors              " enable true colors support
silent! color deus
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

hi NonText ctermfg=gray guifg=grey10
" hi SpecialKey ctermfg=blue guifg=grey70

" === tokyonight
"" Load the colorscheme
" colorscheme tokyonight

" let g:lightline = {'colorscheme': 'tokyonight'}

" Example config in VimScript
" Themes : storm  night day
"" 使用的主题
" let g:tokyonight_style = "storm"
 " let g:tokyonight_style = "night"
 " let g:tokyonight_style = "day"

" vim.g.tokyonight_style == "night"

"" 使用函数斜体
" let g:tokyonight_italic_functions = 1
"" 使用关键字斜体
" let g:tokyonight_italic_keywords = 1
"" 使用变量和标识符斜体
" let g:tokyonight_italic_variables =1
"" 像windows一样的侧边栏 NvimTree获得透明背景
" let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
" Change the "hint" color to the "orange" color, and make the "error" color bright red
"" 将“提示”变为橙色 “错误"变成红色
" let g:tokyonight_colors = {
"   \ 'hint': 'orange',
"   \ 'error': '#ff0000'
" \ }

" ===================== Start of Plugin Settings =====================

" ===================== Dressed nvim =====================
" ===
" === Eleline.vim (like airline)
" ===
let g:airline_powerline_fonts = 0


"===
"=== Ariline 
"===
set t_Co=256
set laststatus=2

" Support powerline fonts
let g:airline_powerline_fonts = 1  
let g:airline#extensions#tabline#enabled = 1 

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
 
" ===================== Default =====================
"===
"=== Coc.nvim
"==
nnoremap tt :CocCommand explorer<CR>

set updatetime=100           " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
                             " delays and poor user experience.
set shortmess+=c             " Don't pass messages to |ins-completion-menu|.

" 相同函数进行高亮度
autocmd CursorHold * silent call CocActionAsync('highlight')

" 查找代码报错
nmap <silent> zi <Plug>(coc-diagnostic-prev)
nmap <silent> zk <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming. (变量重新命名)
nmap <leader>rn <Plug>(coc-rename)

" Use h to show documentation in preview window.
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"  启用 TAB 补全
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
                                
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
 endfunction

" Remap for do codeAction of selected region (选中后可给予更多选项)
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)
" nmap <leader>aw  <Plug>(coc-codeaction-selected)w

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.

au Filetype FILETYPE let b:AutoPairs = {"(": ")"}
au FileType php      let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})

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

" ===
" === vimspector
" ===
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
" noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=❯ texthl=SpellBad

" ===
" === FZF
" ===

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

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }



" ===
" === LeaderF (fuzzy search)
" ===
" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
" let g:Lf_PreviewCode = 1
" let g:Lf_ShowHidden = 1
" let g:Lf_ShowDevIcons = 1
" let g:Lf_CommandMap = {
" \   '<C-k>': ['<C-i>'],
" \   '<C-j>': ['<C-k>'],
" \   '<C-]>': ['<C-v>'],
" \   '<C-p>': ['<C-n>'],
" \}
" let g:Lf_UseVersionControlTool = 0
" let g:Lf_IgnoreCurrentBufferName = 1
" let g:Lf_WildIgnore = {
"         \ 'dir': ['.git', 'vendor', 'node_modules'],
"         \ 'file': ['__vim_project_root', 'class']
"         \}
" let g:Lf_UseMemoryCache = 0
" let g:Lf_UseCache = 0

" ===
" === lazygit.nvim
" ===
noremap <c-g> :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support

" ===================== Language =====================
" ===
" === vim-instant-markdown
" ===
nnoremap <LEADER>p :InstantMarkdownPreview<CR>

" let g:instant_markdown_slow = 1
" let g:instant_markdown_autostart = 0
" " let g:instant_markdown_open_to_the_world = 1
" " let g:instant_markdown_allow_unsafe_content = 1
" " let g:instant_markdown_allow_external_content = 0
" " let g:instant_markdown_mathjax = 1
" let g:instant_markdown_mermaid = 1
" let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
" let g:instant_markdown_autoscroll = 1
" let g:instant_markdown_port = 8888
" let g:instant_markdown_python = 1
" let g:instant_markdown_browser = "firefox"

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
let g:instant_markdown_browser = "google-chrome-stable"
" let g:instant_markdown_browser = "firefox"

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
noremap <LEADER>m :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'




"===
"=== NerdCommenter  (Explation) 
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
" === Undotree (about history)
" ===
" noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> k <plug>UndotreeNextState
	nmap <buffer> i <plug>UndotreePreviousState
	nmap <buffer> K 5<plug>UndotreeNextState
	nmap <buffer> I 5<plug>UndotreePreviousState
endfunc


" ===
" === rnvimr
" ===
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
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
let g:VM_theme             = 'iceblue'
let g:VM_default_mappings = 0
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
" let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
let g:VM_maps['i']                  = 'h'
let g:VM_maps['I']                  = 'H'
let g:VM_maps['Find Under']         = '<C-h>'
let g:VM_maps['Find Subword Under'] = '<C-H>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-n>'
let g:VM_maps["Undo"]               = 'l'
let g:VM_maps["Redo"]               = '<C-r>'

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


