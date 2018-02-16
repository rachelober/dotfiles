" colors {{{

let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized
syntax enable

" }}}

" ui config {{{

set cmdheight=2                   " height of the command bar
set colorcolumn=80                " color column 80
set cursorline                    " highlight current line
set guioptions=aAce               " remove the toolbar in MacVim
set lazyredraw                    " redraw only when we need to
set notitle                       " don't set the title of the Vim window
set novisualbell                  " no flashing
set number                        " show line numbers
set ruler                         " show row/col and percentage
set showcmd                       " show command in bottom bar
set showmatch                     " highlight matching [{()}]
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

" resize panes when window/terminal gets resize
autocmd VimResized * :wincmd =

" }}}

" searching {{{

set hlsearch                      " highlight matches
set ignorecase                    " case insensitive
set incsearch                     " search as characters are entered
set infercase                     " completion recognizes capitalization
set smartcase                     " lets you search for ALL CAPS

" custom incorrect spelling colors
highlight SpellErrors guifg=lightred guibg=bg gui=underline cterm=underline term=underline

" nice-looking hilight if I remember to set my terminal colors
highlight clear Search
highlight Search term=NONE cterm=NONE ctermfg=white ctermbg=black

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

" }}}

" on launch {{{

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

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
set backspace=indent,eol,startset " allow backspace beyond insertion point
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

" }}}

" guifont++.vim
let guifontpp_smaller_font_map="<M-->"
let guifontpp_larger_font_map="<M-+>"
let guifontpp_original_font_map="<M-=>"


" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
" let g:is_posix = 1
" 


" git {{{

" style my git commit
autocmd Filetype gitcommit setlocal spell textwidth=64

" }}}


" Plugins

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

" }}}
  
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

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" MacVim {{{

" MacVim shift+arrow-keys behavior (required in .vimrc)
if has("gui_macvim")
  let macvim_hig_shift_movement=1
  let NERDTreeShowHidden=1
  let NERDTreeIgnore = ['\.DS_Store$']
endif

" }}}

" vim:foldmethod=marker:foldlevel=0:cc=34
