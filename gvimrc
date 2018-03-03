" vim: foldmethod=marker foldlevel=0 cc=34

" set my font
if has('gui_running')
  set guifont=Source\ Code\ Pro:h12
endif

" Gutter color default is annoying. Make it blend in.
highlight SignColumn guibg=NONE

set guicursor+=a:blinkon0
set guioptions=aigm
set mousemodel=popup
set scrolloff=6
set sidescrolloff=6
set visualbell
set errorbells
set cursorline

