"config for vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')

 " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'pbondoer/vim-42header'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-startify'
 " The following are examples of different formats supported.
 " Keep Plugin commands between vundle#begin/end.
 " plugin on GitHub repo
 " plugin from http://vim-scripts.org/vim/scripts.html
 " Plugin 'L9'
 " Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
 " git repos on your local machine (i.e. when working on your own plugin)
"""" Plugin 'file:///home/gmarik/path/to/plugin'
 " The sparkup vim script is in a subdirectory of this repo called vim.
 " Pass the path to set the runtimepath properly.
 Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
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
 " :PluginInstall    - installs plugins; append `!` to update or just
"""" :PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " :PluginClean      - confirms removal of unused plugins; append `!` to  auto-approve removal

 "
 " see :h vundle for more details or wiki for FAQ
 " Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"config for airline""""""""""""""""""""""""""
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

"get the 
"let g:airline_powerline_fonts = 1

"let g:airline_theme='powerlineish'

"colorscheme blackboard
"colorscheme herald
colorscheme gruvbox
set background=dark    " Setting dark mode
let g:gruvbox_contrast_dark= 'hard'

"config pour la bar pour les tabs
set tabstop=4
set shiftwidth=4
set expandtab
:set list lcs=tab:\|\


"jj for echap
:imap jj <Esc>

"put synthasic color
syntax on

"disable auto comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"relative line number and current line
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END


"nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

" more powerful backspacing
set backspace=indent,eol,start

"line under current line
:set cursorline

"yank into clipboard os
set clipboard=unnamed

syntax enable

"new tab
map <S-t> :tabnew<CR>

"set tab for indentation
:set noexpandtab
:set copyindent
:set preserveindent
:set softtabstop=0
:set shiftwidth=4
:set tabstop=4


"tmux send-keys -t 0 \"make\" C-m
map <F5> :!tmux send-keys -t right "make" C-m <CR> <CR> k
map <F6> :!tmux send-keys -t right "make exe" C-m <CR> <CR> k

"to remove bizare color sur les indent
:highlight SpecialKey ctermbg=NONE guibg=NONE


"add newline in normal mode and stay innormal mode
nnoremap m o <ESC>
nnoremap <S-m> O <ESC> k  :le <CR>


"ctags to start the plugin tagbar
set tags=tags
nmap <F8> :TagbarToggle<CR>


"folding code
"set foldmethod=syntax

"set line at 80
set colorcolumn=80


"to highlight word when searching
:set hlsearch
"?plusdelamerdepour erreter


"We can use different key mappings for easy navigation between splits to save a keystroke. So instead of ctrl-w then j, it’s just ctrl-j:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Commenting blocks of code.
map <C-C> :s:^:\/\/<CR> /laksjfjaj <CR> :w <CR>
map <C-U> :s:^\/\/<CR> /laksjfjaj <CR> :w <CR>


NoMatchParen
:set noshowmatch
let g:loaded_matchparen=1



"keep cursor on middle
set scrolloff=20
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




"sessins comand
":SLoad    load a session
":SSave    save a session
":SDelete  delete a session
":SClose   close current session




