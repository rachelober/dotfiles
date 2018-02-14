execute pathogen#infect()

" colorscheme
" let g:solarized_termcolors=256
" set t_Co=256
" set background=dark
" colorscheme solarized

" ----------------------------------------------------------------------------
" COLORS
" ----------------------------------------------------------------------------

" Make sure colored syntax mode is on, and make it Just Work with 256-color terminals.
" let g:solarized_termcolors=256
" set t_Co=256
set background=dark
colorscheme solarized
" if !has('gui_running')
"   let g:solarized_termcolors=256
"   if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
"     set t_Co=256
"   elseif has("terminfo")
"     colorscheme default
"     set t_Co=8
"     set t_Sf=[3%p1%dm
"     set t_Sb=[4%p1%dm
"   else
"     colorscheme default
"     set t_Co=8
"     set t_Sf=[3%dm
"     set t_Sb=[4%dm
"   endif
"   " Disable Background Color Erase when within tmux - https://stackoverflow.com/q/6427650/102704
"   if $TMUX != ""
"     set t_ut=
"   endif
" endif
" syntax on

" Window splits & ruler are too bright, so change to white on grey (non-GUI)
" highlight StatusLine       cterm=NONE ctermbg=blue ctermfg=white
" highlight StatusLineTerm   cterm=NONE ctermbg=blue ctermfg=white
" highlight StatusLineNC     cterm=NONE ctermbg=black ctermfg=white
" highlight StatusLineTermNC cterm=NONE ctermbg=black ctermfg=white
" highlight VertSplit        cterm=NONE ctermbg=black ctermfg=white

" Custom mode for distraction-free editing
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set bg=light
  colors solarized
endfunction
command! ProseMode call ProseMode()

" Syntastic
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

" Whitespace
" set wrap
" set wrapmargin=2
" set tabstop=2
" set shiftwidth=2
" set softtabstop=2
" set textwidth=72
" set expandtab

" Don't let me use the arrow keys
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

" Allow backspacing over everything in insert mode
" set backspace=indent,eol,start

" Remove the toolbar in MacVim
" set guioptions=aAce

" guifont++.vim
" let guifontpp_smaller_font_map="<M-->"
" let guifontpp_larger_font_map="<M-+>"
" let guifontpp_original_font_map="<M-=>"

" MacVim shift+arrow-keys behavior (required in .vimrc)
" if has("gui_macvim")
"   let macvim_hig_shift_movement=1
"   let NERDTreeShowHidden=1
"   let NERDTreeIgnore = ['\.DS_Store$']
" endif

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
" let g:is_posix = 1
" 
" set autoindent              " carry over indenting from previous line
" set backspace=2             " allow backspace beyond insertion point
" set cindent                 " automatic program indenting
" set cinkeys-=0#             " comments don't fiddle with indenting
" set clipboard=unnamed       " all operations work with the OS
" set colorcolumn=80          " color column 80
" set commentstring=\ \ #%s   " when folds are created, add them to this
" set copyindent              " make autoindent use the same chars as prev line
" set directory-=.            " don't store temp files in cwd
" set encoding=utf8           " UTF-8 by default
" set expandtab               " no tabs
" set foldmethod=marker
" set formatoptions=tcqn1     " t - autowrap normal text
"                             " c - autowrap comments
"                             " q - gq formats comments
"                             " n - autowrap lists
"                             " 1 - break _before_ single-letter words
"                             " 2 - use indenting from 2nd line of para
" set hlsearch                " hilight searching
" set ignorecase              " case insensitive
" set incsearch               " search as you type
" set infercase               " completion recognizes capitalization
" set laststatus=2            " Always display the status line
" set linebreak               " break long lines by word, not char
" set listchars+=tab:\|\      " make tabs show up in 'list' mode
" set matchtime=2             " tenths of second to hilight matching paren
" set modelines=5             " how many lines of head & tail to look for ml's
" set nobackup                " no backups left after done editing
" set novisualbell            " no flashing
" set number                  " turn on line numbers
" set nobackup
" set nowritebackup           " no backups made while editing
" set noswapfile              " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
" set autowrite               " Automatically :write before running commands
" set printoptions=paper:letter " US paper
" set rnu                     " set relative line numbering
" set nonumber
" set relativenumber
" set ruler                   " show row/col and percentage
" set scroll=4                " number of lines to scroll with ^U/^D
" set scrolloff=15            " keep cursor away from this many chars top/bot
" set shiftround              " shift to certain columns, not just n spaces
" set shiftwidth=2            " number of spaces to shift for autoindent or >,<
" set showmatch               " when a bracket is inserted, jump to it
" set sidescrolloff=3         " keep cursor away from this many chars left/right
" set smartcase               " lets you search for ALL CAPS
" set softtabstop=2           " spaces 'feel' like tabs
" set tabstop=2               " the One True Tab
" set nojoinspaces
" set notitle                 " don't set the title of the Vim window
" set wildmenu                " show possible completions on command line
" set wildmode=list:longest,full " list all options and complete
" set wildignore=*.class,*.o,*~  " ignore certain files in tab-completion

" custom incorrect spelling colors
" highlight SpellErrors guifg=lightred guibg=bg gui=underline cterm=underline term=underline

" nice-looking hilight if I remember to set my terminal colors
" highlight clear Search
" highlight Search term=NONE cterm=NONE ctermfg=white ctermbg=black

" style my git commit
" autocmd Filetype gitcommit setlocal spell textwidth=72

" set up relative line numbering
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber

" Following three lines remove the auto copy function from VIM
" set guioptions-=a
" set guioptions-=A
" set guioptions-=aA

" Open NERDTree automatically when vim starts up
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
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
