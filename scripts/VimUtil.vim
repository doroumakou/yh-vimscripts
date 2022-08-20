vim9script

command! -narg=1 Filtbuf    :call SearchList(<args>, 'ls')
command! -narg=1 Filtcmd    :call SearchList(<args>, 'com')

def SearchList(searchPattern: string, listCmd: string)
    if empty(searchPattern)
        execute '' .. listCmd
    else
        execute $'filt /{searchPattern}/ {listCmd}'
    endif
enddef
