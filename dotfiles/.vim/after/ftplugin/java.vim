set foldmethod=syntax
setlocal omnifunc=javacomplete#Complete
set foldmethod=marker
set foldmarker={,}
"3. Set 'completefunc' option to show parameters information IF YOU LIKE. e.g. >
"        :setlocal completefunc=javacomplete#CompleteParamsInfo
"You can map as follows for better display: >
"        :inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
"        :inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>
