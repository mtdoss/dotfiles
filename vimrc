set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"Super undo tree
Plugin 'sjl/gundo.vim'

Plugin 'kien/ctrlp.vim'

Plugin 'jeetsukumaran/vim-buffergator'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'ggreer/the_silver_searcher'

Plugin 'rking/ag.vim'

"easy commenting
Plugin 'tomtom/tcomment_vim'

" Git
Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-repeat'

Plugin 'tpope/vim-unimpaired'

Plugin 'tpope/vim-rails'

" vim windows reopen - works with tmux-resurrect!
Plugin 'tpope/vim-obsession'

Plugin 'jiangmiao/auto-pairs'

Plugin 'mileszs/ack.vim'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'wesQ3/vim-windowswap'

Plugin 'ecomba/vim-ruby-refactoring'

Plugin 'tmhedberg/matchit'

Plugin 'junegunn/vim-easy-align'
" Vim snippets
"Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Vim auto-complete (worried it might interfere with vim snippets?)
" Currently NOT working for C-family languages!!
Plugin 'Valloric/YouCompleteMe'

" Lets tab be used for both youcompleteme and ultisnips
Plugin 'ervandew/supertab'

" Syntax checking
Plugin 'scrooloose/syntastic'

Plugin 'kchmck/vim-coffee-script'

Plugin 'scrooloose/nerdtree'

" Plugin 'chrisbra/csv.vim'

" Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'shime/vim-livedown'

Plugin 'endel/vim-github-colorscheme'
Plugin 'tpope/vim-vividchalk'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable   " enable syntax processing
set background=dark
" let g:solarized_termcolors=256
let base16colorspace=256
colorscheme molokai
" colorscheme base16-default
" colorscheme solarized
" colorscheme badwolf

" COLORS
" badwolf's syntastic highlighting
" Cap is warning, Bad is error
hi SpellCap cterm=undercurl ctermfg=10 ctermbg=NONE
hi SpellBad cterm=undercurl ctermfg=52 ctermbg=NONE
" completion menu
hi Pmenu ctermbg=236
hi ErrorMsg ctermfg=196 ctermbg=NONE
" visual mode highlight color
hi Visual ctermbg=238
" folds aren't annoying
hi Folded ctermbg=NONE

set tabstop=2   " number of visual spaces per tab

set softtabstop=2   " number of spaces in tab when editing

set shiftwidth=2   " number of spaces when using auto-indent, i think

set expandtab  " tabs are spaces

set number    " show line numbers

set colorcolumn=80  "set ruler

set showcmd  " show command in bottom bar

set cursorline " highlight current line
highlight CursorLine ctermbg=235

filetype indent on " load filetype-specific indent files (don't have these yet)

set wildmenu   " visual autocomplete for command menu - shows matches you cycle through

set lazyredraw  " redraw only when need to - means faster macros

set showmatch  " highlight matching for ({[  ]})

set backspace=2 " make backspace work in insert mode

set incsearch  " search as characters are entered

set hlsearch  " highlight matches

let mapleader=" "

" darkgravel     = ['242321', 235]

"turn off search highlight with ,<space>
nnoremap <leader>, :nohlsearch<CR>

" maybe add some folding things?

" move vertically by visual line - so a long line that gets wrapped, won't skip over
" But you can still use relative numbers to count
" Equivalent but more succinct than
" nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
" nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
"
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'


" visually selects last block of characters added last time you were in INSERT 
" doesn't behave well if you didn't add anything, e.g. new file
nnoremap <leader>v `[v`]

"status line
:set laststatus=2    "always show status line
" path
set statusline=%f
"line x of y
" set statusline+=\ [line\ %l\/%L]
" put git status, column/row number, total lines, and percentage in status
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

" highlight the status bar when in insert mode
" 211 is rose's dress in idiot's lantern, 39 is TARDIS blue
if version >= 700
  au InsertEnter * hi StatusLine ctermbg=211 ctermfg=white
  au InsertLeave * hi StatusLine ctermbg=39 ctermfg=white
  au BufEnter * hi StatusLine ctermbg=39 ctermfg=white
endif

" if version >= 700
"   au InsertEnter * hi StatusLine ctermfg=211 ctermbg=white
"   au InsertLeave * hi StatusLine ctermfg=39 ctermbg=white
" endif
" jk is escape
inoremap jk <esc>

" toggle gundo: shows undo tree

nnoremap <leader>u :GundoToggle<CR>

" open ag.vim
nnoremap <leader>ag :Ag! 

"" CtrlP settings
" order top to bottom
let g:ctrlp_match_window = 'bottom,order:ttb'
" always open files in new buffers
let g:ctrlp_switch_buffer = 0
" if you change working directory during vim session, ctrlp will respect that
" change
let g:ctrlp_working_path_mode = 0
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_map = '<leader>t'
let g:ctrlp_open_new_file = 'r' " newly created file opened in same window
" Won't work if using Ag
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }


" Automatically clear cache upon creation of file
:autocmd BufNewFile * :CtrlPClearCache

" That doesn't appear to clear cache when I make a file through NERDTree, so:
" let g:CtrlPClearCache = '<leader>pc'<CR>
nnoremap <leader>pc :CtrlPClearCache<CR>

" For Ultisnips/YouCompleteMe
"
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" "
" " If you want :UltiSnipsEdit to split your window.
"  let g:UltiSnipsEditSplit="vertical"
"
" " Change default key-binding of YCM to c-tab and c-s-tab
" " let g:ycm_key_list_select_completion=['<C-TAB>', '<Down>']
" " letM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
"
"
" " Default action of SuperTab to triggering <C-TAB>:
" let g:SuperTabDefaultCompletionType='<C-Tab>'

" ,cc to toggle current line; ,c[motion] to toggle area
let g:tcommentMapLeaderOp1='<leader>c'

" recommended syntastic settings; revisit these!
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" displays all errors from all checkers together
let g:syntastic_aggregate_errors = 1

let g:syntastic_ruby_rubocop_exec  =  '/Users/markdoss/.rbenv/shims/rubocop'
" let g:syntastic_ruby_checkers = ['jruby', 'macruby', 'mri', 'reek', 'rubocop', 'rubylint']
" let g:syntastic_ruby_checkers = ['rubylint']
" let g:syntastic_ruby_rubocop_exec  = '/Users/markdoss/.rbenv/shims/ruby /Users/markdoss/.rbenv/shims/rubocop'

" " moves backups to /tmp directory
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set relativenumber
""" Toggle relativenumber using <leader>rn
function! NumberToggle()
  if(&rnu == 1)
    set rnu!
    set nu
  else
    set rnu!
  endif
endfunction
nnoremap <leader>rn :call NumberToggle()<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"
"" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
" let g:UltiSnipsExpandTrigger="<c-j>"

" nerdtree
nnoremap <leader>w :NERDTree<CR>

" close vim if only window open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERDtree open automatically if vim starts up with no files specified

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

:nmap <C-s> :w<CR>
:imap <C-s> jk:w<CR>

" Bubble single lines
nmap ˚ [e
nmap ∆ ]e
" " Bubble multiple lines
vmap <M-j> ]egv
vmap <M-k> [egv

" navigate splits like a sane person
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Window swap bindings
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ss :call WindowSwap#EasyWindowSwap()<CR>

" Buffer gator
let g:buffergator_suppress_keymaps = 1
nnoremap <leader>b :BuffergatorOpen<CR>
nnoremap <leader>B :BuffergatorClose<CR>

" Auto center when searching
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz
" I prefer # for going forward, * for backward
nnoremap # *zz
nnoremap * #zz

" For multiple cursors as well
" nnoremap <C-n> <C-n>zz
" nnoremap <C-x> <C-p>zz
" nnoremap <C-p> <C-p>zz

highlight Cursor guifg=green guibg=red

" the idea here is if my focus isn't on vim, the absolute line numbers appear
" this is good if you're running tests in a separate terminal window, for
" example. but i can't get it to work
" :au FocusLost * :set number
" :au FocusGained * :set relativenumber
" " It might make more sense to use absolute line numbers in insert mode
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber

" Paste outside of vim
map <leader>y "+y
" Paste into vim
map <leader>pp "+p
" Uses Ag to search for the most recent text that we searched
map <leader>sa gny:Ag! <C-R>"<CR>
" Uses Ag to search for the word under the cursor
map <leader>ca yiw:Ag! <C-r>"<CR>
" Uses Ag to search for the definition of word under cursor (Ruby)
" There is probably a better way to do this!! (or someone else did it for all
" languages). One thing this doesn't even do is capture def self.func_name...
map <leader>fd yiw:Ag! 'def <C-r>"'

if &diff
  colorscheme github
  map q :wq<CR><C-w>q
  nnoremap n ]czz
  nnoremap N [czz
  set nocursorline
endif

" Easy align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" ^ is far away
noremap ! ^

map <leader>av :AV<CR>
map <leader>as :AS<CR>
map <leader>aa :A<CR>
map <leader>sv :source ~/.vimrc<CR>

map <leader>hs :split<CR>
map <leader>vs :vs<CR>

" Easy require byebug
map <leader>bb jkggO<BS><BS>require 'byebug'jk<C-o>

map <leader>md :LivedownPreview<CR>
map <leader>nmd :LivedownKill

map <C-q> <C-y>

" comma swap
nnoremap <leader>cs dWwi, <ESC>pxhx
" format text
nnoremap Q gq
nnoremap QQ gqq

" Fugitive
map <leader>gb :Gblame<CR>
