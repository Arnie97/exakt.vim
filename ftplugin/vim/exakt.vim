if exists('b:did_ftplugin')
    finish
endif

let b:undo_ftplugin = 'set iskeyword<'

setlocal iskeyword+=#,-

nnoremap <script> <buffer> <expr> K
    \ (&keywordprg !~ '^:'? ':help': &keywordprg)
    \ ..' '..<sid>ExaktHelpTagUnderCursor()..'<cr>'

function <sid>ExaktHelpTagUnderCursor()
    let pattern = '\v\c(%#\\.)|(\\%#.)|\<?<\k*%#\k+>[>(]?'

    let start = searchpos(pattern, 'bcnW', line('.'))[1]
    if !start
        return expand('<cword>')
    endif

    let end = searchpos(pattern, 'ecnW', line('.'))[1]
    if !end
        return expand('<cword>')
    endif

    return strpart(getline('.'), start - 1, end - start + 1)
endfunction
