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

"Scala
map <F7> :call CompileRunScalac()<CR>
func! CompileRunScalac()
	exec "w"
	exec "!scalac -d classFile %"
	exec "!scala -cp classFile %<"
endfunc

"NERDTree
map <F3> :NERDTree<CR>

"Set java complier
map <F5> :call CompileRunJavac()<CR>
func! CompileRunJavac()
	exec "w"
	exec "!javac -d ../out/  %"
	exec "!java -classpath ../out  %<"
endfunc

"Print Info of me
map <F4> :call TitleDet2() <cr>'s
function AddTitle2()
	call append(0,"/**")
	call append(1," * Author         :   _Suheng")
	call append(2," * Email          :   gesuheng@gmail.com")
	call append(3," * Last modified  :   ".strftime("%Y-%m-%d %H:%M"))
	call append(4," * Filename       :   ".expand("%:t"))
	call append(5," */")
	echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
"Update the modified time and file
function UpdateTitle2()
	normal m'
	execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
	normal ''
	normal mk
	execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
	execute "noh"
	normal 'k
	echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction

function TitleDet2()
	let n=1
	while n<7
		let line = getline(n)
		if line = ~ '^\#\s*\S*Last\smodified:\S*.*$'
			call UpdateTitle2()
			return
		endif
		let n = n + 1
	endwhile
	call AddTitle2()
endfunction
