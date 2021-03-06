
"	 ____			  _	 _				 _	 
"	/ ___|  ___  _ __ | |__ (_)_ __ ___  _ __ ( )___ 
"	\___ \ / _ \| '_ \| '_ \| | '_ ` _ \| '_ \|// __|
"	 ___) | (_) | |_) | | | | | | | | | | |_) | \__ \
"	|____/ \___/| .__/|_| |_|_|_| |_| |_| .__/  |___/
"				|_|					 |_|		  
"				_					
"	 _ ____   _(_)_ __ ___  _ __ ___ 
"	| '_ \ \ / / | '_ ` _ \| '__/ __|
"	| | | \ V /| | | | | | | | | (__ 
"	|_| |_|\_/ |_|_| |_| |_|_|  \___|
"									 

" tool's name: figlet

" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
"set clipboard=unnamedplus
let &t_ut=''
set autochdir


" ===
" === Editor behavior
" ===
set number
set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
"set list
"set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
" ? 
set indentexpr=
" ?
set foldmethod=indent
set foldlevel=99
set foldenable
" ?
set formatoptions-=tc
" ?
set splitright
set splitbelow
" ?
set noshowmode
" ?
set showcmd
" ?
set wildmenu
set ignorecase
set smartcase
" ?
set shortmess+=c
" ?
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
" ?
set ttyfast "should make scrolling faster
" ?
set lazyredraw "same as above
" ?
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
"set colorcolumn=100
set updatetime=1000
" ?
set virtualedit=block

" ?
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
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
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
" let mapleader=" "
let mapleader=","

" Save & quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
noremap <LEADER>src :source ~/.config/nvim/init.vim<CR>

" Open Startify
"noremap <LEADER>st :Startify<CR>

"----------------------------------------------------------------------
" window control
"----------------------------------------------------------------------
noremap <silent><space>= :resize +3<cr>
noremap <silent><space>- :resize -3<cr>
noremap <silent><space>, :vertical resize -3<cr>
noremap <silent><space>. :vertical resize +3<cr>

nnoremap <silent><c-w><c-e> :ExpSwitch edit<cr>
nnoremap <silent><c-w>e :ExpSwitch edit<cr>
nnoremap <silent><c-w>m :ExpSwitch vs<cr>
nnoremap <silent><c-w>M :ExpSwitch tabedit<cr>

noremap <silent><space>hh :nohl<cr>
noremap <silent><bs> :nohl<cr>:redraw!<cr>
noremap <silent><tab>, :call Tab_MoveLeft()<cr>
noremap <silent><tab>. :call Tab_MoveRight()<cr>
noremap <silent><tab>6 :VinegarOpen leftabove vs<cr>
noremap <silent><tab>7 :VinegarOpen vs<cr>
noremap <silent><tab>8 :VinegarOpen belowright sp<cr>
noremap <silent><tab>9 :VinegarOpen tabedit<cr>
noremap <silent><tab>0 :exe "NERDTree ".fnameescape(expand("%:p:h"))<cr>
noremap <silent><tab>y :exe "NERDTree ".fnameescape(vimmake#get_root("%"))<cr>
noremap <silent><tab>g <c-w>p

" Copy to system clipboard
vnoremap Y "+y

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <LEADER>tt :%s/	/\t/g
vnoremap <LEADER>tt :s/	/\t/g

" Open up lazygit
noremap \g :Git 
noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>
nnoremap <c-n> :tabe<CR>:-tabmove<CR>:term lazynpm<CR>

"?
source ~/.config/nvim/cursor.vim

" ===
" === Command Mode Cursor Movement
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <tab>h <C-w>h
noremap <tab>k <C-w>k
noremap <tab>j <C-w>j
noremap <tab>l <C-w>l

" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
" autocmd BufRead,BufNewFile *.md setlocal spell

