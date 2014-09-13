let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @SQL syntax/pgsql.vim
let b:current_syntax = s:bcs
" match optional, surrounding single or double quote and any whitespace in the heredoc name
syntax region rubyHereDocSQL matchgroup=Statement start=+<<-\?\z(SQL\)+ end=+^\s*\z1$+ contains=@SQL
