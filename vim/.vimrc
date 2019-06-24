
let mapleader =" "

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'tpope/vim-surround'
call plug#end()


" Basic config:
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disable \n autocomment:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Auto reload config:
	augroup myvimrchooks
	au!
	autocmd bufwritepost .vimrc source ~/.vimrc
	augroup END
" Goyo settings:
	map <leader>g :Goyo <bar> highlight StatusLineNC ctermfg=white<CR>
" Search down into subfolders:
	set path+=**
"	set wildignore+=**/folder_name/**
" Surround settings:
	
" Display all matching files with tab:
	set wildmenu
