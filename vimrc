runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" non vi mode
set nocompatible

" modified buffers are called hidden
set hidden

" No beep noise. The t_vb bit removes any delay also
set visualbell t_vb=
" set noerrorbells

" More universally accessible leader
let mapleader = ","

" Remeber last X commands. Default is 20
set history=1000

" show line numbers
set number
nmap <leader>n :set number!<CR>
nmap <leader>rn :set relativenumber!<CR>

" word wrap
set wrap linebreak nolist

" Useful file/command completion
set wildmenu
set wildmode=list:longest

"Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.swf,*.jpeg

" Case smart searching
set ignorecase
set smartcase

" saner defaults for splitting
set splitbelow
set splitright

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.
nmap <leader>h :set hlsearch!<CR>
" Switch off highlighting current search terms
nnoremap <silent> <CR> :nohlsearch<CR><CR>

" Fix slow O inserts
:set timeout timeoutlen=1000 ttimeoutlen=100

" Map ESC
imap jk <ESC>l

" Common typos in commands
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" Descriptive title
set title

set encoding=utf-8

"Always show cursor position
set ruler

" highlight current line
set cursorline

" This makes RVM work inside Vim. I have no idea why.
set shell=bash
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" More context around cursor
set scrolloff=3

" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1

" Scroll viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" code folding
set foldmethod=indent

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Make jump to line *and* column default
" nnoremap ' `
" nnoremap ` '

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Shortcut to rapidly toggle the showing of invicibles
nmap <leader>l :set list!<CR>

" Soft tabs
set ts=4 sts=2 sw=2 expandtab

"Ctrl-t to insert a hard tab
imap <C-t> <C-v><tab>

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Enable filetype detection
  filetype plugin indent on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType css  setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType haml setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType erb  setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
  " Treat .scss files as css
  autocmd BufNewFile,BufRead *.scss setfiletype css
  " Treat .coffee files as javascript
  autocmd BufNewFile,BufRead *.coffee setfiletype javascript
  " Treat .md files as markdown, not as Modula-2
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown

  " save and load code folding
  " autocmd BufWinLeave ?* mkview
  " autocmd BufWinEnter ?* silent loadview

  " When editing a file jump to last cursor position
  autocmd BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |
   \ endif

  " Source the vimrc file after saving it
  autocmd bufwritepost .vimrc source $MYVIMRC

  " To create new file securely do: vim new.file.txt.gpg
  " Your private key used to decrypt the text before viewing should
  " be protected by a passphrase. Alternatively one could use
  " a passphrase directly with symmetric encryption in the gpg commands below.
  autocmd BufNewFile,BufReadPre *.gpg :set secure viminfo= noswapfile nobackup nowritebackup history=0 binary
  autocmd BufReadPost *.gpg :%!gpg -d 2>/dev/null
  autocmd BufWritePre *.gpg :%!gpg -e -r $GPGKEY 2>/dev/null
  autocmd BufWritePost *.gpg u
endif

" Switch between buffers
noremap <tab> gt
noremap <S-tab> gT

" close buffer
nmap <leader>d :bd<CR>

" close all buffers
nmap <leader>D :bufdo bd<CR>

" move down/up single row
nnoremap j gj
nnoremap k gk

" Swith focus in open windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" movement on commandline
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>

" Toggle the taglist window
map <leader>t :TlistToggle<CR>

" Toggle spell checking on and off
nmap <leader>s :set spell!<CR>

" when pasting text keep formatting
nmap <leader>p :set paste!<CR>

" Set region to US English
set spelllang=en_us

" Code reviewing
let g:CodeReviewer_reviewer="JB"  " Your initials
let g:CodeReviewer_reviewFile=$HOME . "/code_review_JB.rev"

" Enable syntax highlighting
syntax on

" When ANSI 16 not used
" let g:solarized_termcolors=256

" Color scheme
set background=dark
colorscheme solarized

" Shortcut to edit the vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" Highlight lines that are too long
highlight OverLength ctermbg=darkgray ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" remember some stuff after quiting vim:
" marks, registers, searches, buffer list
set viminfo='20,<50,s10,h,%

" use ack-grep instead of grep
set grepprg=ack-grep

" textobj-rubyblock requires matchit.vim
runtime macros/matchit.vim

" Run rspec test on current file in env test
map <leader>m :w\|:!BOKDATA_ENV=test ruby -I '.' -S rspec %<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REMOVE TRAILING SPACES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <expr> %% expand('%:h').'/'
map <leader>e :edit %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" InsertTime COMMAND
" Insert the current time
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FindConditionals COMMAND
" Start a search for conditional branches, both implicit and explicit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! FindConditionals :normal /\<if\>\|\<unless\>\|\<and\>\|\<or\>\|||\|&&<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Selecta Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

function! SelectaFile(path)
  call SelectaCommand("find " . a:path . "/* -type f", "", ":e")
endfunction

nnoremap <leader>f :call SelectaFile(".")<cr>
