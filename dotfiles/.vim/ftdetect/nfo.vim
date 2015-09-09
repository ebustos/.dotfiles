au BufRead,BufNewFile  *.diz,*.DIZ,*.nfo set ft=nfo
autocmd BufRead,BufNewFile  *.lyx set syntax=lyx ft=lyx foldmethod=syntax foldcolumn=0
autocmd BufRead,BufNewFile  *.lyx syntax sync fromstart
autocmd BufRead,BufNewFile  *.sql set ft=sql syntax=sql

"As a dictionary you can use a syntax file (which are in the /syntax/ directory), so you can complete the reserved words. 

" TODO: usar runtimepath (y un for) en lugar de $VIMRUNTIME
autocmd Syntax * exec('setlocal dict+='.$VIMRUNTIME.'/syntax/'.getbufvar("%","current_syntax").'.vim')
"autocmd FileType * exec('setlocal dict+='.$VIMRUNTIME.'/syntax/'.expand('<amatch>').'.vim')
"set iskeyword+=-,: " for XSL - completition works great


