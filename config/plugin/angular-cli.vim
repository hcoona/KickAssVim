" The plugin is compatible with Tim Pope's vim-dispatch, by adding this to your .vimrc:
let g:angular_cli_use_dispatch = 1
" Initialize the plugin on vimenter
autocmd VimEnter * if globpath('.,..','node_modules/@angular') != '' | call angular_cli#init() | endif
