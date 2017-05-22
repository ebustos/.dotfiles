syntax enable
set nocompatible
set softtabstop=4
set shiftwidth=4
set expandtab
"set nomodeline
" set t_Co=256
 colorscheme inkpot2
"colorscheme koehler

" Highlight characters exceeding column 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
match OverLength /\%81v./
"set colorcolumn=85
set wrap
"set textwidth=79
"set formatoptions=qrn1


"filetype off
"call pathogen#runtime_append_all_bundles()
filetype plugin indent on
"filetype plugin on
"filetype indent on

" binding useful for ttys
map O5C <C-Right>
map O5D <C-Left>
map! O5C <C-Right>
map! O5D <C-Left>

map <C-c> "+y
map <C-S-v> "+gP
imap <C-S-v> <ESC>"+gPa

"set autoindent
"set showmode
"set showcmd
"set hidden
"set cursorline
"set ttyfast
"set ruler
set backspace=indent,eol,start
"set relativenumber
"set undofile
"
"Each of these lines are basically to make Vim behave in a sane manner. The two “interesting” ones are the last two, and both deal with
"features that are new in Vim 7.3.
"
"relativenumber changes Vim’s line number column to display how far away each line is from the current one, instead of showing the
"absolute line number.
"
"I almost never care what numeric line I’m on in a file (and if I do I can see it in the status line), so I don’t miss the normal line
"numbers. I do care how far away a particular line might be, because it tells me what number I need to use with motion commands like
"d<NUMBER>d.
"
"undofile tells Vim to create <FILENAME>.un~ files whenever you edit a file. These files contain undo information so you can undo
"previous actions even after you close and reopen a file.
"
"Next I change the <leader> key:
let mapleader = ","



set encoding=utf-8
set statusline=%<%f\ %h%m%r%=%-16.(%l,%c%V\ %y\ %L%)\ %P
set diffopt=filler,vertical,iwhite
"set backupskip=mutt-<hostname>*

" mouse	list of flags for using the mouse
" 		n	Normal mode
" 		v	Visual mode
" 		i	Insert mode
" 		c	Command-line mode
" 		h	all previous modes when editing a help file
" 		a	all previous modes
" 		r	for |hit-enter| and |more-prompt| prompt
set mouse=a
" setting for tmux
" set ttymouse=xterm
set scrolloff=9 " number of screen lines to show around the cursor
"laststatus	0, 1 or 2; when to use a status line for the last window
set ls=2

" Another example, which highlights all characters in virtual
"	column 72 and more: >
":highlight rightMargin term=bold ctermfg=blue guifg=blue
":match rightMargin /.\%>72v/

set is  " incsearh  : incremental search
set hls " hlsearch  : highlight all matches for the last used search pattern
set cul " cursorline: Highlight the screen line of the cursor with CursorLine
set ic  " ignorecase: Ignore case in search patterns.  Also used when searching in the tags
set scs " smartcase : override 'ignorecase' when pattern has upper case characters
" fix Vim’s horribly broken default regex “handling” by inserting a \v before
" any string you search. This turns off Vim’s crazy default regex characters and

" Makes searches use normal regexes. a.k.a. vim 'very magic' mode
nnoremap / /\v
vnoremap / /\v

set gdefault " Applies substitutions globally on lines. If you need the previous behavior just tack on the g again.
set showmatch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set list
set listchars=tab:▸\ ,trail:\ ,extends:\|
",extends:|
"set listchars=tab:▸\ ,eol:¬ 
"   New Vim users will want the following lines to teach them to do things right:
"

" Save on losing focus. Useful with version control and Vim’s persistent undo.
"au FocusLost * :wa

set sb  " splitbelow: a new window is put below the current one
set spr " splitright: a new window is put right of the current one
set tags+=../tags,../../tags,../../../tags

" Disable annoying beep, and visual bell.
set vb t_vb=
au GUIEnter * set t_vb=


" GUI Options
"set tbis=tiny
" autoselect, gui tabs, greyed menu items, vim icon, tearoff menu items,
" no scrollbar, no toolbar
set guioptions=aegit


" AUTO COMPLETION OPTIONS
"
" When more than one match, list all matches and complete till longest common 
" string. Then start completing each full match.
set wildmode=list:longest,full
" ignore files which are product of compilation
set wildignore=*.o,*.obj,*.pyc,*.beam,*.so,*.a
" set completeopt=menuone,menu,longest,preview
" complete	specifies how Insert mode completion works for CTRL-N and CTRL-P
" 	(local to buffer)
"  	set cpt=.,w,b,u,t,i
" use a popup menu for insert mode completion and complete longest common match
set completeopt=longest,menu,preview

let g:tex_flavor='latex'

if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
	    \	if &omnifunc == "" |
	    \		setlocal omnifunc=syntaxcomplete#Complete |
	    \	endif
endif

" --------------------
"  FOLDING OPTIONS
" --------------------
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
let ocaml_folding=1           " Ocaml
let debcontrol_fold_enable=1  " Debian
"Some folding is now supported with syntax/vim.vim: >

"   g:vimsyn_folding == 0 or doesn't exist: no syntax-based folding
"   g:vimsyn_folding =~ 'a' : augroups
"   g:vimsyn_folding =~ 'f' : fold functions
"   g:vimsyn_folding =~ 'm' : fold mzscheme script
"   g:vimsyn_folding =~ 'p' : fold perl     script
"   g:vimsyn_folding =~ 'P' : fold python   script
"   g:vimsyn_folding =~ 'r' : fold ruby     script
"   g:vimsyn_folding =~ 't' : fold tcl      script
let g:vimsyn_folding = 'afmpPrt'
set foldnestmax=2
set foldmethod=syntax
"set foldlevelstart=1



" --------------------
" Project
" --------------------
let g:proj_window_width = 30
let g:proj_window_increment = 50

" --------------------
" exTagSelect
" --------------------
let g:exTS_backto_editbuf = 0
let g:exTS_close_when_selected = 1

" --------------------
" exGlobalSearch
" --------------------
let g:exGS_backto_editbuf = 0
let g:exGS_close_when_selected = 0

" --------------------
" exSymbolTable
" --------------------
let g:exSL_SymbolSelectCmd = 'TS'

" --------------------
" exEnvironmentSetting
" --------------------
"function! g:exES_UpdateEnvironment()
" if exists( 'g:exES_PWD' )
" silent exec 'cd ' . g:exES_PWD
" endif
" if exists( 'g:exES_Tag' )
" let &tags = &tags . ',' . g:exES_Tag
" endif
"endfunction

" --------------------
" TagList
" --------------------
" TagListTagName - Used for tag names
"highlight MyTagListTagName gui=bold guifg=Black guibg=Orange
" TagListTagScope - Used for tag scope
"highlight MyTagListTagScope gui=NONE guifg=Blue
" TagListTitle - Used for tag titles
"highlight MyTagListTitle gui=bold guifg=DarkRed guibg=LightGray
" TagListComment - Used for comments
"highlight MyTagListComment guifg=DarkGreen
" TagListFileName - Used for filenames
"highlight MyTagListFileName gui=bold guifg=Black guibg=LightBlue
"let Tlist_Ctags_Cmd = $VIM.'/vimfiles/ctags.exe' " location of ctags tool
"let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
"let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Sort_Type = "order" " sort by order or name
"let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
let Tlist_Compart_Format = 1 " Remove extra information and blank lines from the taglist window.
let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
"let Tlist_Close_On_Select = 1 " Close the taglist window when a file or tag is selected.
let Tlist_Enable_Fold_Column = 0 " Don't Show the fold indicator column in the taglist window.
let Tlist_WinWidth = 40
" let Tlist_Ctags_Cmd = 'ctags --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++'
" very slow, so I disable this
" let Tlist_Process_File_Always = 1 " To use the :TlistShowTag and the :TlistShowPrototype commands without the taglist window and the taglis
":TlistShowPrototype [filename] [linenumber]

" --------------------
" MiniBufExpl
" --------------------
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:bufExplorerShowRelativePath=1  " Show relative paths.

let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplModSelTarget = 1 " If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
let g:miniBufExplUseSingleClick = 1 " If you would like to single click on tabs rather than double clicking on them to goto the selected buff
let g:miniBufExplMaxSize = 1 " <max lines: defualt 0> setting this to 0 will mean the window gets as big as needed to fit all your buffers.
"let g:miniBufExplForceSyntaxEnable = 1 " There is a Vim bug that can cause buffers to show up without their highlighting. The following sett
"let g:miniBufExplorerMoreThanOne = 1 " Setting this to 0 will cause the MBE window to be loaded even
"for buffers that have NOT CHANGED and are NOT VISIBLE.
highlight MBEChanged guibg=Red guifg=DarkRed
" buffers that have NOT CHANGED and are VISIBLE
highlight MBEVisibleNormal term=bold cterm=bold gui=bold guibg=Gray guifg=Black
" buffers that have CHANGED and are VISIBLE
highlight MBEVisibleChanged term=bold cterm=bold gui=bold guibg=DarkRed guifg=Black

" --------------------
" OmniCppComplete
" --------------------
" use global scope search
let OmniCpp_GlobalScopeSearch = 1
" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 1
" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 1
" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0
" This option allows to display the prototype of a function in the abbreviation part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
let OmniCpp_ShowPrototypeInAbbr = 1
" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 1
" This option can be use if you don't want to parse using namespace declarations in included files and want to add namespaces that are always
let OmniCpp_DefaultNamespaces = ["std"]
" Complete Behaviour
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 0


" selectmode	"mouse", "key" and/or "cmd"; when to start Select mode
" 	set slm=
" 	   mouse	when using the mouse
" 	   key		when using shifted special keys
" 	   cmd		when using "v", "V" or CTRL-V
set slm=key

"'keymodel' 'km'         string  (default "")
"                        global
"                        {not in Vi}
"        List of comma separated words, which enable special things that keys
"        can do.  These values can be used:
"           startsel     Using a shifted special key starts selection (either
"                        Select mode or Visual mode, depending on "key" being
"                        present in 'selectmode').
"           stopsel      Using a not-shifted special key stops selection.
"        Special keys in this context are the cursor keys, <End>, <Home>,
"        The 'keymodel' option is set by the |:behave| command.
"        <PageUp> and <PageDown>.
set keymodel=startsel

" 14 editing text
"
" undolevels	maximum number of changes that can be undone
"  	set ul=1000
" modified	changes have been made and not written to a file
" 	(local to buffer)
"  	set mod	nomod
" readonly	buffer is not to be written
" 	(local to buffer)
"  	set noro	ro
" modifiable	changes to the text are not possible
" 	(local to buffer)
"  	set ma	noma
" textwidth	line length above which to break a line
" 	(local to buffer)
"  	set tw=0
" 	Maximum width of text that is being inserted.  A longer line will be
" 	broken after white space to get this width.  A zero value disables
" 	this.  'textwidth' is set to 0 when the 'paste' option is set.  When
" 	'textwidth' is zero, 'wrapmargin' may be used.  See also
" 	'formatoptions' and |ins-textwidth|.
" 	When 'formatexpr' is set it will be used to break the line.
" wrapmargin	margin from the right in which to break a line
" 	(local to buffer)
"  	set wm=0
" 	Number of characters from the right window border where wrapping
" 	starts.  When typing text beyond this limit, an <EOL> will be inserted
" 	and inserting continues on the next line.
" 	Options that add a margin, such as 'number' and 'foldcolumn', cause
" 	the text width to be further reduced.  This is Vi compatible.
" 	When 'textwidth' is non-zero, this option is not used.
" backspace	specifies what <BS>, CTRL-W, etc. can do in Insert mode
"  	set bs=indent,eol,start
" comments	definition of what comment lines look like
" 	(local to buffer)
"  	set com=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
" formatoptions	list of flags that tell how automatic formatting works
" 	(local to buffer)
"  	set fo=tcq
" formatlistpat	pattern to recognize a numbered list
" 	(local to buffer)
"  	set flp=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
" formatexpr	expression used for "gq" to format lines
" 	(local to buffer)
"  	set fex=
" pumheight	maximum height of the popup menu
"  	set ph=0
" completefunc	user defined function for Insert mode completion
" 	(local to buffer)
"  	set cfu=
" omnifunc	function for filetype-specific Insert mode completion
" 	(local to buffer)
"  	set ofu=
" dictionary	list of dictionary files for keyword completion
" 	(global or local to buffer)
"  	set dict=
" thesaurus	list of thesaurus files for keyword completion
" 	(global or local to buffer)
"  	set tsr=
" infercase	adjust case of a keyword completion match
" 	(local to buffer)
"  	set noinf	inf
" digraph	enable entering digraps with c1 <BS> c2
"  	set nodg	dg
" tildeop	the "~" command behaves like an operator
"  	set notop	top
" operatorfunc	function called for the"g@"  operator
"  	set opfunc=
" showmatch	When inserting a bracket, briefly jump to its match
"  	set nosm	sm
" matchtime	tenth of a second to show a match for 'showmatch'
"  	set mat=5
" matchpairs	list of pairs that match for the "%" command
" 	(local to buffer)
"  	set mps=(:),{:},[:]
" joinspaces	use two spaces after '.' when joining a line
"  	set js	nojs
" nrformats	"alpha", "octal" and/or "hex"; number formats recognized for
" 	CTRL-A and CTRL-X commands
" 	(local to buffer)
"  	set nf=octal,hex

" == EXAMPLE ==
set title
set titleold=Mutt

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" I don't like swap files
set noswapfile
:highlight Pmenu ctermbg=238 ctermfg=white gui=bold

" ignore case when searching
:set ignorecase
" but if any character is typed uppercase, respect the case
:set smartcase


" use ack instead of grep for vimgrep
:set grepprg=ack

 " abbreviations
 " useful
iab xauthor Emilio Bustos
iab xdate =strftime("%d/%m/%y %H:%M:%S")

"let g:GetLatestVimScripts_allowautoinstall=1

 " Tell vim to remember certain things when we exit
 "  '10 : marks will be remembered for up to 10 previously edited files
 "  "100 : will save up to 100 lines for each register
 "  :20 : up to 20 lines of command-line history will be remembered
 "  % : saves and restores the buffer list
 "  n... : where to save the viminfo files
 set viminfo='10,\"100,:20,%,n~/.viminfo

 " when we reload, tell vim to restore the cursor to the saved position
 augroup JumpCursorOnEdit
  au!
  autocmd BufReadPost *
  \ if expand(":p:h") !=? $TEMP |
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \ let JumpCursorOnEdit_foo = line("'\"") |
  \ let b:doopenfold = 1 |
  \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
  \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
  \ let b:doopenfold = 2 |
  \ endif |
  \ exe JumpCursorOnEdit_foo |
  \ endif |
  \ endif
  " Need to postpone using "zv" until after reading the modelines.
  autocmd BufWinEnter *
  \ if exists("b:doopenfold") |
  \ exe "normal zv" |
  \ if(b:doopenfold > 1) |
  \ exe "+".1 |
  \ endif |
  \ unlet b:doopenfold |
  \ endif
 augroup END

" For vim-erlang-skeletons
let g:erl_author="Emilio Bustos"
let g:erl_company="Emilio Bustos"
command! EjabberdServer ErlTemplate("gen_mod_server")
command! EjabberdMod ErlTemplate("gen_mod")

" Allow Ctrl+PgUp/PgDn in tmux
"set t_kN=[6;*~
"set t_kP=[5;*~

" :runtime! ftplugin/man.vim

 " indent related
" set backspace=indent,eol,start
" set smarttab
" set expandtab
" set sw=4
" set tabstop=4
" set softtabstop=4

 " other view settings, some redundant
" set t_Co=256
" set number
" set autoindent
" set smartindent
" set showcmd
" set showmatch
" set tw=0
" set hlsearch
" set incsearch

 " following taken from http://items.sjbach.com/319/configuring-vim-right
" set hidden
" runtime macros/matchit.vim

 "mappings
 " fast saves
 " fast quit
 " and tag/tree toggling
" :nmap  :w
" :nmap  :wall
" :map  :qall
" :map  :TlistToggle
" :map  :NERDTreeToggle
" :map  :FuzzyFinderFile

" :let NERDTreeQuitOnOpen = 1

" :set wm=4

" who needs .gvimrc?  (people in irc://irc.freenode.net#vim say this is limited)
" if has('gui_running')
"   set guifont=Monospace\ 7.5   " this is not limited to integers
"   if &diff
"     autocmd GuiEnter * set columns=165 lines=50
"   else
"     autocmd GuiEnter * set columns=80 lines=40
"   end
" end
" set diffopt+=iwhite             " ignore whitespace in diff mode
"  
"  from sbach, http://items.sjbach.com/319/configuring-vim-right
"  and http://www.vim.org/scripts/script.php?script_id=39
" runtime macros/matchit.vim
" filetype plugin on
" source ~/.vim/plugin/matchit.

" Fix weird colors in vimdiff
"highlight DiffAdd cterm=none ctermfg=bg ctermbg=Green gui=none guifg=bg guibg=Green
"highlight DiffDelete cterm=none ctermfg=bg ctermbg=Red gui=none guifg=bg guibg=Red
"highlight DiffChange cterm=none ctermfg=bg ctermbg=Yellow gui=none guifg=bg guibg=Yellow
"highlight DiffText cterm=none ctermfg=bg ctermbg=Magenta gui=none guifg=bg guibg=Magenta
