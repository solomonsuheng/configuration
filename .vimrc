"This is my .vimrc

syntax on
set nu
set shiftwidth=2
set tabstop=2
set autoindent
set cursorline

"https://github.com/tpope/vim-pathogen
call pathogen#infect()


"Python
map <F2> :!python % <CR>

"Set java complier
map <F5> :call CompileRunJavac()<CR>
func! CompileRunJavac()
   exec "w"
   exec "!javac %"
   exec "!java %<"
endfunc 
