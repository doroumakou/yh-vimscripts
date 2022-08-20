vim9script

" load config file
export def loadConfig(fileName: string)
    return loadMapping(fileName, '=')
enddef

" load file to array
export def loadFile(fileName: string)
    var rows = []
    if filereadable(fileName)
        var rows = readfile(fileName, '')
    endif

    return rows
enddef

" load file to dict
def loadMapping(fileName: string, seperator: string)
    var rows = loadFile(fileName)

    if empty(rows)
        redraw!
        echon $'file: {fileName} not found'
        return 0
    endif

    var results = {}
    for row in rows
        if empty(row)
            continue
        else
            var cols = split(row, seperator, '1')
            extend(results, {cols[0]: cols[1]})
        endif
    endfor

    return results
enddef
