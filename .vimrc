" Sources of inspiration
    " http://haridas.in/vim-as-your-ide.html#setup-vim-from-scratch
    " http://unlogic.co.uk/posts/vim-python-ide.html

" Config for vundle
" https://github.com/gmarik/vundle
set nocompatible               " be iMproved
 filetype off                   " required!

  set rtp+=~/.vim/bundle/vundle/
   call vundle#rc()

    " let Vundle manage Vundle
    "  " required! 
    Bundle 'gmarik/vundle'


" My installed plugins with vundle
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
Bundle 'coot/atp_vim'
Bundle 'vim-scripts/vimwiki'

" ================ CONFIG START =============
" Set color scheme
" https://raw.github.com/garybernhardt/dotfiles/master/.vim/colors/grb256.vim
colorscheme desert

" Change vimwiki folder
nmap <Leader>ww :e $HOME/Dropbox/vimwiki/index.wiki<CR>

" Basic settings
syntax on
set number
set smartcase
set hlsearch
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
set scrolloff=5

"Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Use "xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'" in terminal to
" remap Caps Lock to Esc (system wide). Who needs capslock anyways.

"Changing Leader Key
let mapleader = ","

" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END


" Make Vim to handle long lines nicely (the standard 80 lines is a bit short for bigger screens).
set wrap
set textwidth=100
set formatoptions=qrn1
set colorcolumn=100

" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

" NERDTree
nnoremap <leader>d :NERDTreeToggle<cr>

" Remove search hilight
nnoremap <leader>n :noh<cr>

" ==== Python-mode ====
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Load run code plugin
let g:pymode_run = 1

" Key for run python code
let g:pymode_run_key = '<leader>r'

" ==== END PYTHON MODE ====

" Jump by line instead of row
nnoremap j gj
nnoremap k gk

" Move backup- and swapfiles from root-directory
set backupdir=~/.vim/backup
set directory=~/.vim/swap

" Move between splits natually 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Jedi-vim config
let g:jedi#get_definition_command = "<leader>k"

" Vimwiki
 let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]
