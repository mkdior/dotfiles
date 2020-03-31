let mapleader =" "

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'vim-scripts/loremipsum'
Plug 'rust-lang/rust.vim'
call plug#end()

" Basic config:
	set nocompatible
	filetype plugin on
	syntax on
	set number relativenumber
	map <leader>s :setlocal spell! spelllang=en_us<CR>
" Goyo settings:
	map <leader>g :Goyo <bar> highlight StatusLineNC ctermfg=white<CR>
" General QOL mappings:
	map <leader><leader> <Esc>/<++><Enter>"_c4l
	map <leader>o :setlocal spell! spelllang=en_us<CR>
	map <leader>b :sp<space>~/Documents/Notes/Bib/uni.bib<CR>
	map <leader>v :sp<space>~/.vimrc<CR>
  map <leader>a :sp<space>~/.config/aliasrc<CR>
" LaTeX QOL mappings:
"
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
" Mappings for compiling Latex file
	autocmd FileType tex nmap <buffer> <C-p> :w<CR>:!xelatex %<CR><CR>
	autocmd FileType tex nmap <buffer> <C-a> :!zathura %:r.pdf & disown<CR><CR>
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

  nnoremap <A-j> :m .+1<CR>==
  nnoremap <A-k> :m .-2<CR>==
  inoremap <A-j> <Esc>:m .+1<CR>==gi
  inoremap <A-k> <Esc>:m .-2<CR>==gi
  vnoremap <A-j> :m '>+1<CR>gv=gv
  vnoremap <A-k> :m '<-2<CR>gv=gv


  " Cheat - Sheet :D
  " :%s/foo/bar/gc  -> Substitute foo with bar / global and confirm
  " Remove % to search and replace just the current line.

  " Move .swp files to their own directory
  :set dir=/Users/meuko/.config/swaps

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
  let g:NERDCompactSexyComs = 1
  filetype plugin on
