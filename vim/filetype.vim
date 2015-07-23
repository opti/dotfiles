if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.ex setfiletype elixir
  au! BufRead,BufNewFile *.exs setfiletype elixir
  au! BufRead,BufNewFile *.md setfiletype markdown
augroup END
