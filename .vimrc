" Load all used plugins
source ~/configurations/.vim/rc_files/user_plugins.vim

" Configure the formatter on save
source ~/configurations/.vim/rc_files/fmt.vim

" Map keys
source ~/configurations/.vim/rc_files/maps.vim

" Add xml functions
source ~/configurations/.vim/rc_files/xml.vim

" Auto_commands
source ~/configurations/.vim/rc_files/auto_commands.vim

" Git settings
source ~/configurations/.vim/rc_files/git.vim

" Spelling settings
source ~/configurations/.vim/rc_files/spell.vim

syntax enable
filetype indent plugin on
filetype plugin on

" Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Search
set hlsearch

" Number
set number
set relativenumber

" Path
set path+=**
set path+=.vim
set wildmenu

" Show commands
set showcmd

" Activate the spell completion
" set complete+=kspell
