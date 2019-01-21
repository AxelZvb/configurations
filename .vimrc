syntax on
filetype indent plugin on
set spell spelllang:en_us
hi clear SpellBad
hi SpellBad cterm=underline
map <F7> :tabp<CR>
map <F8> :tabn<CR>
au FileType gitcommit
 \ hi gitcommitSummary ctermfg=yellow ctermbg=red
