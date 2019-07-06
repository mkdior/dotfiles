
let mapleader =" "

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
call plug#end()


" Basic config:
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	map <F6> :setlocal spell! spelllang=en_us<CR>
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
" General QOL mappings:
"	inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
" Markdown QOL mappings:
	autocmd FileType md inoremap ;i __<Space><++><Esc>F_i
	autocmd FileType md inoremap ;I byedwi<Space>__<Space><++><Esc>F_Pi
	autocmd FileType md inoremap ;b ****<Space><++><Esc>F*hi
	autocmd FileType md inoremap ;B byedwi****<Space><++><Space>F*hPi
" Ultisnips settings:
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
