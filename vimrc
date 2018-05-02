" vim: foldmethod=marker foldlevel=1 cc=34
" Name:     Dotfiles
" Author:   Rachel Ober
" URL:      https://github.com/rachelober/dotfiles
" License:  GNU General Public License v3.0
" Created:  2009 Sep 23
" Modified: 2018 Apr 04

" pathogen

" temporarily disable some plugins
" let g:pathogen_blacklist = ['NrrwRgn', 'ack.vim', 'ctrlp.vim',  'lightline-ale', 'supertab', 'vim-better-whitespace', 'vim-buffergator', 'vim-bundler', 'vim-closetag', 'vim-css-color', 'vim-dispatch', 'vim-dotenv', 'vim-easymotion', 'vim-flow', 'vim-fugitive', 'vim-gitgutter', 'vim-graphql', 'vim-indent-guides', 'vim-javascript', 'vim-json', 'vim-jsx', 'vim-multiple-cursors', 'vim-rails', 'vim-rhubarb', 'vim-snipmate', 'vim-snippets', 'vim-styled-components', 'vim-styled-jsx', 'vim-surround', 'vim-repeat' ]
" let g:pathogen_blacklist = [ 'vim-javascript',  'vim-jsx', 'vim-styled-jsx', 'vim-json', 'vim-styled-components' ]
let g:pathogen_blacklist = [   ]

call pathogen#infect()

"

" colors {{{

syntax enable
set background=dark
silent! colorscheme desert
silent! colorscheme solarized

" }}}

" ui config {{{

set cmdheight=3                   " height of the command bar
set colorcolumn=80                " color column 80
set cursorline                    " highlight current line
set errorbells                    " TODO
set foldenable                    " enable folding
set foldlevelstart=10             " open most folds by default
set foldnestmax=10                " 10 nested fold max
set foldmethod=indent             " fold based on indent level
set guicursor+=a:blinkon0         " TODO
set guioptions=aAce               " remove the toolbar in MacVim
set guioptions=aigm               " TODO
set hlsearch                      " highlight matches
set ignorecase                    " case insensitive
set incsearch                     " search as characters are entered
set infercase                     " completion recognizes capitalization
set lazyredraw                    " redraw only when we need to
set noshowmode                    " don't show vim mode
set mousemodel=popup              " TODO
set notitle                       " don't set the title of the Vim window
set novisualbell                  " no flashing
set number relativenumber         " set up relative line numbering
                                  " https://jeffkreeftmeijer.com/vim-number/
set pastetoggle=<F2>              " toggle auto-indenting for code past
                                  " http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
set ruler                         " show row/col and percentage
set showcmd                       " show command in bottom bar
set showmatch                     " highlight matching [{()}]
set smartcase                     " lets you search for ALL CAPS
set updatetime=100                " reduce the default time to update vim
set visualbell                    " TODO
set wildmenu                      " visual autocomplete for command menu
set wildmode=list:longest,full    " list all options and complete
set wildignore=*.class,*.o,*~     " ignore certain files in tab-completion
set wmh=0                         " set maximum window height to 0

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
" set scrolloff=15                  " keep cursor away from this many chars top/bot
set sessionoptions-=options       " Don't save runtimepath in Vim session (see tpope/vim-pathogen docs)
set shiftround                    " shift to certain columns, not just n spaces
set shiftwidth=2                  " number of spaces to shift for autoindent or >,<
set shortmess+=A                  " Don't bother me when a swapfile exists
set showbreak=                    " Show for lines that have been wrapped, like Emacs
set showmatch                     " when a bracket is inserted, jump to it
set sidescrolloff=3               " keep cursor away from this many chars left/right
set softtabstop=2                 " number of spaces in tab when editing
set tabstop=2                     " the One True Tab
set timeoutlen=1000               " mapping delays
set ttimeoutlen=10                " key code delays
set textwidth=72
set wrap
set wrapmargin=2

" following three lines remove the auto copy function from VIM
" http://vim.wikia.com/wiki/Auto_copy_the_mouse_selection
set guioptions-=a
set guioptions-=A
set guioptions-=aA

" }}}

" auto commands {{{

" set certain filetype detection values
filetype plugin on
filetype indent on                " load filetype-specific indent files

if has('autocmd')
  augroup filetype_markdown
    autocmd!
    " make sure all markdown files have the correct filetype set and setup wrapping
    autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
    if !exists("g:disable_markdown_autostyle")
      autocmd FileType markdown setlocal wrap linebreak textwidth=72 nolist
    endif
  augroup END

  " TODO
  " remember last location in file, but not for commit messages.
  " see :help last-position-jump
  " autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  "       \| exe "normal! g`\"" | endif

  augroup filetype_gitcommit
    autocmd!
    " style my git commit
    autocmd FileType gitcommit setlocal spell textwidth=64
    " always start on first line of git commit message
    autocmd FileType gitcommit autocmd! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
  augroup END

  augroup filetype_vimrc
    autocmd!
    " reloads the (g)vimrc files if a configuration file is written
    autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc source $MYVIMRC | if has('gui_running') | source $MYGVIMRC | endif
    " apply modeline operation after sourcing (g)vimrc
    autocmd! BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc set modeline | doautocmd BufRead
  augroup END

  " TODO
  " augroup filetype_jsx
    " autocmd!
    " autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  " augroup END

  " TODO
  " augroup chdir
  "   autocmd!
  "   " auto change the directory to the current file I'm working on
  "   autocmd BufEnter * lcd %:p:h
  " augroup END

  augroup LineNumberToggle
    autocmd!
    " when buffer gains focus, use relativenumber
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    " when buffer loses focus, use norelativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END

  augroup OnResize
    autocmd!
    " resize panes when window/terminal gets resized
    autocmd VimResized * :wincmd =

    " redraw every time MacVim is resized
    autocmd VimResized * redraw!
  augroup END

  augroup CursorLine
    autocmd!
    " remove the cursorline whenever you leave the window
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
  augroup END

  augroup CursorLineToggle
    autocmd!
    " toggle cursorline coloring when entering and leaving insert mode
    autocmd InsertEnter * highlight cursorline gui=NONE guifg=NONE guibg=#002b36 cterm=NONE ctermfg=NONE ctermbg=234
    autocmd InsertLeave * highlight cursorline gui=NONE guifg=NONE guibg=#073642 cterm=NONE ctermfg=NONE ctermbg=235
  augroup END

	augroup CursorToggle
	  autocmd!
	  " toggle cursor coloring when entering and leaving insert mode
    autocmd InsertEnter * highlight cursor gui=NONE guifg=NONE guibg=#dc322f cterm=NONE ctermfg=NONE ctermbg=160
    autocmd InsertLeave * highlight cursor gui=NONE guifg=NONE guibg=#dc322f cterm=NONE ctermfg=NONE ctermbg=160
  augroup END
endif

" }}}

" mappings {{{

" leader is comma
let mapleader=","

" save my poor shift key
nmap ; :

" TODO page like a browser
" nmap <Space> <PageDown>

" don't let me use the arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" space open/closes folds
nnoremap <Space> za

" move between the current and alternate buffers without reloading
" https://stackoverflow.com/questions/133626/how-do-you-return-from-gf-in-vim
nnoremap <F1> :e#<CR>

" turn off search highlight
nnoremap <F5> :noh<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <NOP>
nnoremap ^ <NOP>

" TODO cycle between open buffers
nmap <Left> :bnext<CR>
nmap <Right> :bprev<CR>

" cycle between splits
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" TODO move windows around
" nnoremap <> <C-W>J
" nnoremap <> <C-W>K
" nnoremap <> <C-W>H
" nnoremap <> <C-W>L

" TODO this doesn't really work too well
" highlight last inserted text
nnoremap gV `[v`]

" edit vimrc in a vertical split
nnoremap <Leader>ev :vsp $MYVIMRC<CR>

" edit zshrc in a vertical split
nnoremap <Leader>ez :vsp ~/.zshrc<CR>

" load vimrc bindings
nnoremap <Leader>sv :source $MYVIMRC<CR>

" load gvimrc bindings
nnoremap <Leader>sgv :source $MYGVIMRC<CR>

" save session
nnoremap <Leader>s :mksession<CR>

" having Ex mode start or showing me the command history
" is a complete pain in the ass if i mistype
map Q <Silent>
map q: <Silent>
map K <Silent>
map q <Silent>

" i always, ALWAYS hit ":W" instead of ":w"
command! Q q
command! W w

" undo redo undo
nmap <D-z> u
nmap <D-r> <C-R>

" format the entire file
nnoremap <Leader>fef :normal! gg=G``<CR>

" upper/lower word
nmap <Leader>u mQviwU`Q
nmap <Leader>l mQviwu`Q

" upper/lower first char of word
nmap <Leader>U mQgewvU`Q
nmap <Leader>L mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <Silent> <Leader>cd :lcd %:h<CR>

" create the directory containing the file in the buffer
nmap <Silent> <Leader>mkdir :!mkdir -p %:p:h<CR>

" helpers for edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
map <Leader>ew :e %%
map <Leader>es :sp %%
map <Leader>ev :vsp %%
map <Leader>et :tabe %%

if has('gui_macvim') && has('gui_running')
  " MacVim shift+arrow-keys behavior (required in .vimrc)
  let macvim_hig_shift_movement=1

  " map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " bubble single lines
  nmap <D-k> [e
  nmap <D-j> ]e

  " bubble multiple lines
  vmap <D-k> [egv
  vmap <D-j> ]egv

  " map command-# to switch tabs
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
  " map command-[ and command-] to indenting or outdenting
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
  nmap <C-k> [e
  nmap <C-j> ]e

  " Bubble multiple lines
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

" }}}

" NrrwRgn {{{
" https://github.com/chrisbra/NrrwRgn
" }}}

" Ack.vim {{{
" https://github.com/mileszs/ack.vim

" Ack requires ack command
if executable('ack')
  " use default config
elseif executable('ack-grep')
  let g:ackprg='ack-grep -H --nocolor --nogroup --column'
elseif executable('ag')
  let g:ackprg='ag --nocolor --nogroup --column'
endif

if has('gui_macvim') && has('gui_running')
  " Command-shift-F on OSX
  map <D-F> :Ack<Space>
endif

" }}}

" ALE {{{
" https://github.com/w0rp/ale

" key mappings for :ALEFix
nmap <Leader>d <Plug>(ale_fix)

let g:ale_linters = {
  \ 'jsx': ['stylelint', 'eslint'],
  \ 'vim': ['vint']
  \ }

let g:ale_linter_aliases = {
  \ 'jsx': 'css'
  \ }

" ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'vim': ['vint'],
  \ }

" fix files automatically on save
let g:ale_fix_on_save = 1

" enable completion where available
let g:ale_completion_enabled = 1

" keep the sign gutter open
let g:ale_sign_column_always = 1

" change the signs ALE uses
" let g:ale_sign_error = '>'
" let g:ale_sign_warning = '-'

" remove the background color for warnings and errors
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign

" disable highlighting
" let g:ale_set_highlights = 0

" format the echo messages
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_format = '[%linter%] %s'

" navigate between errors
nmap <silent> <C-h> <Plug>(ale_previous_wrap)
nmap <silent> <C-l> <Plug>(ale_next_wrap)

" use the quickfix list instead of the loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
" let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1

" }}}

" CtrlP {{{
" https://github.com/ctrlpvim/ctrlp.vim

" invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" When invoked without an explicit starting directory, CtrlP will set its
" local working directory according to this variable
" let g:ctrlp_working_path_mode = ra

" If none of the default markers (.git .hg .svn .bzr _darcs) are present
" in a project, you can define additional ones
let g:ctrlp_root_markers = ['.gitignore']

" If a file is already open, open it again in a new pane instead of
" switching to the existing pane
let g:ctrlp_switch_buffer = 'et'

" Exclude files and directories using Vim's wildignore and CtrlP's
" own g:ctrlp_custom_ignore. If a custom listing command is being
" used, exclusions are ignored
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$|bower_components|node_modules',
      \ 'file': '\v\.(exe|so|dll)$',
      \ }

" use a custom file listing command
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" ignore files listed in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" }}}

" editorconfig-vim {{{
" https://github.com/editorconfig/editorconfig-vim

" ensure that this plugin works well with Tim Pope's fugitive,
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" }}}

" guifont++.vim {{{
" https://github.com/vim-scripts/guifontpp.vim/blob/master/plugin/guifont%2B%2B.vim

let guifontpp_size_increment=2
let guifontpp_smaller_font_map="<D-->"
let guifontpp_larger_font_map="<D-=>"
" TODO resetting font size doesn't work
" let guifontpp_original_font_map="<D-0>"

" }}}

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

" }}}

" lightline-ale {{{
" https://github.com/maximbaz/lightline-ale
" TODO these settings overwrite fugitive branch naming for some reason

" let g:lightline.component_expand = {
"       \  'linter_checking': 'lightline#ale#checking',
"       \  'linter_warnings': 'lightline#ale#warnings',
"       \  'linter_errors': 'lightline#ale#errors',
"       \  'linter_ok': 'lightline#ale#ok',
"       \ }
" let g:lightline.component_type = {
"       \ 'linter_checking': 'left',
"       \ 'linter_warnings': 'warning',
"       \ 'linter_errors': 'error',
"       \ 'linter_ok': 'left',
"       \ }
" let g:lightline.active = {
"       \ 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]],
"       \ }
"
" " indicator to use when ALE is in progress
" let g:lightline#ale#indicator_checking = "Linting..."
"
" " indicator to use when there are warnings
" let g:lightline#ale#indicator_warnings = "W "
"
" " indicator to use when there are errors
" let g:lightline#ale#indicator_errors = "E "
"
" " indicator to use when there are no warnings or errors
" let g:lightline#ale#indicator_ok = "OK"

" }}}

" NERD Commenter {{{

" toggle comments
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

" add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" }}}

" NERDTree {{{
" https://github.com/scrooloose/nerdtree/blob/master/doc/NERDTree.txt

" toggle NERDTree on/off
nnoremap <F6> :NERDTreeToggle<CR>

" controls whether the NERD tree window centers when the cursor moves
" within a specified distance to the top/bottom of the window
let NERDTreeAutoCenter=0

" tells the NERD tree whether to use natural sort order or not when sorting nodes
let NERDTreeNaturalSort=1

" change the NERDTree root dir
" set autochdir
" let NERDTreeChDirMode=2

" tells the NERD tree which files to ignore
let NERDTreeIgnore=['\.DS_Store$', '\~$']

" tells the NERD tree to respect |'wildignore'|
let NERDTreeRespectWildIgnore=1

" automatically close NerdTree when you open a file
let NERDTreeQuitOnOpen = 1

" show hidden files in NERDTree
let NERDTreeShowHidden=1

" enable line numbers
let NERDTreeShowLineNumbers=1

" change the size of the NERD tree when it is loaded
let NERDTreeWinSize=25

" disable “Press ? for help”
let NERDTreeMinimalUI = 1

" automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1

" change the default arrows
" let NERDTreeDirArrows = 1
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'

augroup NERDTree
  autocmd!
  " make sure relative line numbers are used
  autocmd FileType nerdtree setlocal relativenumber

  " refresh NERDTree when the user doesn't press a key for the time specified with 'updatetime'
  " autocmd CursorHold,CursorHoldI * call NERDTreeFocus() | call g:NERDTree.ForCurrentTab().getRoot().refresh() | call g:NERDTree.ForCurrentTab().render() | wincmd w

  " open a NERDTree automatically when vim starts up if no files were specified
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

  " open NERDTree automatically when vim starts up on opening a directory
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

  " close vim if the only window left open is a NERDTree
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" highlight current buffer in NERDTree when switching buffers
" https://stackoverflow.com/questions/7692233/nerdtree-reveal-file-in-tree
augroup NERDTreeHighlight
  autocmd!
  " check if NERDTree is open or active
  function! IsNERDTreeOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
  endfunction

  " call NERDTreeFind if NERDTree is active, current window contains a modifiable
  " file, and we're not in vimdiff
  function! SyncTree()
    if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
      NERDTreeFind
      wincmd p
    endif
  endfunction

  " highlight current buffer in NERDTree
  autocmd BufEnter * call SyncTree()
augroup END

" }}}

" NERDTree git {{{

" add git status to beginning of file name in tree
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "∙",
      \ "Staged"    : "∙",
      \ "Untracked" : "∙",
      \ "Renamed"   : "∙",
      \ "Unmerged"  : "∙",
      \ "Deleted"   : "∙",
      \ "Dirty"     : "∙",
      \ "Clean"     : "∙",
      \ "Ignored"   : "∙",
      \ "Unknown"   : "∙"
      \ }

" show ignored status
" (a heavy feature may cost much more time)
" let g:NERDTreeShowIgnoredStatus = 1

" }}}

" Syntastic {{{

if has('Syntastic')
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
endif

" }}}

" tabular {{{

" key mappings for common tab alignments
" tabs for lining up "="
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>

" tabs for lining up ":"
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>

" triggers :Tabular whenever a pipe "|" character is inserted
" https://gist.github.com/tpope/287147
inoremap <Silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" }}}

" incsearch {{{
" https://github.com/haya14busa/incsearch.vim

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" }}}

" vim-better-whitespace {{{

" set a custom highlight color
" highlight ExtraWhitespace ctermbg=<desired_color>

" to enable highlighting and stripping whitespace on save by default
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" }}}

" vim-buffergator {{{
" https://github.com/jeetsukumaran/vim-buffergator/blob/master/doc/buffergator.txt

" determines how a new Buffergator window will be opened
let g:buffergator_viewport_split_policy="n"

" don't expand the application screen to accomodate the Buffergator
" window
let g:buffergator_autoexpand_on_split=0

" update the Buffergator window when the buffer list changes
let g:buffergator_autoupdate=1

" sets the default sort by buffer file basename (followed by directory)
let g:buffergator_sort_regime="basename"

" show the relative path of each buffer
let g:buffergator_show_full_directory_path=0

" }}}

" vim-bundler {{{



" }}}

" vim-closetag {{{



" }}}

" vim-dispatch {{{

nnoremap <F9> :Dispatch<CR>

autocmd FileType javascript let b:dispatch = 'yarn test'

" }}}

" vim-easymotion {{{
" https://github.com/easymotion/vim-easymotion

" }}}

" vim-flow {{{
" https://github.com/flowtype/vim-flow

" the quickfix window will not be opened when there are no errors, and will
" be automatically closed when previous errors are cleared
let g:flow#autoclose=1

" jump to errors after typechecking if set to 1
let g:flow#errjmp=1

" }}}

" vim-fugitive {{{
" https://github.com/tpope/vim-fugitive

nmap <Leader>gb :Gblame<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gl :Glog<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gp :Git push<CR>
" TODO set up a key mapping to do a WIP git commit
" nmap <Leader>gwip <something><CR>

" }}}

" vim-gitgutter {{{

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" }}}

" vim-indent-guides {{{

" enable indent guides by default
" let g:indent_guides_enable_on_vim_startup = 1

" set custom indent colors
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" }}}

" vim-javascript {{{

" enables syntax highlighting for JSDocs
" let g:javascript_plugin_jsdoc = 1

" enables some additional syntax highlighting for NGDocs
" requires JSDoc plugin to be enabled as well
" let g:javascript_plugin_ngdoc = 1

" enables syntax highlighting for Flow.
let g:javascript_plugin_flow = 1

" enables code folding for javascript based on our syntax file
augroup javascript_folding
    autocmd!
    autocmd FileType javascript setlocal foldmethod=syntax
augroup END

" customize concealing characters
" let g:javascript_conceal_function                  = "ƒ"
" let g:javascript_conceal_null                      = "ø"
" let g:javascript_conceal_this                      = "@"
" let g:javascript_conceal_return                    = "⇚"
" let g:javascript_conceal_undefined                 = "¿"
" let g:javascript_conceal_NaN                       = "ℕ"
" let g:javascript_conceal_prototype                 = "¶"
" let g:javascript_conceal_static                    = "•"
" let g:javascript_conceal_super                     = "Ω"
" let g:javascript_conceal_arrow_function            = "⇒"
" let g:javascript_conceal_noarg_arrow_function      = "®"
" let g:javascript_conceal_underscore_arrow_function = "®"

" enable JavaScript concealing
" set conceallevel=1

" }}}

" vim-json {{{

" }}}

" vim-jsx {{{

" enable JSX on .jsx files only
" let g:jsx_ext_required = 1

" restrict JSX to files with the pre-v0.12 @jsx React.DOM pragma
" let g:jsx_pragma_required = 1

" }}}

" vim-multiple-cursors {{{

" }}}

" vim-rails {{{

" }}}

" vim-repeat {{{

" }}}

" vim-snipmate {{{

" }}}

" vim-snippets {{{

" }}}

" vim-surround {{{

" }}}

" vim-unimpared {{{



" }}}

