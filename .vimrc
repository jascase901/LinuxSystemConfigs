filetype off
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" All of your Plugins must be added before the following line
"Bundle 'brookhong/cscope.vim'
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'
Bundle 'scrooloose/nerdtree'
Bundle 'flazz/vim-colorschemes'
Bundle 'SirVer/ultisnips'
"Bundle 'vim-scripts/lua.vim--Ko'
Bundle 'dag/vim2hs'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
let g:UltiSnipsListSnippets="<c-a>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"




" Optional:
call vundle#end()            " required



"Start Style Guide specific settings
set t_Co=256
colorscheme molokai
"Set spaceing
set tabstop=2
set shiftwidth=2
set expandtab
"higlight trailing lines
set hlsearch
set nocompatible
let mapleader=","
let g:UltiSnipsExpandTrigger="<tab>"

highlight ExtraWhitespace ctermbg=green guibg=green
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

highlight OverLength ctermbg=red ctermfg=white guibg=#595959
autocmd BufWinEnter,BufRead * match  OverLength /\%81v./
"Comment menu
function! CommentMenu()
  echohl Title
  echo 'Comment Type'
  echohl none
  echo '1.Class Declartions, Class Definitions, Global Functions, Global Vars'
  echo '2.Related Member functions'
  echo '3.Member functions'
	let choice = str2nr(input('choose item: '))
	let choice=1
  if choice == 1
    normal!o//***************************************************************************
    normal!o// Description:
    normal!o// Inputs:
    normal!o// Outputs:
    normal!o// Returns:
    normal!o//***************************************************************************

  endif
	if choice == 2
    normal!o//===========================================================================
    normal!o// Description:
    normal!o// Inputs:
    normal!o// Outputs:
    normal!o// Returns:
    normal!o//===========================================================================
  endif
	if choice == 3
    normal!o//---------------------------------------------------------------------------
    normal!o// Description:
    normal!o// Inputs:
    normal!o// Outputs:
    normal!o// Returns:
    normal!o//---------------------------------------------------------------------------
  endif
endfunction 
nmap <silent> <F2> :call CommentMenu()<CR>
nmap <silent> <F3> :call FoldPreprocessor()<CR>

"End Style Guide specific settings

"User Specific Settings
"set autoindent
filetype on
filetype indent on
filetype plugin indent on
filetype plugin on
set autoindent
set si
au BufRead,BufNewFile *.pago    set filetype=pago 
syntax on
set tags=./tags;/

"when using auto complete for commands display a list of avaible ones
set wildmenu
"Debug comment that prints linenum
map <leader>n :NERDTreeToggle <CR>
nmap <silent><F4> :execute "normal! i" . printf('cout<<"debug statement on line "<<%-4d<<"reached"    <<endl;',( line(".") ))<CR>
map <leader>m  :execute "normal! i" . printf('<%-4d',( line(".") ))<CR>
"
"End User Specific Settings


autocmd FileType *.[ch]{,pp} call FoldPreprocessor()
function! FoldPreprocessor()
	set foldmarker=#if,#endif
	set foldmethod=marker
	endfunction
call FoldPreprocessor()

