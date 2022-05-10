call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wesQ3/vim-windowswap',
Plug 'itchyny/lightline.vim'
Plug 'vifm/vifm.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" Basic config:
	set nocompatible
  set backspace=indent,eol,start
  let mapleader =" "
	set path+=**
	syntax on

" Search settings
  set ignorecase
  set smartcase
  set incsearch  " Incremental search
  set hlsearch   " Highlight search
  set showmatch  " Show matching braces

" Tabs
	set autoindent
	set smartindent
	set tabstop=2
	set softtabstop=2
	set shiftwidth=2

" Language
	map <leader>s :setlocal spell! spelllang=en_us<CR>

" General coms
  com! FormatJSON %!python3 -m json.tool

" Goyo settings:
	map <leader>g :Goyo <CR>

" General QOL mappings:
  map <leader>m i<++><Esc>A
	map <leader><leader> <Esc>/<++><Enter>"_c4l
  map <leader>[ :tabp<CR>
  map <leader>] :tabn<CR>
  map <leader>rg :Rg<CR>

" Autmatic FT setting
	autocmd BufEnter * if &filetype == "" | setlocal ft=sh | endif

  set wmh=0
  nmap <silent> <A-w> :wincmd k<CR>
  nmap <silent> <A-s> :wincmd j<CR>
  nmap <silent> <A-a> :wincmd h<CR>
  nmap <silent> <A-d> :wincmd l<CR>

" Move .swp files to their own directory
  set dir=~/.config/vim/swaps

" Set clipboard to +mode, which allows us to yank to systemCC
  set clipboard=unnamed

" Colorscheme
	colorscheme preto

" Change highlighting of cursor line when entering/leaving Insert Mode
	set cursorline
	highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
	autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
	autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212

  " Map split navigation to just CTRL h/j/k/l
  nnoremap <C-j> <C-W><C-J>
  nnoremap <C-k> <C-W><C-K>
  nnoremap <C-l> <C-W><C-L>
  nnoremap <C-h> <C-W><C-H> 

	" Save all our folds
  augroup AutoSaveGroup
		autocmd!
		autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
		autocmd BufWinEnter ?* silent! loadview
  augroup end

  set viewoptions=folds,cursor
  set sessionoptions=folds
	
	" Coc settings
	" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
	" delays and poor user experience.
	set updatetime=300

	" Use tab for trigger completion with characters ahead and navigate.
	" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
	" other plugin before putting this into your config.
	inoremap <silent><expr> <TAB>
				\ pumvisible() ? "\<C-n>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	augroup mygroup
		autocmd!
		" Setup formatexpr specified filetype(s).
		autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
		" Update signature help on jump placeholder.
		autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
	inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
		\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Go settings
"	let g:go_highlight_structs = 1 
"	let g:go_highlight_methods = 1
"	let g:go_highlight_functions = 1
"	let g:go_highlight_operators = 1
"	let g:go_highlight_build_constraints = 1
"	let g:go_fmt_command = "gofmt"

" Go hotfixes
" @- To prevent fold magic
	let g:go_fmt_experimental = 1

" Lightline
	set noshowmode
	set laststatus=2
	let g:lightline = {
      \ 'colorscheme': 'hamza',
      \ }

" Vifm
	nmap <Leader>vv :Vifm<CR>
	nmap <Leader>vs :VsplitVifm<CR>
	nmap <Leader>hs :SplitVifm<CR>
	nmap <Leader>dv :DiffVifm<CR>
	nmap <Leader>tv :TabVifm<CR>

" Turn relative line numbers on
	set number                     " Show current line number
	set relativenumber             " Show relative line numbers


" Tab settings
	set tabpagemax=30
	nmap <Leader>tl :tabm -1<CR>
	nmap <Leader>tr :tabm +1<CR>

" Vifm settings
	let g:vifm_replace_netrw_cmd = "Vifm"
	let g:vifm_embed_split = 1

" Disable netrw in favor of vifm
	let g:loaded_netrw = 1 
	let g:loaded_netrwPlugin = 1

" Fzf in vim
	set rtp+=/usr/local/opt/fzf

" RG for tabs -- https://bit.ly/36ihq77
	augroup quickfix_tab | au!
				au filetype qf nnoremap <buffer> <C-t> <C-w><CR><C-w>T
	augroup END

" CoC
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> <Leader>r <Plug>(coc-references)
	nmap <silent> <Leader>f <Plug>(coc-fix-current)

	command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
	autocmd BufWritePre *.go silent! :OR

	nmap <silent> <Leader>j :call CocAction('diagnosticNext')<cr>
	nmap <silent> <Leader>k :call CocAction('diagnosticPrevious')<cr>
