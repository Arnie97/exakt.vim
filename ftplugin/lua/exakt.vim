if exists('b:did_ftplugin')
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

let s:path = expand('%:p')

if s:path =~# '/nvim/' && s:path =~# '/lua/'
    let b:undo_ftplugin = 'set iskeyword<'
    setlocal keywordprg=:help
    setlocal iskeyword+=#,-

    nnoremap <script> <buffer> <expr> K
        \ (&keywordprg !~ '^:'? ':help': &keywordprg)
        \ .' '.exakt#HelpTagUnderCursor().'<cr>'
endif

let &cpo = s:save_cpo
unlet s:save_cpo

" vi: set ts=4 sw=4 et ff=unix :
