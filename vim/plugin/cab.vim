if system("uname") !~ '\cdarwin'
  echo "cab.vim: you can use cab.vim only on the Mac OS X"

elseif empty(system("which ack"))
  echo "cab.vim: ack is not installed, you can install the ack using the Homebrew ($ brew install ack)"

else

  function! s:getVisual() range
    let reg_save = getreg('"')
    let regtype_save = getregtype('"')
    let cb_save = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', reg_save, regtype_save)
    let &clipboard = cb_save
    return selection
  endfunction

  let s:srcfile = expand("<sfile>")
  let s:srcdir = fnamemodify(s:srcfile, ":p:h")
  let s:applescript_file =  s:srcdir . "/cab.applescript"

  if !filereadable(s:applescript_file)
    echo "cab.vim: cab.applescript file should be placed in the same directory as the cab.vim file"
  endif

  if !exists('g:cab_ack_cmd')
    let g:cab_ack_cmd = "ack -Q"
  endif

  function! CabSearch(...) range
    let arg = a:0 > 0 ? a:1 : expand("<cword>")
    let search_str = empty(arg) ? s:getVisual() : arg

    let search_str = substitute(search_str, "'", "'\\\\''", 'g')
    let cwd = getcwd()
    let cmd = "osascript " . s:applescript_file . " '" . g:cab_ack_cmd . "' " . cwd . " '" . search_str . "'"
    call system(cmd)
  endfunction

  command! -range -nargs=? Cab call CabSearch(<f-args>)
  nmap <Leader>f :Cab<CR>
  vmap <Leader>f :<C-U>call CabSearch("")<CR>

endif
