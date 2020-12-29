" these 2 are required for plugin manager
set nocompatible
filetype off

" Vundle cheatsheet:
" :PluginList - lists configured plugins
" :PluginInstall - installs plugins
" :PluginUpdate - updates plugins
" :PluginSearch foo - search for foo (append ! to refresh local cache)
" :PluginClean - confirms removal of unused plugins (append ! to auto approve)
" see :h vundle for more
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" add plugins between begin and end calls

" required for vundle
Plugin 'VundleVim/Vundle.vim'

" tmux keybindings
Plugin 'christoomey/vim-tmux-navigator'

" handle .editorconfig files
Plugin 'editorconfig/editorconfig-vim'

" syntax checking plugin
Plugin 'vim-syntastic/syntastic'

" git gutter
Plugin 'airblade/vim-gitgutter'

call vundle#end()

filetype plugin indent on
syntax on

set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=1
set expandtab
set smarttab

" reads file from disk automatically if it changes
set autoread

" set some filetypes to 2 spaces
autocmd Filetype javascript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype css setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype json setlocal shiftwidth=2 softtabstop=2 expandtab

au BufNewFile,BufRead *.julros set filetype=html

set background=dark
colorscheme aimo

set number
set relativenumber
set noerrorbells
set mouse=a
set title

" autosave buffer when switching to other buffer
set autowrite

" don't wrap lines in middle of word
set linebreak

" number of lines to keep above and below cursor
set scrolloff=2

" disable backup files
set nobackup
set nowb

" search settings
set incsearch
set hlsearch
set ignorecase
set smartcase
hi Search ctermbg=LightYellow

set laststatus=2

" goto next or previous search hit and center it
nnoremap n nzz
nnoremap N Nzz

" map enter to creating a new line
map <cr> o<Esc>

" folding
set foldenable
set foldlevelstart=20
set foldnestmax=20
set foldmethod=indent

" set space as leader key
let mapleader="\<Space>"

" map some nice functions to leader
nnoremap <Leader>w :up<CR>
nnoremap <Leader>/ :nohlsearch<CR>
nnoremap <Leader>gt :tabp<CR>
nnoremap <Leader>g0 :tabfirst<CR>
nnoremap <Leader>g$ :tablast<CR>
nnoremap <Leader>q :wqa<CR>

" new file templates
autocmd BufNewFile *.html 0r ~/.vim/templates/html.tpl

" handle trailing whitespace, highlight and remove
match ErrorMsg '\s\+$'
autocmd BufWritePre * :%s/\s\+$//e

" tree-view
let g:netrw_liststyle = 3

" sort directories on top and files below
let g:netrw_sort_sequence = '[\/]$, *'

" open file when opened in netrw in last active window/buffer
let g:netrw_browse_split = 3

" uncomment if vim isn't configured with python support
" let g:EditorConfig_core_mode = 'external_command'

let g:currentmode={
            \ 'n' : 'normal',
            \ 'v' : 'visual',
            \ 'V' : 'v-line',
            \ '' : 'v-block',
            \ 'i' : 'insert',
            \ 'R' : 'R',
            \ 'Rv' : 'v-replace',
            \ 'c' : 'command',
            \}

" status line settings, some from syntastic
set statusline=%f
set statusline+=\ %y
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=
set statusline+=line\ %l\ of\ %L
set statusline+=\ [%{tolower(g:currentmode[mode()])}]

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" let g:syntastic_javascript_checkers = ['eslint']
