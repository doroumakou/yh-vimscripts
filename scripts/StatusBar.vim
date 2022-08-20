set statusline=%< " trunk line

augroup gitstatusline
    au!

    autocmd BufEnter,FocusGained,BufWritePost *
        \ let b:git_status = substitute(system("git branch"), "\n", " ", "g")
augroup end

let &statusline = '%{get(b:, "git_status", "")}'
set statusline+=%t " show file name
" set statusline+=%h " show [help]
set statusline+=%m " show modified
set statusline+=%r " show [readonly]
set statusline+=%w " show [preview]
set statusline+=%y " show [filetype]
set statusline+=[%{&fileformat}] " show file format
set statusline+=[%{&fileencoding}] " show file encoding
set statusline+=%= " swtch to right
set statusline+=buf:%n\ lin:%l\,%L\ col:%c%V\ ascii:%b
