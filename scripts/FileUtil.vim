vim9script

import './GeneralUtil.vim' as util

def g:PrintCurrentFileFullPath(): void
    WriteNewLine( expand('%:p') )
enddef

def WriteNewLine(content: string): void
    execute $"normal! o{content}"
enddef

def g:PrintCurrentFileName(): void
    WriteNewLine( expand('%:t:r') )
enddef

def g:PrintCurrentPath(): void
    WriteNewLine( expand('%:p:h') )
enddef

def g:OpenPackageXml(pkgxmlFolder: string, pkgxmlName: string)

    var cwd = getcwd()
    var filePathItems = [
        cwd,
        pkgxmlFolder,
        pkgxmlName,
    ]
    var filePath = join(filePathItems, '/')

    if filewritable(filePath)
        echom 'file not exist: ' .. filePath
    else
        execute ":tabnew " .. filePath
    endif
enddef

def SourceCurrentScript()
    var fileFullPath = expand('%:p')

    execute ":source " .. fileFullPath
enddef

def Csv2Excel()
    util.ExecCmds(
        [
            'silent! :%s;^"\|"$;;g',
            'silent! :%s;",";\t;g',
        ]
    )
enddef

def Excel2Csv()
    util.PipeCmds(
        [
            'silent! :%s;\t;",";g',
            ':%s;^;";g',
            ':%s;$;";g',
        ]
    )
enddef

command! -nargs=0 Srcthis call SourceCurrentScript()
command! -nargs=0 C2e call Csv2Excel()
command! -nargs=0 E2c call Excel2Csv()

nnoremap <leader>fp :call g:PrintCurrentFileFullPath()<CR>
nnoremap <leader>fn :call g:PrintCurrentFileName()<CR>
nnoremap <leader>fd :call g:PrintCurrentPath()<CR>
nnoremap <leader>lpk :call g:OpenPackageXml('manifest', 'package.xml')<CR>
