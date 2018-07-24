" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "default"

fun! s:M(a)
    return strpart("0245", a:a, 1) + 0
endfun

" map a urxvt colour to an xterm-256 colour
fun! s:X(a)
    if &t_Co == 88
        return a:a
    else
        if a:a == 8
            return 237
        elseif a:a < 16
            return a:a
        elseif a:a > 79
            return 232 + (3 * (a:a - 80))
        else
            let l:b = a:a - 16
            let l:x = l:b % 4
            let l:y = (l:b / 4) % 4
            let l:z = (l:b / 16)
            return 16 + s:M(l:x) + (6 * s:M(l:y)) + (36 * s:M(l:z))
        endif
    endif
endfun

function! s:choose(mediocre,good)
    if &t_Co != 88 && &t_Co != 256
        return a:mediocre
    else
        return s:X(a:good)
    endif
endfunction

function! s:hifg(group,guifg,first,second,...)
    if a:0 && &t_Co == 256
        let ctermfg = a:1
    else
        let ctermfg = s:choose(a:first,a:second)
    endif
    exe "highlight ".a:group." guifg=".a:guifg." ctermfg=".ctermfg
endfunction

"call s:hifg("Statement"        ,"#9933CC","DarkMagenta",34)
call s:hifg("Statement"     ,"#FFCC00","Yellow",72) " 220
call s:hifg("Type"     ,"#FFCC00","Yellow",72) " 220
"call s:hifg("Normal"     ,"#FFCC00","Yellow",72) " 220
"hi Normal ctermfg=darkgreen
hi Normal ctermfg=green
hi Comment ctermfg=darkgrey

"call s:hifg("Statement"        ,"#9933CC","DarkMagenta",34)

" vim: sw=2
