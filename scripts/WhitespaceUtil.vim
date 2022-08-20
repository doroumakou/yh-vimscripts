" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s*$//
    ''
endfunction

function! PrintFullWidthWSpace()
    g/　/p
endfunction

function! ReplaceAllFullWidthSpace()
    %s/　/ /g
    ''
endfunction

function! SwitchIndentTo(indentType) abort
    let l:regexSpace = '\( \{4}\)'
    let l:indentSpace = '    '
    let l:regexTab = '\(\t\)'
    let l:indentTab = '\t'

    let l:cmdItems = ['%s;', ';', ';g']
    let l:subsCmds = {
        \'space': [l:cmdItems[0], l:regexTab, l:cmdItems[1], l:indentSpace, l:cmdItems[2]]
        \,'tab': [l:cmdItems[0], l:regexSpace, l:cmdItems[1], l:indentTab, l:cmdItems[2]]
    \}

    let l:subsCmdItems = l:subsCmds[a:indentType]

    if empty(l:subsCmdItems)
        return 0
    endif

    let l:subsCmd = join(l:subsCmdItems, '')

    call execute(l:subsCmd, 'silent')
endfunction

nnoremap <leader>ps :call PrintFullWidthWSpace()<CR>
nnoremap <leader>rs :call ReplaceAllFullWidthSpace()<CR>
nnoremap <leader>ts :call SwitchIndentTo('space')<CR>

augroup trim_trailing_space
    au FileWritePre * call TrimWhiteSpace()
    au FileAppendPre * call TrimWhiteSpace()
    au FilterWritePre * call TrimWhiteSpace()
    au BufWritePre * call TrimWhiteSpace()
augroup END
