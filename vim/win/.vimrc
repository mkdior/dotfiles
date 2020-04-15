let mapleader =" "

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'vim-scripts/loremipsum'
Plug 'rust-lang/rust.vim'
Plug 'wadackel/vim-dogrun'
Plug 'andreasvc/vim-256noir'
Plug 'owickstrom/vim-colors-paramount'
call plug#end()

" Basic config:
  set backspace=indent,eol,start
  set guifont=UD_Digi_Kyokasho_N-R:h9:cSHIFTJIS:qDRAFT
	set nocompatible
	filetype plugin on
	syntax on
	set number relativenumber
	map <leader>s :setlocal spell! spelllang=en_us<CR>
  map <leader>p :echom expand('%')<CR>
  colorscheme mouse 
" Config file shortcuts:
  map <leader>v :vsp /Users/Meuko/.vimrc<CR>
" Goyo settings:
	map <leader>g :Goyo <bar> hi EndOfBuffer guifg=bg<CR>
" General QOL mappings:
	map <leader><leader> <Esc>/<++><Enter>"_c4l
	map <leader>o :setlocal spell! spelllang=en_us<CR>
	map <leader>v :sp<space>~/.vimrc<CR>
" LaTeX QOL mappings:
" The compile command expects you to have a LaTeX folder in ../ for all the
" generated files. If one doesn't exist, it creates one for you.
	autocmd FileType tex nmap <buffer> <C-p> :w<CR>:!mkdir -p ../LaTeX && xelatex -output-directory=../LaTeX/ %<CR><CR>
	autocmd FileType tex nmap <buffer> <C-a> :!zathura %:p/../LaTeX/%:r.pdf & disown<CR><CR>
  set encoding=utf-8
  set fileencoding=utf-8
" Rust QOL mappings:
"
" Disable arrow keys:
	map <up> <nop>
	map <down> <nop>
	map <left> <nop>
	map <right> <nop>	
	imap <up> <nop>
	imap <down> <nop>
	imap <left> <nop>
	imap <right> <nop>
" Tab settings for documents
	" On pressing tab, insert 2 spaces
	set expandtab
	" show existing tab with 2 spaces width
	set tabstop=2
	set softtabstop=2
	" when indenting with '>', use 2 spaces width
	set shiftwidth=2

" :Loremipsum[!] [WORDCOUNT] [PARAGRAPH_TEMPLATE] [PREFIX POSTFIX]
" makeindex test.nlo -s nomencl.ist -o test.nls >> Building Nomenclature list
  set wmh=0
  nmap <silent> <A-w> :wincmd k<CR>
  nmap <silent> <A-s> :wincmd j<CR>
  nmap <silent> <A-a> :wincmd h<CR>
  nmap <silent> <A-d> :wincmd l<CR>

  " Cheat - Sheet :D
  " :%s/foo/bar/gc  -> Substitute foo with bar / global and confirm
  " Remove % to search and replace just the current line.

  " Set clipboard to +mode, which allows us to yank to systemCC
  set clipboard =unnamedplus

  " Change the color of the status bar on inactive window
  highlight StatusLineNC cterm=bold ctermfg=black ctermbg=black

  " Map split navigation to just CTRL h/j/k/l
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H> 

  " Nerd Comments settings:
  " Use compact syntax for prettified multi-line comments
  filetype plugin on
  "Rust settings
  autocmd FileType rust map <leader>r :Crun<cr> 
  autocmd FileType rust map <leader>b :Cbuild<cr>  
  autocmd FileType rust map <leader>c :Ccheck<cr> 
