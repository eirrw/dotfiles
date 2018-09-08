set nocompatible              " be iMproved, required

" Install vim-plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/bundle')
" Manage vim-plug
Plug 'junegunn/vim-plug'

" plugin on GitHub repo
Plug 'tpope/vim-fugitive'

Plug 'kien/ctrlp.vim'

Plug 'scrooloose/nerdtree'

Plug 'Raimondi/delimitMate'

Plug 'mhinz/vim-startify'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'flazz/vim-colorschemes'

Plug 'crusoexia/vim-monokai'

Plug 'vim-scripts/L9'

" Plugin 'Valloric/YouCompleteMe'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call plug#end()            " required

" ############################################
" SET COMMANDS

" Allow non-visible buffers
set hidden

" Activate mouse functionality
set mouse=a

" show number lines
set number

" do not store global and local values in a session
" set ssop-=options
" do not store folds
" set ssop-=folds

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" colorscheme
syntax enable
set termguicolors
colorscheme monokai

let g:airline_powerline_fonts = 1

" ############################################
" KEYMAPS

map <C-n> :NERDTreeToggle<CR>
