#!/bin/bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
touch ~/.vimrc
cat > ~/.vimrc <<EOF
"This is the annotation

"Set the Row Number
"set number
set termencoding=utf-8

"set hlsearch
"set incsearch

set ts=4
set softtabstop=4
"set shiftwidth=4
"set expandtab

set autoindent

"Set the Map
let mapleader=","
inoremap <leader>w <Esc>:w<cr>
inoremap jj <Esc>
vnoremap jj <Esc>

"This is the plug: vim-plug
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
"Plug 'Yggdroot/indentLine'
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
"Plug 'yyzybb/cppenv'
"Plug 'xavierd/clang_complete'
"Plug 'suxpert/vimcaps'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
call plug#end()

"Set the Map in Plug
nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>
let g:ctrlp_map = '<c-p>'

nmap ss <Plug>(easymotion-s2)
" python-mode
"
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_rope_goto_definition_bind = '<C-]>'
let g:pymode_lint = 1 
"
"
" g++-mode
"
"let g:clang_library_path='/usr/lib/llvm-3.8/lib'
 "" or path directly to the library file
"let g:clang_library_path='/usr/lib64/libclang.so.3.8'
EOF
