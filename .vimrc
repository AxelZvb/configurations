set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" ********************************* PLUGINS ****************************

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ********** CODE-FMT  **********
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'
" ********** CODE-FMT  **********


""" ********************************* PLUGINS **************************** """

" All of your Plugins must be added before the following line
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

" ********** CODE-FMT  **********
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END
" ********** CODE-FMT  **********

syntax on
filetype indent plugin on
set spell spelllang:en_us
hi clear SpellBad
hi SpellBad cterm=underline
map <F7> :tabp<CR>
map <F8> :tabn<CR>

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

"command QWC execute :s/\%V\(.*\)\%V/"\1",/

nnoremap <Leader>: 0Di"<C-r>"",<Esc>
nnoremap <Leader>; 0Di'<C-r>"',<Esc>
nnoremap <Leader>" 0Di"<C-r>""<Esc>
nnoremap <Leader>' 0Di'<C-r>"'<Esc>
nnoremap <C>" ciw"<C-r>""<Esc>
nnoremap <C>' ciw'<C-r>"'<Esc>


au FileType gitcommit
 \ hi gitcommitSummary ctermfg=yellow ctermbg=red
