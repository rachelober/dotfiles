" vim: foldmethod=marker foldlevel=0 cc=34

" set my font
if has('gui_running')
  set anti enc=utf-8
  set guifont=Source\ Code\ Pro:h14
endif

" Gutter color default is annoying. Make it blend in.
highlight SignColumn guibg=NONE

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c
