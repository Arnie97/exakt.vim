function exakt#HelpTagUnderCursor() abort
    let pattern = '\v\c(%#\\.)|(\\%#.)|\<?<(vim\.)?\k*%#\k+>[>(]?'

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
