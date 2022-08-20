vim9script

export def DoCmds(cmdList: list<string>)
    PipeCmds(cmdList)
enddef

export def PipeCmds(cmdList: list<string>)
    var cmd = join(cmdList, ' | ')
    execute '' .. cmd
enddef

export def ExecCmds(cmdList: list<string>)
    for cmd in cmdList
        execute cmd
    endfor
enddef
