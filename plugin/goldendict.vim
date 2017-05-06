" goldendict
" Author:   jiazhoulvke
" Email:    jiazhoulvke@gmail.com 
" Blog:     http://www.jiazhoulvke.com 
" Version:  0.1
" --------------------------------------

if exists('g:goldendict_loaded')
    finish
endif
let g:goldendict_loaded= 1

if !exists('g:goldendict_cmd')
    let g:goldendict_cmd='goldendict'
endif

if !exists('g:goldendict_translate_key')
    let g:goldendict_translate_key='<F12>'
endif

if !exists('g:goldendict_translate_command')
    let g:goldendict_translate_command='GoldenDict'
endif

if !exists('g:goldendict_nomap')
    let g:goldendict_nomap=0
endif

if !exists('g:goldendict_nocmd')
    let g:goldendict_nocmd=0
endif

function! GoldenDict(word)
    call system(g:goldendict_cmd.' '.a:word)
endfunction

function! GoldenDict_Selected_String()
    normal `<
    normal v
    normal `>
    silent normal "ty
    return GoldenDict(@t)
endfunction

if g:goldendict_nomap == 0
    exe 'nmap <silent> ' . g:goldendict_translate_key . " :echo GoldenDict(expand('<cword>'))<CR>"
    exe 'vmap <silent> ' . g:goldendict_translate_key . " <ESC>:echo GoldenDict_Selected_String()<CR>"
endif

if g:goldendict_nocmd == 0
    exe 'command! -nargs=+ ' . g:goldendict_translate_command . " :call GoldenDict(<q-args>)"
endif

" vim: ft=vim
