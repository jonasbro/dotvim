runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" non vi mode
set nocompatible

" code folding
set foldmethod=indent

" Shortcut to rapidly toggle the showing of invicibles
nmap <leader>l :set list!<CR>

" Shortcut to rapidly toggle the highlighting of searches
nmap <leader>h :set hlsearch!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Soft tabs
set ts=4 sts=2 sw=2 expandtab

" Color scheme
colorscheme vibrantink

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

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

  " save and load code folding
  " autocmd BufWinLeave ?* mkview
  " autocmd BufWinEnter ?* silent loadview
endif

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

" Swith focus in open windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" modified buffers are called hidden
set hidden

" show line numbers
set number

" word wrap
set wrap linebreak nolist

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>

" Set region to US English
set spelllang=en_us

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on

  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" Enable syntax highlighting
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Shortcut to edit the vimrc
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

" Highlight lines that are too long
highlight OverLength ctermbg=darkgray ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
