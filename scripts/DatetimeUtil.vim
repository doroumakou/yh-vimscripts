vim9script

const TIME_GAP_JST_GMT: number = 60 * 60 * 9
const TIME_FORMAT_GMT: string = '%Y-%m-%dT%H:%M:%S+09:00'

def g:PrintCurrentDatetime(dateFormat: string)
    var format = dateFormat

    if empty(format)
        format = '%Y-%m-%d'
    endif

    var datetimeStr = strftime(format)

    execute $'normal! o{datetimeStr}'
enddef

def g:PrintGmt()
    var gmttime = localtime() - TIME_GAP_JST_GMT
    var datetimeStr = strftime(TIME_FORMAT_GMT, gmttime)

    execute $'normal! o{datetimeStr}'
enddef

nnoremap <leader>da :call g:PrintCurrentDatetime('%Y/%m/%d')<CR>
nnoremap <leader>dt :call g:PrintCurrentDatetime('%Y/%m/%d %T')<CR>
nnoremap <leader>gmt :call g:PrintGmt()<CR>
