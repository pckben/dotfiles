" These stuff are for USACO quick actions
" Compile with <F5>, run it, then show output file.

"command -nargs=1 -complete=file Gpp execute '!g++ <args>'

function! USACO_DEBUG()
	let cppfile = expand("%") 
	"let outfile = expand("%:r") . ".out"
	execute "!./compilerun.sh " . cppfile
	unlet cppfile
endfunction

function! USACO_NODEBUG()
	let cppfile = expand("%") 
	execute "!./compilerun.sh " . cppfile
	"execute "!echo Compiling...; g++ % -o current; echo;echo Executing ...; ./current ;echo; echo Output: ; cat " . outfile
	unlet cppfile
endfunction

map <F5> <F2>:call USACO_DEBUG()<CR>
map <A-F5> <F2>:call USACO_NODEBUG()<CR>
