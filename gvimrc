"""""""""""""""""""""""""""""""""
" Basics
"""""""""""""""""""""""""""""""""
let mapleader = "," " Change From Backslash to Comma in commands \a -> ,a
set nocompatible                  " We're on vim, not vi
filetype plugin indent on         " indent files, ftplugins
"set history=500                  " Remember more on history
runtime macros/matchit.vim        " Enable matchit
set wildmode=list:longest         " bash like command line tab completion
set wildignore=*.o,*.obj,*~,*.swp " ignore when tab completing:
set backspace=indent,eol,start    " Intuitive backspacing in insert mode
set shortmess=atI
set visualbell                    " get rid of the BEEP
set scrolloff=3                   " Provide three lines of context
set autowrite                     " Automatically save before commands like :next
set showcmd                       " display incomplete commands

nnoremap <C-e> 3<C-e>             " faster scrolling up
nnoremap <C-y> 3<C-y>             " and down

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
set cot+=menuone

"complete with Ctrl-Space
inoremap <C-space> <C-x><C-o>

"make <c-l> clear the highlight and redraw
nnoremap <C-L> :nohls<CR><C-L>
"in insert mode too
inoremap <C-L> <C-O>:nohls<CR>

map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr>     " And load session with F3

" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
"set viminfo='10,\"100,:20,%,n~/.viminfo

set tabstop=2 shiftwidth=2 expandtab " Set two space tabs:

" Fix my seplling
if exists("+spelllang")
  set spelllang=es_mx
endif

set splitbelow                    " Split windows at bottom
set ttimeoutlen=50                " Speed up <esc>

"Rebuild tags with F5
map <silent> <F5>:!ctags -R --exclude=.svn --exclude=.git --exclude=log *<CR>

set writeany                      " Allow writing readonly files

" set cursorcolumn when editing HAML
autocmd BufEnter *.haml setlocal cursorcolumn

"""""""""""""""""""""""""""""""""
" Fat fingering stuff...
"""""""""""""""""""""""""""""""""
cabbr Wq  wq                      " write and quit on Wq too
cabbr Wqa wqa                     " useful when accidentally holding the shift key
cabbr W w
imap <F1> <Esc>                   " useful when accidentally hitting F1 when going back to normal mode


"""""""""""""""""""""""""""""""""
" line wrapping and movements
"""""""""""""""""""""""""""""""""
" toggle wrapping with <Leader>w (typically \w)
"nnoremap <silent> <Leader>w :call ToggleWrap()<CR>
"function ToggleWrap()
"  if &wrap
"    echo "Wrap OFF"
"    call UnwrapIt()
"  else
"    echo "Wrap ON"
"    call WrapIt()
"  endif
"endfunction

"function WrapIt()
"  set wrap linebreak
"  set virtualedit=
"  set breakat=\ ^I!@*-+;:,./?       " when wrapping, break at these characters (requires linbreak, see above)
"  set showbreak=>                   " character to show that a line is wrapped
"  setlocal display+=lastline
"  noremap  <buffer> <silent> k gk
"  noremap  <buffer> <silent> j gj
"  noremap  <buffer> <silent> <Up>   gk
"  noremap  <buffer> <silent> <Down> gj
"  noremap  <buffer> <silent> <Home> g<Home>
"  noremap  <buffer> <silent> <End>  g<End>
"  inoremap <buffer> <silent> <Up>   <C-o>gk
"  inoremap <buffer> <silent> <Down> <C-o>gj
"  inoremap <buffer> <silent> <Home> <C-o>g<Home>
"  inoremap <buffer> <silent> <End>  <C-o>g<End>
"endfunction

"function UnwrapIt()
"  set nowrap
"  set virtualedit=all
"  silent! nunmap <buffer> j
"  silent! nunmap <buffer> k
"  silent! nunmap <buffer> <Up>
"  silent! nunmap <buffer> <Down>
"  silent! nunmap <buffer> <Home>
"  silent! nunmap <buffer> <End>
"  silent! iunmap <buffer> <Up>
"  silent! iunmap <buffer> <Down>
"  silent! iunmap <buffer> <Home>
"  silent! iunmap <buffer> <End>
"endfunction

"if &wrap
"  call WrapIt()
"endif

"""""""""""""""""""""""""""""""""
" Backup files
"""""""""""""""""""""""""""""""""

" Use a common directory for backups and swp files
" Create it if it doesn't exist
"silent execute '!mkdir -p ~/.vim_backups'
set backupdir=./.vim_backups,.,/tmp
set directory=.,./.vim_backups,/tmp

"""""""""""""""""""""""""""""""""
" Looks
"""""""""""""""""""""""""""""""""
syntax on                         " syntax highlighting, please
set foldmethod=syntax             " me likes the syntax folding
set foldnestmax=3                 " deepest fold level
set nofoldenable                  " don't fold by default
set ruler                         " always show the cursor position"
set number
set showmatch                     " Show matching brackets.
set mat=5                         " Bracket blinking. 
set laststatus=2                  " Always show status line (not only for multiple windows)
set cursorline                    " highlight cursor line
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list                          " show trailing whiteshace and tabs
"highlight Pmenu ctermbg=238 gui=bold

":colorscheme oceandeep
":colorscheme vividchalk
:colorscheme summerfruit
":colorscheme neon
":colorscheme xoria256
":colorscheme darkspectrum
":colorscheme sunburst
":colorscheme wombat
":colorscheme matrix

"set t_Co=256                      " tell the term has 256 colors

if has('gui_running')
  "set guioptions-=T              " Remove toolbar and menus in gvim
  "set guioptions-=m
  set mousehide                  " Hide mouse after chars typed, only gvim
"  set transp=10
endif

"""""""""""""""""""""""""""""""""
" Searching
"""""""""""""""""""""""""""""""""
set ignorecase        " search case insensitive
set smartcase         " search case sensitive when term has a capital letter
set hlsearch          " Highlight search terms...
set incsearch         " search dynamically as keyword is typed.

"""""""""""""""""""""""""""""""""
" Plugin customizations
"""""""""""""""""""""""""""""""""
" CamelCaseMotion plugin mappings
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e 

"""""""""""""""""""""""""""""""""
" NERDTreeToggle
"""""""""""""""""""""""""""""""""""
:map <leader>d :execute 'NERDTreeToggle ' .getcwd()<CR>
let NERDTreeShowLineNumbers=0


" For fuzzy finder/textmate
" Requires fuzzyfinder and fuzzyfinder_textmate plugins
let g:fuzzy_ignore = "log/*, .svn/*, .git/*"
let g:fuzzy_matching_limit = 70
map <leader>f :FuzzyFinderTextMate<CR>
map <leader>b :FuzzyFinderBuffer<CR>

" Override mappings for rubytest.vim plugin
"map <unique> <Leader>s <Plug>RubyTestRun
"map <unique> <Leader>S <Plug>RubyFileRun

" Add a todo wiki to Vimwiki
let g:vimwiki_list = [{}, {'path': '~/todo/', 'path_html': '~/todo_html/'}]

"CTags
let g:ctags_statusline=1 " Display function name in status bar
let generate_tags=1 " Automatically start script 
let Tlist_Use_Horiz_Window=0 " Displays taglist results in a vertical window:
" Togle Taglist with TT
nnoremap TT :TlistToggle<CR>
" Various Taglist diplay config
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1

"""""""""""""""""""""""""""""""""
" Other
"""""""""""""""""""""""""""""""""

"define :Lorem command to dump in a paragraph of lorem ipsum
command! -nargs=0 Lorem :normal iLorem ipsum dolor sit amet, consectetur
      \ adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
      \ magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
      \ ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
      \ irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
      \ fugiat nulla pariatur.  Excepteur sint occaecat cupidatat non
      \ proident, sunt in culpa qui officia deserunt mollit anim id est
      \ laborum

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: ,e
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
 
" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: ,t
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Opens a split window edit command with the path of the currently edited file
" filled in. Normal mode: ,s
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>


set lines=50
set columns=170

"set go-=t
"set bg=dark
"if &background == 'dark'
"  hi normal guibg=black
"endif
