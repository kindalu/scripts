set nocompatible
set number
set cindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set showmatch
set incsearch
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,utf-16,big5,cp950,cp936,gb18030,euc-jp,euc-kr,latin1
set hlsearch
set backspace=indent,eol,start
set listchars=tab:>-,trail:~
set list
colorscheme torte
syntax on

" status line
set laststatus=2
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ %P

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

" Space will toggle folds!
nnoremap <space> za

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz
