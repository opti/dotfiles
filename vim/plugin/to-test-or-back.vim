fu! s:toTestOrBack()
  let postfixes = ['_test', '_spec']
  let psfx_joined = join(postfixes, '\|')
  let fname = expand("%:t")
  let isTest = match(fname, '\m\(' . psfx_joined . '\)\..*$') != -1

  let toFind = []

  if isTest
    call add(toFind, substitute(fname, '\m\(' . psfx_joined . '\)\(\..*$\)', '\2', 'g'))
  else
    for p in postfixes
      call add(toFind, substitute(fname, '\m\..*$', p . '\0', 'g'))
    endfor
  endif

  let toOpen = []

  for fileForFind in toFind
    let output = system('find . -name ' . shellescape(fileForFind))
    for f in split(output, '\n')
      call add(toOpen, f)
    endfor
  endfor

  let filesNum = len(toOpen)

  if filesNum == 0
    echo isTest ? "No test/spec file to open!" : "No file to open!"
  elseif filesNum == 1
    exec 'e ' . toOpen[0]
  else
    let lst = ["Select file: "]
    let i = 1
    for f in toOpen
      call add(lst, string(i) . ') ' . f)
      let i += 1
    endfor

    let fnum = inputlist(lst) - 1
    if fnum >=0 && fnum < filesNum
      exec 'e ' . toOpen[fnum]
    endif
  endif
endfu

command! A call s:toTestOrBack()
