" Rather than automatically changing the working directory, you could set Vim up
" so that you can easily change directory to the file being edited. The mapping
" below does that.

map ,cd :cd %:p:h<CR>

"   Edit another file in the same directory as the current file
"   uses expression to extract path from current file's path
"  (thanks Douglas Potts)
if has("unix")
    map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
    map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
    map ,w :w <C-R>=expand("%:p:h") . "/" <CR>
else
    map ,e :e <C-R>=expand("%:p:h") . "\" <CR>
    map ,t :tabe <C-R>=expand("%:p:h") . "\" <CR>
    map ,w :w <C-R>=expand("%:p:h") . "\" <CR>
endif

" Fast editing of the .vimrc
"map ee :e! ~/.vimrc
map ee :e<Space>
map tt :tabe<Space>

" Enable <Space> to toggle folds
nnoremap <silent> <Space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<CR>

" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" nnoremap j gj
" nnoremap k gk

" Get rid of that stupid goddamned help key that you will invaribly hit constantly while aiming for escape:
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" One less key to hit for every command
nnoremap ; :
vnoremap ; :

" Make emac's, bash's, mutt's C-g work the same in Vim
cnoremap <C-g> <C-c>

" Quick way to get back to normal mode
inoremap jj <ESC>

" Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Strip all trailing whitespace in the current file.
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>S :%s/\t/    /<cr>:let @/=''<CR>

" I think it makes more sense for ]z and [z to navigate to the next/previous open fold, so I added the following to my vimrc:
" Add the normal command "zj/zk" if you'd prefer to have the mapping jump out of the current open fold and into the next open fold.

function! GoToOpenFold(direction)
  let prev = line('.')
  if (a:direction == "next")
    normal zj
    let start = line('.')
    while foldclosed(start) != -1 && start != prev
        let prev = line('.')
        normal zj
        let start = line('.')
"      let start = start + 1
    endwhile
  else
    normal zk
    let start = line('.')
    while foldclosed(start) != -1 && start != prev
"      let start = start - 1
        let prev = line('.')
        normal zk
        let start = line('.')
    endwhile
  endif
  call cursor(start, 0)
endfunction

nmap ]z :cal GoToOpenFold("next")<CR>
nmap [z :cal GoToOpenFold("prev")<CR>

map <F9> <Esc>:make<CR>:cw<CR>
map <F10> <Esc>:ccl<CR>
map <F8> <Esc>:copen<CR>
imap <F9> <Esc>:make<CR>:cw<CR>
imap <F10> <Esc>:ccl<CR>
imap <F8> <Esc>:copen<CR>
nmap <F7> :w<CR>:!ctags  --recurse --exclude="*.beam,*.o"<CR><C-l>
map <A-up> :cprev<CR>
map <A-down> :cnext<CR>
imap <A-up> <Esc>:cprev<CR>a
imap <A-down> <Esc>:cnext<CR>a
"nmap <F8><F8> :wa<CR>:!exctags --languages=Erlang --recurse --exclude="*.beam"<CR><C-l>

" Save file like in `borland-ides` 
nmap <F2> :w<CR>
imap <F2> <Esc>:w<CR>a

" And, to disable flow control keys in such terminals, you can put something like
" stty -ixon

" map <C-T> <Esc>:tabnew<CR>
" map <C-S-t> <Esc>:tabnew<CR>


" Center searched result 
nmap n nzz
nmap N Nzz

" ==========================
" Java Options
" =========================
map <leader>b :InsertBothGetterSetter<CR>

" --------------------
"  PLUGIN MAPPINGS
" --------------------

" --------------------
" Project
" --------------------
"map <F12> :Project<CR>
"map <F11> :Project<CR>:redraw<CR>/
nmap <silent> <F3> <Plug>ToggleProject

" --------------------
" exTagSelect
" --------------------
nnoremap <silent> <F7> :ExtsToggle<CR>
nnoremap <silent> <Leader>ts :ExtsSelectToggle<CR>
nnoremap <silent> <Leader>tt :ExtsStackToggle<CR>
map <silent> <Leader>] :ExtsGoDirectly<CR>
map <silent> <Leader>[ :PopTagStack<CR>

" --------------------
" exGlobalSearch
" --------------------
nnoremap <silent> <F5> :ExgsToggle<CR>
nnoremap <silent> <Leader>gs :ExgsSelectToggle<CR>
nnoremap <silent> <Leader>gq :ExgsQuickViewToggle<CR>
nnoremap <silent> <Leader>gt :ExgsStackToggle<CR>
"map <S-f> :GS
map <C-S-f> :GSW

" --------------------
" exSymbolTable
" --------------------
nnoremap <silent> <Leader>ss :ExslSelectToggle<CR>
nnoremap <silent> <Leader>sq :ExslQuickViewToggle<CR>
nnoremap <silent> <F6> :ExslToggle<CR>
nnoremap <A-S-l> :ExslQuickSearch<CR>/^
nnoremap <silent> <Leader>sg :ExslGoDirectly<CR>

" --------------------
" TagList
" --------------------
" F4: Switch on/off TagList
nnoremap <silent> <F4> :TlistToggle<CR>

" --------------------
" OmniCppComplete
" --------------------
" set Ctrl+j in insert mode, like VS.Net
imap <C-j> <C-X><C-O>
" :inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<c-g>u\<CR>"
