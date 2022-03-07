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

function! s:get_visual_selection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

function! GoldenDict(...)
	if len(a:000) > 0 && a:1 != ''
		let word = a:1
	else
		let word = <SID>get_visual_selection()
	endif
	if word == ''
		return
	endif
	if exists('*jobstart')
		call jobstart([g:goldendict_cmd, word], { 'detach': v:true } )
	elseif exists('*job_start')
		let s:job = job_start([g:goldendict_cmd,word],{"stoponexit":""})
	else
		call system(g:goldendict_cmd.' '.word)
	endif
endfunction

if g:goldendict_nomap == 0
    exe 'nmap <silent> ' . g:goldendict_translate_key . " :echo GoldenDict(expand('<cword>'))<CR>"
    exe 'vmap <silent> ' . g:goldendict_translate_key . ' :' . g:goldendict_translate_command . '<CR>'
endif

if g:goldendict_nocmd == 0
    exe 'command! -nargs=* -bang -range ' . g:goldendict_translate_command . " :call GoldenDict(<q-args>)"
endif

" vim: ft=vim
