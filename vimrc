<<<<<<< HEAD
" vim: foldmethod=marker foldlevel=0 cc=34

" pathogen {{{
=======
" vim:foldmethod=marker:foldlevel=0:cc=34

" on launch {{{
>>>>>>> --wip-- [skip ci]

call pathogen#infect()

" }}}

<<<<<<< HEAD
" lightline {{{

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" }}}

" colors {{{

syntax enable
=======
" colors {{{

>>>>>>> --wip-- [skip ci]
set background=dark
colorscheme solarized

" }}}

" ui config {{{

set cmdheight=2                   " height of the command bar
set colorcolumn=80                " color column 80
set cursorline                    " highlight current line
set errorbells
set guicursor+=a:blinkon0
set guioptions=aAce               " remove the toolbar in MacVim
set guioptions=aigm
set lazyredraw                    " redraw only when we need to
<<<<<<< HEAD
set noshowmode                    " don't show vim mode
=======
set mousemodel=popup
>>>>>>> --wip-- [skip ci]
set notitle                       " don't set the title of the Vim window
set novisualbell                  " no flashing
set number                        " show line numbers
set ruler                         " show row/col and percentage
set scrolloff=6
set showcmd                       " show command in bottom bar
set showmatch                     " highlight matching [{()}]
set sidescrolloff=6
set visualbell
set wildmenu                      " visual autocomplete for command menu
set wildmode=list:longest,full    " list all options and complete
set wildignore=*.class,*.o,*~     " ignore certain files in tab-completion

" set certain filetype detection values
filetype plugin on
filetype indent on                " load filetype-specific indent files

" set up relative line numbering
" https://jeffkreeftmeijer.com/vim-number/
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Following three lines remove the auto copy function from VIM
set guioptions-=a
set guioptions-=A
set guioptions-=aA

" resize panes when window/terminal gets resized
autocmd VimResized * :wincmd =

" }}}

" searching {{{

set hlsearch                      " highlight matches
set ignorecase                    " case insensitive
set incsearch                     " search as characters are entered
set infercase                     " completion recognizes capitalization
set smartcase                     " lets you search for ALL CAPS

" turn off search highlight
nnoremap <F5> :noh<CR>

" }}}

" folding {{{

set foldenable                    " enable folding
set foldlevelstart=10             " open most folds by default
set foldmethod=indent             " fold based on indent level
set foldnestmax=10                " 10 nested fold max

" space open/closes folds
nnoremap <space> za

" }}}

" movement {{{

set backspace=indent,eol,start    " allow backspacing over everything in insert mode

" Don't let me use the arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" You don't know what you're missing if you don't use this.
nnoremap <C-e> :e#<CR>

" move between open buffers.
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" highlight last inserted text
nnoremap gV `[v`]

" }}}

" leader shortcuts {{{

let mapleader=","                 " leader is comma

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" save session
nnoremap <leader>s :mksession<CR>

" open ag.vim
nnoremap <leader>a :Ag

" save my poor shift key
nmap ; :

<<<<<<< HEAD
" having Ex mode start or showing me the command history
" is a complete pain in the ass if i mistype
map Q <silent>
map q: <silent>
map K <silent>
map q <silent>

" i always, ALWAYS hit ":W" instead of ":w"
command! Q q
command! W w

" undo redo undo
nmap <D-z> u
nmap <D-r> <C-R>
=======
" keymappings {{{

if has("gui_macvim") && has("gui_running")
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " Bubble single lines
  nmap <D-Up> [e
  nmap <D-Down> ]e
  nmap <D-k> [e
  nmap <D-j> ]e

  " Bubble multiple lines
  vmap <D-Up> [egv
  vmap <D-Down> ]egv
  vmap <D-k> [egv
  vmap <D-j> ]egv

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt
else
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <A-]> >gv
  vmap <A-[> <gv

  nmap <A-]> >>
  nmap <A-[> <<

  omap <A-]> >>
  omap <A-[> <<

  imap <A-]> <Esc>>>i
  imap <A-[> <Esc><<i

  " Bubble single lines
  nmap <C-Up> [e
  nmap <C-Down> ]e
  nmap <C-k> [e
  nmap <C-j> ]e

  " Bubble multiple lines
  vmap <C-Up> [egv
  vmap <C-Down> ]egv
  vmap <C-k> [egv
  vmap <C-j> ]egv

  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>

  " Map Control-# to switch tabs
  map  <C-0> 0gt
  imap <C-0> <Esc>0gt
  map  <C-1> 1gt
  imap <C-1> <Esc>1gt
  map  <C-2> 2gt
  imap <C-2> <Esc>2gt
  map  <C-3> 3gt
  imap <C-3> <Esc>3gt
  map  <C-4> 4gt
  imap <C-4> <Esc>4gt
  map  <C-5> 5gt
  imap <C-5> <Esc>5gt
  map  <C-6> 6gt
  imap <C-6> <Esc>6gt
  map  <C-7> 7gt
  imap <C-7> <Esc>7gt
  map  <C-8> 8gt
  imap <C-8> <Esc>8gt
  map  <C-9> 9gt
  imap <C-9> <Esc>9gt
endif
>>>>>>> --wip-- [skip ci]

" }}}

" tmux {{{

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" }}}

" backups {{{

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" }}}

" functions {{{

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" }}}

" editing mode {{{

set autoindent                    " carry over indenting from previous line
set autoread                      " auto read when a file is changed from the outside
set autowrite                     " Automatically :write before running commands
set backspace=indent,eol,start    " allow backspace beyond insertion point
set cindent                       " automatic program indenting
set cinkeys-=0#                   " comments don't fiddle with indenting
set clipboard=unnamed             " all operations work with the OS
set commentstring=\ \ #%s         " when folds are created, add them to this
set copyindent                    " make autoindent use the same chars as prev line
set directory-=.                  " don't store temp files in cwd
set encoding=utf8                 " UTF-8 by default
set expandtab                     " tabs are spaces
set formatoptions=tcqn1           " t - autowrap normal text
                                  " c - autowrap comments
                                  " q - gq formats comments
                                  " n - autowrap lists
                                  " 1 - break _before_ single-letter words
                                  " 2 - use indenting from 2nd line of para
set history=200                   " lines of history to save
set laststatus=2                  " Always display the status line
set linebreak                     " break long lines by word, not char
set listchars+=tab:\|\            " make tabs show up in 'list' mode
set matchtime=2                   " tenths of second to hilight matching paren
set modelines=5                   " how many lines of head & tail to look for ml's
set nobackup                      " no backups left after done editing
set nojoinspaces                  " get rid of extra spaces after sentences
set nowritebackup                 " no backups made while editing
set noswapfile                    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set noshowmode                    " hide the current mode
set printoptions=paper:letter     " US paper
set scroll=4                      " number of lines to scroll with ^U/^D
set scrolloff=15                  " keep cursor away from this many chars top/bot
set sessionoptions-=options       " Don't save runtimepath in Vim session (see tpope/vim-pathogen docs)
set shiftround                    " shift to certain columns, not just n spaces
set shiftwidth=2                  " number of spaces to shift for autoindent or >,<
set shortmess+=A                  " Don't bother me when a swapfile exists
set showbreak=                    " Show for lines that have been wrapped, like Emacs
set showmatch                     " when a bracket is inserted, jump to it
set sidescrolloff=3               " keep cursor away from this many chars left/right
set softtabstop=2                 " number of spaces in tab when editing
set tabstop=2                     " the One True Tab
set shiftwidth=2
set tabstop=2                     " number of visual spaces per TAB
set textwidth=72
set wrap
set wrapmargin=2

" Following three lines remove the auto copy function from VIM
set guioptions-=a
set guioptions-=A
set guioptions-=aA

" }}}

" guifont++.vim {{{
<<<<<<< HEAD
" https://github.com/vim-scripts/guifontpp.vim/blob/master/plugin/guifont%2B%2B.vim

let guifontpp_size_increment=2
let guifontpp_smaller_font_map="<D-->"
let guifontpp_larger_font_map="<D-=>"
let guifontpp_original_font_map="<D-0>"

=======

let guifontpp_smaller_font_map="<M-->"
let guifontpp_larger_font_map="<M-+>"
let guifontpp_original_font_map="<M-=>"

>>>>>>> --wip-- [skip ci]
" }}}

" git {{{

" style my git commit
autocmd Filetype gitcommit setlocal spell textwidth=64

" }}}

" NERDtree {{{

" open NERDTree automatically when vim starts up
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" toggle NERDTree on/off
nnoremap <F6> :NERDTreeToggle<CR>

" change the NERDTree root dir
set autochdir
let NERDTreeChDirMode=2

" add git status to beginning of file name in tree
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '☒',
  \ "Unknown"   : "?"
  \ }

<<<<<<< HEAD
=======
" Refresh NERDTree whenever it gets focus
autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p

>>>>>>> --wip-- [skip ci]
" enable line numbers
let NERDTreeShowLineNumbers=1

" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

<<<<<<< HEAD
" }}}
=======
" }}}

" NERDTree git {{{

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


" }}}
  
" NERDCommenter {{{

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Toggle comments
nmap <D-/> <leader>c<space>

" }}}
>>>>>>> --wip-- [skip ci]

" Syntastic {{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_scss_checkers = ['scss_lint']

let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": ["haml", "html", "json", "markdown", "ruby", "sass", "scss", "sh", "text", "viml", "yaml", "zsh"],
        \ "passive_filetypes": [] }
let g:syntastic_extra_filetypes = [ "make", "gitcommit" ]

" }}}

" CtrlP {{{

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer =  0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" }}}

" GitGutter {{{

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" }}}

<<<<<<< HEAD
=======
" lightline {{{

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

"}}}

" vim-indent-guides {{{

" enable indent guides by default
let g:indent_guides_enable_on_vim_startup = 1

" set custom indent colors
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" }}}

>>>>>>> --wip-- [skip ci]
" MacVim {{{

if has("gui_macvim") && has("gui_running")
  " MacVim shift+arrow-keys behavior (required in .vimrc)
  let macvim_hig_shift_movement=1
  let NERDTreeShowHidden=1
  let NERDTreeIgnore = ['\.DS_Store$']

  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " Bubble single lines
  nmap <D-Up> [e
  nmap <D-Down> ]e
  nmap <D-k> [e
  nmap <D-j> ]e

  " Bubble multiple lines
  vmap <D-Up> [egv
  vmap <D-Down> ]egv
  vmap <D-k> [egv
  vmap <D-j> ]egv

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt
else
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <A-]> >gv
  vmap <A-[> <gv

  nmap <A-]> >>
  nmap <A-[> <<

  omap <A-]> >>
  omap <A-[> <<

  imap <A-]> <Esc>>>i
  imap <A-[> <Esc><<i

  " Bubble single lines
  nmap <C-Up> [e
  nmap <C-Down> ]e
  nmap <C-k> [e
  nmap <C-j> ]e

  " Bubble multiple lines
  vmap <C-Up> [egv
  vmap <C-Down> ]egv
  vmap <C-k> [egv
  vmap <C-j> ]egv

  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>

  " Map Control-# to switch tabs
  map  <C-0> 0gt
  imap <C-0> <Esc>0gt
  map  <C-1> 1gt
  imap <C-1> <Esc>1gt
  map  <C-2> 2gt
  imap <C-2> <Esc>2gt
  map  <C-3> 3gt
  imap <C-3> <Esc>3gt
  map  <C-4> 4gt
  imap <C-4> <Esc>4gt
  map  <C-5> 5gt
  imap <C-5> <Esc>5gt
  map  <C-6> 6gt
  imap <C-6> <Esc>6gt
  map  <C-7> 7gt
  imap <C-7> <Esc>7gt
  map  <C-8> 8gt
  imap <C-8> <Esc>8gt
  map  <C-9> 9gt
  imap <C-9> <Esc>9gt
endif

" }}}
<<<<<<< HEAD

" NERD Commenter {{{

map <D-/> <leader>c<space>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" }}}
=======
>>>>>>> --wip-- [skip ci]
