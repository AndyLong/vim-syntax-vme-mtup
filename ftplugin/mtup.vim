" My Message Text Update Program FileType Plugin file
"
" Only do this if the buffer has not been initialised
"
if exists("b:did_ftplugin")
	finish
endif

let b:did_ftpulgin=1

setlocal softtabstop=2
setlocal tabstop=2
setlocal expandtab
setlocal shiftwidth=2
setlocal foldcolumn=4
setlocal foldmethod=syntax
"
"  match angle brackets for simple use of the '%' key
"
set matchpairs+=<:>
"
"  If the 'matchit' plugin is installed, then use the '%' key as well for
"  parts of a ase clause
"
let b:matchwords='\<CASE\>:\<THEN\>:\,:\<DEFAULT\>:\<ESAC\>'
