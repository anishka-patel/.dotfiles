syntax enable

filetype on
filetype indent on

" Setting mapleader to SPC
let mapleader=" "

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=75

" Configuration for NERDCommenter -- begin
let g:NERDCreateDefaultMappings = 1                                     " Create default mappings
let g:NERDSpaceDelims = 1                                               " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1                                           " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'                                         " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1                                            " Set a language to use its alternate delimiters by default
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }   " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1                                         " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1                                    " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1                                       " Enable NERDCommenterToggle to check all selected lines is commented or not
" -- end

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee %> /dev/null' <bar> edit!

set ruler " Always show current position
set cmdheight=1
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set path+=**
set nocompatible
set cursorline
set colorcolumn=80
set foldcolumn=1
set nowrap
set number relativenumber
set splitbelow splitright
set shiftwidth=4 tabstop=4 softtabstop=4
set expandtab autoindent smartindent
set showmatch showcmd
set noshowmode
set ignorecase smartcase                " Ignore case when searching
set incsearch hlsearch                  " Highlight search results
set wildmenu wildmode=list,longest,full " Turn on the wildmenu
set history=1000
set nobackup nowb noswapfile
set clipboard=unnamedplus
set lazyredraw                          " Don't redraw while executing macros (good performance config)
set termguicolors
set scrolloff=30


" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set encoding=utf8

" Mappings
" nnoremap <C-u> <C-u>zz
" nnoremap <C-d> <C-d>zz
" nnoremap <C-f> <C-f>zz
" nnoremap <C-b> <C-b>zz


nnoremap <SPACE> <Nop>
nnoremap <Leader>/ :nohlsearch<CR>

map <leader>bd :Bclose<cr>:tabclose<cr>gT
map <leader>ba :bufdo bd<cr>
map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>
map <leader>bq :e ~/buffer<cr>
map <leader>bx :e ~/buffer.md<cr>

map <leader>cd :cd %:p:h<cr>:pwd<cr>

map <leader>ee :NERDTreeToggle<cr>
map <leader>eo :NERDTreeFocus<cr>
map <leader>ef :NERDTreeFind<cr>
map <leader>el :Lexplore 20<cr>

map <leader>fs :w!<cr>

map <leader>h  :nohl<cr>

map <leader>;o :TagbarToggle<cr>

map <leader>tN :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>tn :tabnext
map <leader>tp :tabprev
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

map <leader>Tw :FixWhitespace<cr>

map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

map <leader>pp :setlocal paste!<cr>
map <leader>q  :q<cr>
map <leader>z  :Goyo<cr>

" Indent guide default mapping <Leader>ig
" Default mapping for NERDCommenter -- Begin
" [count]<leader>cc |NERDCommenterComment           " Comment out the current line or text selected in visual mode.
" [count]<leader>cn |NERDCommenterNested|           " Same as cc but forces nesting.
" [count]<leader>c<space> |NERDCommenterToggle|     " Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
" [count]<leader>cm |NERDCommenterMinimal|          " Comments the given lines using only one set of multipart delimiters.
" [count]<leader>ci |NERDCommenterInvert|           " Toggles the comment state of the selected line(s) individually.
" [count]<leader>cs |NERDCommenterSexy|             " Comments out the selected lines with a pretty block formatted layout.
" [count]<leader>cy |NERDCommenterYank|             " Same as cc except that the commented line(s) are yanked first.
" <leader>c$ |NERDCommenterToEOL|                   " Comments the current line from the cursor to the end of line.
" <leader>cA |NERDCommenterAppend|                  " Adds comment delimiters to the end of line and goes into insert mode between them.
"            |NERDCommenterInsert|                  " Adds comment delimiters at the current cursor position and inserts between. Disabled by default.
" <leader>ca |NERDCommenterAltDelims|               " Switches to the alternative set of delimiters.
" [count]<leader>cl |NERDCommenterAlignLeft
" [count]<leader>cb |NERDCommenterAlignBoth         " Same as |NERDCommenterComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).
" [count]<leader>cu |NERDCommenterUncomment|        " Uncomments the selected line(s).
" -- End

try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', {'name':'dracula'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'kien/rainbow_parentheses.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'justinmk/vim-sneak'
Plug 'majutsushi/tagbar'
Plug 'baskerville/vim-sxhkdrc'
Plug 'waycrate/swhkd'
call plug#end()


colorscheme dracula

let g:sneak#label = 1

hi Normal guibg=NONE ctermbg=NONE

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
