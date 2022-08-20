function! UrlEncode()
    let l:encodeMap = GetEncodeMap()

    call s:ReplaceBy(l:encodeMap)
endfunction

function! s:ReplaceBy(replaceMapping)
    let l:mapping = a:replaceMapping

    for l:targetChar in keys(l:mapping)
        let l:replaceStr = l:mapping[l:targetChar]

        execute "silent! %s\/". l:targetChar . "\/" . l:replaceStr . "\/g"
    endfor
endfunction

function! UrlDecode()
    let l:decodeMap = GetDecodeMap()

    call s:ReplaceBy(l:decodeMap)
endfunction

function! Base64Encode()
endfunction

function! Base64Decode()
endfunction

" \ %: %25,
function! GetEncodeMap()
    return {
        \ " ": "%20",
        \ "!": "%21",
        \ '"': "%22",
        \ "#": "%23",
        \ "$": "%24",
        \ "&": "%26",
        \ "'": "%27",
        \ "(": "%28",
        \ ")": "%29",
        \ "*": "%2A",
        \ "+": "%2B",
        \ ",": "%2C",
        \ "-": "%2D",
        \ "\\.": "%2E",
        \ "\\/": "%2F",
        \ ":": "%3A",
        \ ";": "%3B",
        \ "<": "%3C",
        \ "=": "%3D",
        \ ">": "%3E",
        \ "?": "%3F",
        \ "@": "%40",
        \ "[": "%5B",
        \ "\\": "%5C",
        \ "]": "%5D",
        \ "^": "%5E",
        \ "_": "%5F",
        \ "`": "%60",
        \ "{": "%7B",
        \ "|": "%7C",
        \ "}": "%7D",
        \ "~": "%7E",
        \ "\\r": "%0D",
        \ "\\n": "%0A",
        \"・": "%E3%83%BB",
        \"（": "%EF%BC%88",
        \"）": "%EF%BC%89",
        \"－": "%EF%BC%8D",
        \"、": "%E3%80%81",
        \"＿": "%EF%BC%BF",
        \"：": "%EF%BC%9A",
        \"　": "%E3%80%80",
    \}
endfunction

function! GetDecodeMap()
    let l:encodeMap = GetEncodeMap()
    let l:result = {}

    let l:encode = ""
    for [l:key, l:value] in items(l:encodeMap)
        call extend(l:result, {l:value: l:key})
    endfor

    return l:result
endfunction

nnoremap <leader>ure :call UrlEncode()<CR>
nnoremap <leader>urd :call UrlDecode()<CR>
