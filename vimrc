" vim: foldmethod=marker foldlevel=1 cc=34

" pathogen {{{

call pathogen#infect()

" }}}

" colors {{{

syntax enable
set background=dark
colorscheme solarized

" }}}

" ui config {{{

set cmdheight=1                   " height of the command bar
set colorcolumn=80                " color column 80
set cursorline                    " highlight current line
set errorbells
set guicursor+=a:blinkon0
set guioptions=aAce               " remove the toolbar in MacVim
set guioptions=aigm
set lazyredraw                    " redraw only when we need to
set noshowmode                    " don't show vim mode
set mousemodel=popup
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

" file types {{{

if has("autocmd")
  " Make sure all markdown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  if !exists("g:disable_markdown_autostyle")
    au FileType markdown setlocal wrap linebreak textwidth=72 nolist
  endif

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

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

" don't let me use the arrow keys
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

" move between open buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" move between windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" highlight last inserted text
nnoremap gV `[v`]

" }}}

" leader shortcuts {{{

let mapleader=","                 " leader is comma

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" save session
nnoremap <leader>s :mksession<CR>

" }}}

" key mappings {{{

" save my poor shift key
nmap ; :

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

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" create the directory containing the file in the buffer
nmap <silent> <leader>mkdir :!mkdir -p %:p:h<CR>

" helpers for edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

if has("gui_macvim") && has("gui_running")
  " MacVim shift+arrow-keys behavior (required in .vimrc)
  let macvim_hig_shift_movement=1

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

" git {{{

" style my git commit
autocmd Filetype gitcommit setlocal spell textwidth=64

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

" Ack.vim {{{
" https://github.com/mileszs/ack.vim

" Ack requires ack command
if executable("ack")
  " use default config
elseif executable("ack-grep")
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
elseif executable("ag")
  let g:ackprg="ag --nocolor --nogroup --column"
endif

if has("gui_macvim") && has("gui_running")
  " Command-shift-F on OSX
  map <D-F> :Ack<Space>
endif

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

" guifont++.vim {{{
" https://github.com/vim-scripts/guifontpp.vim/blob/master/plugin/guifont%2B%2B.vim

let guifontpp_size_increment=2
let guifontpp_smaller_font_map="<D-->"
let guifontpp_larger_font_map="<D-=>"
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

" NERDCommenter {{{

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

" Toggle comments
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

" }}}

" NERDtree {{{

" toggle NERDTree on/off
nnoremap <F6> :NERDTreeToggle<CR>

" change the NERDTree root dir
set autochdir
let NERDTreeChDirMode=2

" enable line numbers
let NERDTreeShowLineNumbers=1

" open NERDTree automatically when vim starts up
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.DS_Store$']

" refresh NERDTree whenever it gets focus
autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p

" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

augroup AuNERDTreeCmd
autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction

" }}}

" NERDTree git {{{

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
    \ "Ignored"   : "☒",
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

" Tabular {{{

" key mappings for common tab alignments
if exists(":Tabularize")
  nmap <Leader>t= :Tabularize /=<CR>
  vmap <Leader>t= :Tabularize /=<CR>
  nmap <Leader>t: :Tabularize /:\zs<CR>
  vmap <Leader>t: :Tabularize /:\zs<CR>
endif

" triggers :Tabular whenever a pipe "|" character is inserted
" https://gist.github.com/tpope/287147
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

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


" buffergator {{{



" }}}

" bundler {{{



" }}}

" dispatch {{{



" }}}

" easymotion {{{



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

nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>
" nmap <leader>gwip <something><CR>

" }}}
" vim-git

" GitGutter {{{

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" }}}

" vim-indent-guides {{{

" enable indent guides by default
let g:indent_guides_enable_on_vim_startup = 1

" set custom indent colors
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" }}}

" vim-javascript {{{

" enables syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1

" enables some additional syntax highlighting for NGDocs
" requires JSDoc plugin to be enabled as well
let g:javascript_plugin_ngdoc = 1

" enables syntax highlighting for Flow.
let g:javascript_plugin_flow = 1

" customize concealing characters
let g:javascript_conceal_function                  = "ƒ"
let g:javascript_conceal_null                      = "ø"
let g:javascript_conceal_this                      = "@"
let g:javascript_conceal_return                    = "⇚"
let g:javascript_conceal_undefined                 = "¿"
let g:javascript_conceal_NaN                       = "ℕ"
let g:javascript_conceal_prototype                 = "¶"
let g:javascript_conceal_static                    = "•"
let g:javascript_conceal_super                     = "Ω"
let g:javascript_conceal_arrow_function            = "⇒"
let g:javascript_conceal_noarg_arrow_function      = "®"
let g:javascript_conceal_underscore_arrow_function = "®"

" }}}

" vim-json {{{

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

