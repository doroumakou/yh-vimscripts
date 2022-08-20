vim9script

def g:EscapeXml()
    var escapeStrMap = {
        ">": "\\&gt;",
        "<": "\\&lt;",
        "'": "\\&#39;",
        "\"": "\\&quot;",
    }

    for targetChar in keys(escapeStrMap)
        var replaceStr = escapeStrMap[targetChar]
        execute $"silent! %s\/{targetChar}\/{replaceStr}\/g"
    endfor
enddef

nnoremap <leader>xml :call g:EscapeXml()<CR>
