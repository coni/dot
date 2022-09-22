"-----------KEYMAPS-------------
"only builtin
noremap <C-a> :terminal<cr>
noremap <C-s> :w<cr>
vnoremap <Space> zf
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
nnoremap <C-j> 10j
nnoremap <C-k> 10k
nnoremap <C-b> :call ToggleNetrw()<cr>
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
nnoremap <F2> :set invpaste paste?<CR>
nnoremap <S-h> :call ToggleHiddenAll()<CR>
nnoremap <C-h> :call ToggleSyntax()<CR>
nnoremap <C-i> :call RunCode()<CR>
set pastetoggle=<F2>


" ---------GENERAL SETTINGS------------

"Set compatibility to Vim only.
set nolist
set nocompatible

filetype on
syntax on
filetype plugin indent on
set noruler

set modelines=0
set wrap
set textwidth=75
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

set scrolloff=5
set backspace=indent,eol,start
set ttyfast

"set laststatus=2 im not using it hihi 
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

set showmode
set showcmd

set matchpairs+=<:>
set number
set encoding=utf-8
set hlsearch
set incsearch
"set ignorecase
"set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" ---------------PLUGINS--------------------
"
"Plugin autoinstalling
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

""Syntax highlighting and autocompletion

""File search and navigation
" Plug 'preservim/nerdtree'

""Editor interface and theming
" Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'yggdroot/indentline'
Plug 'tpope/vim-commentary'

" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'Shirk/vim-gas'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

"Debugging, refactoring and version control
"Plug 'puremourning/vimspector'

"Plug 'gmarik/Vundle.vim'
"
call plug#end()
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

"-------------CUSTOM FUNCTIONS-----------
let s:syntax = 1
function! ToggleSyntax()
  if s:syntax == 1
    syntax off
    let s:syntax = 0
  else
    syntax on
    let s:syntax = 1
  endif
endfunction

let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
     "   set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
      endif
endfunction

function RunCode()
	if &ft == 'c'
    w !make && ./main
    " w !make && make run
  elseif &ft == 'python'
    w !python %:p
  elseif &ft == "cs"
    w !dotnet run
  else
    w !make && make run
  endif
endfunction


let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
