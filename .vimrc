set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'pbondoer/vim-42header'
Plugin 'majutsushi/tagbar'
"Plugin 'mhinz/vim-startify'
Plugin 'morhetz/gruvbox'
Plugin 'sheerun/vim-polyglot'
"Plugin 'kien/ctrlp.vim'
"Plugin 'gilligan/vim-lldb'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/ReplaceWithRegister'

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
map <C-n> :NERDTreeToggle<CR>

"ctags toggle
set tags=tags
nmap <F8> :TagbarToggle<CR>

"colosheme
colorscheme gruvbox
set background=dark    " Setting dark mode
"set background=light   " Setting light mode
let g:gruvbox_contrast_dark='hard'

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
:imap jj <Esc>
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


"line under current line
:set cursorline


"We can use different key mappings for easy navigation between splits to save a keystroke. So instead of ctrl-w then j, it’s just ctrl-j:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"moving split
nnoremap <C-W>, <C-W><
nnoremap <C-W>. <C-W>>


"keep cursor on middle
set scrolloff=25
if !exists('*VCenterCursor')
  augroup VCenterCursor
  au!
  au OptionSet *,*.*
    \ if and( expand("<amatch>")=='scrolloff' ,
    \         exists('#VCenterCursor#WinEnter,WinNew,VimResized') )|
    \   au! VCenterCursor WinEnter,WinNew,VimResized|
    \ endif
  augroup END
  function VCenterCursor()
    if !exists('#VCenterCursor#WinEnter,WinNew,VimResized')
      let s:default_scrolloff=&scrolloff
      let &scrolloff=winheight(win_getid())/2
      au VCenterCursor WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
    else
      au! VCenterCursor WinEnter,WinNew,VimResized
      let &scrolloff=s:default_scrolloff
    endif
  endfunction
endif

nnoremap <leader>zz :call VCenterCursor()<CR>



"macro avec ,
", main
nnoremap ,main :read /Users/jchardin/.vim/main.c <CR>


"show white space
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/


"tmux send-keys -t 0 \"make\" C-m
map <F5> :!tmux send-keys -t right "make" C-m <CR> <CR> k
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

" Commenting blocks of code.
map <C-C> :s:^:\/\/<CR> /laksjfjaj <CR> :w <CR>
map <C-U> :s:^\/\/<CR> /laksjfjaj <CR> :w <CR>


"disable auto comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


"set line at 80
set colorcolumn=80


" more powerful backspacing
set backspace=indent,eol,start


"to highlight word when searching
:set hlsearch



"folding code  zc to fold zo to unfold
set foldmethod=syntax
set foldlevelstart=99


"to remove bizare color sur les indent
":highlight SpecialKey ctermbg=NONE guibg=NONE

"add newline in normal mode and stay innormal mode
"nnoremap m o <ESC>
"nnoremap <S-m> O <ESC> k  :le <CR>


"NoMatchParen
":set noshowmatch


"generate Ctag each time I save
autocmd BufWritePost *.c call system("ctags -R .")
autocmd BufWritePost *.h   call system("ctags -R .")


"add space in normal mode
:nnoremap <space> i<space><esc>


