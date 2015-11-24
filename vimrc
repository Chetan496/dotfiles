" Sets how many lines of history vim has to rememeber

set history=600

" Enable filetype plugins
filetype plugin on
filetype indent on

" set to auto read when a file is changed from the outside
set autoread


" set a global map leader key. for faster use
let mapleader = ","
let g:mapleader = ","


noremap <leader>w :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vundle config

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
call vundle#rc()

Plugin 'gmarik/Vundle.vim'
Plugin 'xolox/vim-misc'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'scrooloose/snipmate-snippets.git'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'pangloss/vim-javascript'
Plugin 'burnettk/vim-angular'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
Plugin 'wincent/command-t'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'SirVer/ultisnips'
Plugin 'vim-scripts/Tagbar'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'othree/html5.vim'
Plugin 'othree/html5-syntax.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'derekwyatt/vim-scala'
Plugin 'moll/vim-node'
Plugin 'walm/jshint.vim'
Plugin 'fatih/vim-go'
Plugin 'klen/python-mode'
Plugin 'xolox/vim-session'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tomtom/tcomment_vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'leafgarland/typescript-vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'marijnh/tern_for_vim'

call vundle#end()

filetype on

filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""''''''''''''''''''''''


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> VIM User Interface
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildmenu


" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Ignore case when searching
set ignorecase

" When searching try to be smart
set smartcase


" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Dont redraw while executing macros
set lazyredraw

" show matching brackets when text indicator is over them
set showmatch

" how many tenths of a second to blink when matching bracktes
set mat=2

set scrolloff=5

set cursorline
set undofile

set numberwidth=2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'

" Enable syntax highlighting

syntax enable


try
   colorscheme molokai
   let g:molokai_original = 1
   let g:rehash256 = 1
   set t_Co=256
   set gfn=Monaco
catch
endtry
set t_Co=256

if has("gui_running")
   set t_Co=256
   colorscheme molokai
endif

if has("gui_gtk2")
   set guifont=Monaco\ 12
endif

set encoding=utf8
set ffs=unix,dos,mac

autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif

set ai
set si 
set wrap "wrap lines
set nu



set expandtab
set smarttab

"1 tab == 3 spaces
set shiftwidth=3
set tabstop=3

" useful mapping for managing tabs
map <leader>te :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"switching between tabs using leader key combinations..
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>



"Return to last edit position when opening files
autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
"Remeber info about open buffers on close
set viminfo^=%



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Status Line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2
"Format the status line
"set statusline=\%{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Editing Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTrailingWS()
   exe "normal mz"
   %s/\s\+$//ge
   exe "normal `z"
endfunc

autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.css :call DeleteTrailingWS()

autocmd BufWrite *.html :call DeleteTrailingWS()
autocmd BufWrite *.vim :call DeleteTrailingWS()

autocmd BufWrite *.rb :call DeleteTrailingWS()
autocmd BufReadPost *.rb set keywordprg=ri

autocmd BufWritePre *.html normal gg=VG
autocmd BufWritePre *.erb normal gg=VG
autocmd BufWritePre *.js normal gg=VG
autocmd BufWritePre *.rb normal gg=VG


autocmd BufWritePost $MYVIMRC source $MYVIMRC


" Returns true if paste mode is enabled
function! HasPaste()
   if &paste
      return 'PASTE MODE '
   en
   return ''
endfunction


set rtp+=~/softwares/powerline/powerline/bindings/vim/



autocmd FileType ruby compiler ruby

"vim-javscript settings
let  g:javscript_enable_domhtmlcss=1

let g:vim_markdown_folding_disabled=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'''

"Ultisnips key mappings. They conflict with YouCompleteMe. Hence changing them
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
" Common Abbrievations
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoreabbrev teh the
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Session management. enable autosave of sessions. save to session file every
" 10 minutes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:session_autosave='yes'
let g:session_autosave_periodic=10

set nobackup

