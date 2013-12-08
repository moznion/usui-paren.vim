let s:save_cpo = &cpo
set cpo&vim

command! -nargs=0 UsuiParenActivate call usui_paren#activate()
command! -nargs=0 UsuiParenClear    call usui_paren#clear()
command! -nargs=0 UsuiParenToggle   call usui_paren#toggle()

let &cpo = s:save_cpo
unlet s:save_cpo
