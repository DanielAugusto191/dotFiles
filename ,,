
" Config
set mouse=a tabstop=4 shiftwidth=4 smarttab autoindent smartindent cindent showcmd number encoding=utf8 t_Co=256 noswapfile

" Keys
inoremap ' ''<ESC>ha
inoremap " ""<ESC>ha
inoremap ( ()<ESC>ha
inoremap [ []<ESC>ha
inoremap { {}<ESC>ha

inoremap <A-j> <ESC>:m .+1
inoremap <C-s> <ESC>:w

" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" Themes
syntax enable
colorscheme molokai
hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none
" Plugins

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/syntastic'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Vundle.vim'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'

call vundle#end()

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
