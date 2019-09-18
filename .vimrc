
" use :botright split or :bo sp, it does what you want

set nocompatible              " be iMproved, required
"filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'pbondoer/vim-42header'
" Plugin 'majutsushi/tagbar'
Plugin 'morhetz/gruvbox'
Plugin 'sheerun/vim-polyglot'
" Plugin 'vim-airline/vim-airline'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-function'
Plugin 'tkhren/vim-textobj-numeral'
Plugin 'vim-scripts/ReplaceWithRegister'
" Plugin 'kien/ctrlp.vim'
" Plugin 'scrooloose/nerdtree'
" Plugin 'easymotion/vim-easymotion'
" Plugin 'vim-syntastic/syntastic'
" Plugin 'ycm-core/YouCompleteMe'
" Plugin 'gilligan/vim-lldb'
" Plugin 'mhinz/vim-startify'
" pour git
" Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
""Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
""Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
""Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
""Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"nerdtree toggle
" map <C-n> :NERDTreeToggle<CR>

"ctags toggle
set tags=tags
nmap <F8> :TagbarToggle<CR>

"colosheme
colorscheme gruvbox
set background=dark    " Setting dark mode
"set background=light   " Setting light mode
let g:gruvbox_contrast_dark='soft'



"sessins comand
":SLoad    load a session
":SSave    save a session
":SDelete  delete a session
":SClose   close current session
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"probleme de config avec le nouveau vim
let g:loaded_matchparen=1

"yank into clipboard os
set clipboard=unnamed

"jj for echap
" :imap jj <Esc>
:imap jk <Esc>

"put synthasic color
syntax on
syntax enable

"relative line number and current line
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END



"moving split
nnoremap <C-W>, <C-W><
nnoremap <C-W>. <C-W>>




"macro avec ,
", main
nnoremap ,main :read /Users/jchardin/.vim/main.c <CR>
nnoremap ,printf :read /Users/jchardin/.vim/printf.c <CR>


"show white space
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/


"tmux send-keys -t 0 \"make\" C-m
nmap ,f k:wa<CR>:!tmux send-keys -t 2 "pkill -9 doom" C-m<CR><CR>k
nmap ,g :!tmux send-keys -t left "clear && make && ./doom" C-m<CR><CR><CR>k


noremap ,s :!tmux send-keys -t right "clear & clear & git status"  C-m <CR> <CR> k
noremap ,a :!tmux send-keys -t right "clear & clear & git add -A"  C-m <CR> <CR> k
noremap ,c :!tmux send-keys -t right "git commit -am "ok"  "  C-m <CR> <CR> k
noremap ,p :!tmux send-keys -t right "git push"  C-m <CR> <CR> k

"noremap ,f :w<CR>

map <F6> :!tmux send-keys -t right "make exe" C-m <CR> <CR> k


"met un | s=pour les tabs attention metre un espace a la fin
:set list lcs=tab:\|\ 


"set tab for indentation
:set noexpandtab
:set copyindent
:set preserveindent
:set softtabstop=0
:set shiftwidth=4
:set tabstop=4

:set nopaste




"############################Configuration
"set line at 80
set colorcolumn=80
" more powerful backspacing
set backspace=indent,eol,start
"to highlight word when searching
:set hlsearch
"folding code  zc to fold zo to unfold
set foldmethod=syntax
set foldlevelstart=99
"disable auto comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"generate Ctag each time I save
autocmd BufWritePost *.c call system("ctags -R ./src/jeronemo ./includes")
autocmd BufWritePost *.h call system("ctags -R ./includes")
"line under current line
:set cursorline
"to remove omnicompletion scratch window
set completeopt-=preview
"hightlight the current match
nnoremap * *N
"regle un probleme
autocmd BufRead scp://* :set bt=acwrite
"matching bracket
runtime macros/matchit.vim


"################################Ssnipet
"get out of bracket
imap bb <esc>l%%a
imap ,b <esc>f"a
"pour sortire des parenthese  ctr o permet de rnetrer normal mode pour une commande
inoremap <S-Tab> <C-o>A
"tag jumping back
nnoremap <Left>e <C-e>
"remap left arrow to control for common usage
nnoremap <Left>x <C-x>
"increment
nnoremap <Left>a <C-a>
"decrment
noremap <Left>t <C-t>
"brackeet
:inoremap "" ""<esc>i
:inoremap (( ()<esc>i
:inoremap '' ''<esc>i
:inoremap [[ []<esc>i
:inoremap ,( ();<esc>h
"add space in normal mode
:nnoremap <space> i<space><esc>
"yank until end of the line
:nnoremap Y y$
:imap {{ {<cr>}<esc>ko
"automatic save when ctrl t ctag back
:nnoremap <C-t> :w<CR><C-t>zz
:nnoremap <C-]> :w<CR><C-]>zz
"remove hightlight
nnoremap ,<space> :noh<cr>


cnoremap w silent!w
cnoremap wa silent!wa








"underscrore a s key boundary
:set iskeyword-=_




