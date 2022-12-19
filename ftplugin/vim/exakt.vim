if exists('b:did_ftplugin')
    finish
endif

nnoremap <script> <buffer> <expr> K
    \ ':help '..<sid>ExaktHelpTagUnderCursor()..'<cr>'

function <sid>ExaktHelpTagUnderCursor()
    let pattern = '\v\c(%#\\.)|(\\%#.)|'..
        \ '(\w?:|\<)?<[-#[:alnum:]_]*%#[-#[:alnum:]_]+>[>(]?'

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
