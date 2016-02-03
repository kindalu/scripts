set nocompatible


" --- set up Vundle ---
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Making Vim look good
Plugin 'tomasr/molokai'
Plugin 'reewr/vim-monokai-phoenix'
Plugin 'jaromero/vim-monokai-refined'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Vim as a programmer's text editor
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'HTML-AutoCloseTag'
Plugin 'airblade/vim-gitgutter'
Bundle 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'

call vundle#end()

filetype plugin indent on


" --- General Setting ---
set cindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set showmatch
set ruler
set showcmd
set incsearch
set hlsearch
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,utf-16,big5,cp950,cp936,gb18030,euc-jp,euc-kr,latin1
set backspace=indent,eol,start
set listchars=tab:>-,trail:~
set list
set regexpengine=1
set mouse=a

set t_Co=256
colorscheme monokai-phoenix
syntax on
set guifont=Source\ Code\ Pro
set background=dark
set laststatus=2
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ %P


" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

map K 10k
map J 10j

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

" Space will toggle folds!
nnoremap <space> za
vnoremap <space> zf
set foldmethod=indent
set foldlevelstart=20

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz


" ====== Plugins Setting ======
" --- vim-airline ---
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#branch#enabled = 1


" --- jistr/vim-nerdtree-tabs ---
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0


" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
let g:syntastic_javascript_checkers = ['eslint']
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END


" --- CtrlP ---
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" --- YouCompleteMe ---
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

