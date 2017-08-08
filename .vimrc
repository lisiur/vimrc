let mapleader=" "

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" MY-OWN-PLUGINS
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'Lokaltog/vim-powerline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-commentary'
Plugin 'posva/vim-vue'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'mattn/emmet-vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tpope/vim-surround'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'ervandew/ag'
Plugin 'tmhedberg/matchit'
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" MY-OWN-CONFIG
syntax on
set number
set encoding=utf-8
" set clipboard=unnamed
set backspace=2
set hls
set incsearch
set spell
let NERDTreeIgnore=['\.pyc$', '\~$'] " ignore files in NERDTree
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
set hidden
set showtabline=0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_root_markers = ['package.json']

" Syntastic ------------------------------
nmap <leader>e :Errors<CR>
nmap <leader>n :lnext<CR>
nmap <leader>p :lprevious<CR>
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_signs = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" quick command in insert mode
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>o
inoremap SS <Esc>S
inoremap CC <Esc>C

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" insert new line with staying with normal mode
nnoremap <CR> o<Esc>
nnoremap <S-CR> o<Esc>k

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
" nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" Force the cursor onto a new line after 80 characters
set textwidth=80
" In Git commit messages, make it 72 characters
autocmd FileType gitcommit set textwidth=72
" Colour the 73rd column so that we don’t type over our limit
set colorcolumn=+1
" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51

" toggle number / relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set rnu
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
" autocmd FocusLost * :set nornu
" autocmd FocusGained * :set rnu
" autocmd InsertEnter * :set nornu
" autocmd InsertLeave * :set rnu

nnoremap <silent><leader>p :CtrlSpace<CR>

" NERDTree
nnoremap <space>t :NERDTreeMirrorToggle<CR>
map <F2> :NERDTreeMirrorToggle<CR>
" NERDTree GIT
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" ACK
let g:ackprg = 'ag --nogroup --nocolor --column'

" checker
let g:syntastic_javascript_checkers=['eslint']
set errorbells 

" On Pressing tab, insert spaces
set expandtab
au BufNewFile,BufRead *.py 
			\  set tabstop=4 
			\| set softtabstop=4 
			\| set shiftwidth=4 
au BufNewFile,BufRead *.js 
			\  set tabstop=2 
			\| set softtabstop=2 
			\| set shiftwidth=2
au BufNewFile,BufRead *.vue
			\  set tabstop=2 
			\| set softtabstop=2 
			\| set shiftwidth=2
au BufNewFile,BufRead *.rb 
			\  set tabstop=2 
			\| set softtabstop=2 
			\| set shiftwidth=2
au BufNewFile,BufRead *.html
			\  set tabstop=2 
			\| set softtabstop=2 
			\| set shiftwidth=2
