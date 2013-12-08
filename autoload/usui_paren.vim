let s:save_cpo = &cpo
set cpo&vim

" Enable highlighting
func! usui_paren#activate()
  if !exists('s:active')
    call usui_paren#load()
  endif

  if &background ==# 'dark'
    " For dark color scheme
    highlight default UsuiParen   ctermfg=238 guifg=#444444
    highlight default UsuiBrace   ctermfg=20  guifg=#0000aa
    highlight default UsuiBracket ctermfg=52  guifg=#330022
  else
    " For bright color scheme
    highlight default UsuiParen   ctermfg=81  guifg=#88aaff
    highlight default UsuiBrace   ctermfg=217 guifg=#ffaa88
    highlight default UsuiBracket ctermfg=3   guifg=#aaaa00
  endif

  let s:active = 1
endfunc

" Disable highlighting
func! usui_paren#clear()
  if !exists('s:active')
    call usui_paren#load()
  endif

  highlight clear UsuiParen
  highlight clear UsuiBrace
  highlight clear UsuiBracket

  let s:active = 0
endfunc

" Toggle highlighting status between enabled and disabled
func! usui_paren#toggle()
  let l:toggle_func = exists('s:active') && s:active ? 'clear' : 'activate'
  call call('usui_paren#'.l:toggle_func, [])
endfunc

" Load definitions of parens
func! usui_paren#load()
  syntax match UsuiParen   /[()]/
  syntax match UsuiBrace   /[{}]/
  syntax match UsuiBracket /[\[\]]/
endfunc

let &cpo = s:save_cpo
unlet s:save_cpo
