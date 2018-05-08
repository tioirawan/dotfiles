" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Show number
" set number
" Set mouse
set mouse=a
" Sets how many lines of history VIM has to remember
set history=500
" Set to auto read when a file is changed from the outside
set autoread
"Always show current position
set ruler
" A buffer becomes hidden when it is abandoned
set hid
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Don't redraw while executing macros (good performance config)
set lazyredraw 
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2
" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

syntax on

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugin list


Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'dracula/vim'
Plugin 'joshdick/onedark.vim'
Plugin 'posva/vim-vue'

" end of  plugin list


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
" " Put your non-Plugin stuff after this line

" vim-javascript settings
" enable jsDoc syntax highlight
let g:javascript_plugin_jsdoc=1

let g:onedark_terminal_italics=1
let g:airline_theme='onedark'

colorscheme onedark

" nerd tree settings
" Ctrl - n to toogle nerd tree
nmap <C-n> :NERDTreeToggle<CR>
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" press insert before paste
set pastetoggle=<Insert>

