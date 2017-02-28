set nocp
execute pathogen#infect()

" " COMMON LISP
" let g:slimv_swank_cmd = '! st -e sbcl --load /home/akhetopnu/Programs/slime/start-swank.lisp &'
" let g:slimv_impl = 'sbcl'
" let g:slimv_preferred = 'sbcl'


" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" nnoremap <C-a> :so $MYVIMRC
" nnoremap <A-w> :emenu Slimv.Edit.Paredit-Wrap<CR>
" nnoremap <A-s> :emenu Slimv.Edit.Paredit-Splice<CR>
" nnoremap <A-h> :emenu Slimv.Edit.Paredit-MoveLeft<CR>
" nnoremap <A-l> :emenu Slimv.Edit.Paredit-MoveRight<CR>
" nnoremap <C-c><C-x> :emenu Slimv.Repl.Clear-REPL<CR>
" nnoremap <C-c><C-f> :emenu Slimv.Repl.Connect-Server<CR>
" " nnoremap <C-c><C-f> :emenu Slimv.Repl.Connect-Server<CR>
" nnoremap <C-c><C-c> :emenu Slimv.Evaluation.Eval-Defun<CR>
" nnoremap <C-c><C-h> :emenu Slimv.Documentation.Hyperspec<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version:
"       5.0 - 29/05/12 15:43:36
"
" Blog_post:
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version:
"       http://amix.dk/vim/vimrc.txt



let g:airline#extensions#tabline#fnamemod = ':t'
let g:test#javascript#mocha#file_pattern = '\v\.test\.js$'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
set history=10000
set path+=**
set autoread " Set to auto read when a file is changed from the outside
" au CursorHold,CursorHoldI
"
set so=7 " Set 7 lines to the cursor - when moving vertically using j/k
set wildmenu " Turn on the WiLd menu
set wildignore=*.o,*~,*.pyc,*/node_modules/* " Ignore compiled files
set ruler "Always show current position
set cmdheight=1 " Height of the command bar
set hid " A buffer becomes hidden when it is abandoned
set backspace=eol,start,indent " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases
set hlsearch " Highlight search results
set incsearch " Makes search act like search in modern browsers
set lazyredraw " Don't redraw while executing macros (good performance config)
set magic " For regular expressions turn magic on
" set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets
set noerrorbells " No annoying sound on errors
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set relativenumber
set guifont="gohufont uni 11"
set guioptions-=r
set guioptions-=L
set guioptions-=T
set guioptions-=m
set foldmethod=indent
" set background=dark
set colorcolumn=60

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set completeopt=longest,menuone,preview
set previewheight=1
set splitbelow

""Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch

" au BufWrite * :Autoformat
" let g:formatdef_my_custom_cs = '"astyle --mode=cs --style=ansi -pcHs4"'
" let g:formatters_cs = ['my_custom_cs']


" FLOW.js
let g:flow#autoclose = 1
let g:flow#enable = 1
let g:flow#flowpath = 1
let g:flow#omnifunc = 1
let g:flow#errjmp = 1

nmap <silent> <A-k> <Plug>(ale_previous_wrap)
nmap <silent> <A-j> <Plug>(ale_next_wrap)

let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_linters = { 'javascript': ['eslint', 'flow'] }
" let g:ale_linters = ['tslint']
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_lint_delay = 0

" ELM LANGUAGE
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_detailed_complete = 1

" LIGHTLINE
set noshowmode
" let g:lightline = { 'colorscheme': 'scala' }
set fillchars=""
set termguicolors
" set t_Co=256
syntax on
" colorscheme mellow-purple
" colorscheme rebecca
" colorscheme icy
" colorscheme office-dark
" colorscheme citylights
" colorscheme Tomorrow-Night-Eighties
" colorscheme thor
" colorscheme fromthehell
" colorscheme solarized-dark
" colorscheme underwater
" colorscheme duotone-darkpool
" colorscheme neonwave
" colorscheme duotone-darksea
" colorscheme oceandeep
" colorscheme two-firewatch
" colorscheme zazen
colorscheme grayscale-dark
" set rtp+=
" colorscheme atelier-sulphurpool
" colorscheme mocha
" colorscheme marrakesh
" set bg=dark
" hi Normal ctermbg=none
" hi NonText ctermbg=none

" set expandtab
setlocal indentkeys+=0
" set shiftwidth=3
" set tabstop=3
" set smarttab
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set lbr
set tw=500 " Linebreak on 500 characters
set nobackup
set nowb
set noswapfile
set encoding=utf8
set ffs=unix,dos,mac " Use Unix as the standard file type


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>
vnoremap <c-s> <Esc>:w<CR>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <A-h> :tabp<cr>
map <A-l> :tabn<cr>
map <A-k> :tablast<cr>
map <A-j> :tabfirst<cr>
map <A-C-h> :-tabmove<cr>
map <A-C-l> :+tabmove<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
	set switchbuf=useopen,usetab,newtab
	set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
" map 0 ^

nmap <M-j> ddp
nmap <M-k> ddkP

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nmap <silent> <C-D> :NERDTreeToggle<CR>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" nmap <M-j> mz:m+<cr>`z
" nmap <M-k> mz:m-2<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
" map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
