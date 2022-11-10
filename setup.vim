syntax on
set clipboard=unnamed
set rnu
set nu
set autoindent
set noeb vb t_vb=
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start    
set belloff=esc
set belloff=all
set autochdir
set complete-=w,b,u,t
set completeopt+=menuone,noselect,noinsert " don't insert text automatically
set pumheight=5 " keep the autocomplete suggestion menu small
set shortmess+=c " don't give ins-completion-menu messages

" Open terminal in current working directory "
map <F6> :let $VIM_DIR=expand('%:p:h')<CR>:vert terminal<CR>cd $VIM_DIR<CR>
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'makerj/vim-pdf'
Plug 'chriskempson/base16-vim'
Plug 'vim-scripts/AutoComplPop'
call plug#end()

"set the color schemes"
set termguicolors
"colorscheme gruvbox
colorscheme base16-default-dark
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") 
      \ && b:NERDTree.isTabTree()) | q | endif

" Open terminal on right "
nnoremap <F5> :wa \| vertical botright term ++kill=term<CR>

" Switch buffers "
noremap <F1> :winc w<CR>
" Automatically compile and run a C file "
noremap <F11> :w <CR> :!cls <CR> :!gcc -o a % && a <CR>

" Automatically compile and run a C++ file "
noremap <F12> :w <CR> :!cls <CR> :!g++ -o a % && a <CR>

"compile"
noremap <F9> :!javac % <CR>
"run"
noremap<F10> :!java -cp %:p:h %:t:r <CR>
"shortcut to here"
noremap <F3> :edit $HOME\\_vimrc <CR>
" get nerdtree back (for autocompletion "
noremap <F2> :NERDTree <CR>
" Ignore the unreadable Windows files that can't be loaded "
let NERDTreeIgnore=['\c^ntuser\..*']
