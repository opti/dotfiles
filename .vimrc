" Igor Pstyga's .vimrc file
" Based on https://github.com/vadimr/dotfiles/blob/master/.vimrc

execute pathogen#infect()

set nocompatible

" Set encoding
set encoding=utf-8
set clipboard=unnamed

" Remap leader
if has('eval')
  let mapleader=","
end

set hidden
set history=1000
set scrolloff=3
set backspace=indent,eol,start

" Whitespace stuff
set wrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
set autoindent

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" incomplete commands
set showcmd
" always show cursor position
set ruler
set number

" visualvbell instead of beeping
set vb

syntax on

" Undo
if has("persistent_undo")
  set undodir=~/.vim/tmp/undo
  set undofile
endif

" Backup
set backupdir=~/.vim/tmp/backup
set directory=~/.vim/tmp/swap
set backup

" Tab completion
set wildmenu
set wildmode=longest,list
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore+=vendor/**,public/*,log/*,tmp/*,coverage/**

" Capfile, lGemfile, Rakefile, Vagrantfile, Thorfile, Guardfile, config.ru and .opener files are ruby
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Vagrantfile,Thorfile,Guardfile,config.ru,.opener,.env} set ft=ruby
" json is javascript
au BufNewFile,BufRead *.json set ft=javascript
" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
" c - http://www.kernel.org/doc/Documentation/CodingStyle
au FileType c set softtabstop=8 tabstop=8 shiftwidth=8 textwidth=79
" html.erb is eruby
au BufNewFile,BufRead {*.html.erb,*.yml} set filetype=eruby
" 78 width for text files
au FileType text setlocal textwidth=78

au BufNewFile,BufRead *.conf set ft=config

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

if has("gui_running")
  set guicursor=a:block
  " always show last status
  set ls=2

  " remove menu...
  set guioptions=egmrt
  " remove scrollbars
  set guioptions-=r
  set guifont=Meslo\ LG\ S\ for\ Powerline:h12
  " set guifont=Monaco:h12
  " line padding
  set lsp=1

  " highlighting of cursor line
  set cursorline

  set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
  set laststatus=2
  set ambiwidth=single
  set fillchars+=stl:\ ,stlnc:\
  " set noshowmode

  set guioptions-=T " hide toolbar
  set lines=55 columns=207

  colorscheme railscasts
endif

if has('gui_macvim')
  nmap <SwipeLeft> :bN<CR>
  nmap <SwipeRight> :bn<CR>
  nmap <D-{> :bp<CR>
  nmap <D-}> :bn<CR>
endif

" set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё~

" Change buffers
map <C-h> :bp<CR>
map <C-l> :bn<CR>

" nnoremap <CR> :noh<cr>
nnoremap <cr> :noh<CR><CR>:<backspace>

" Match brackets by tab
nnoremap <tab> %
vnoremap <tab> %

" Jumps by 5 lines
map <C-j> 5j
map <C-k> 5k

" Custom commands
command! Rb setf ruby
command! Py setf python
command! Js setf javascript
command! Rc e $MYVIMRC
command! Profile e ~/.profile
command! Ctags !ctags --exclude=*.{sql,js,log} --exclude=public -R *
command! RemoveTrailingSpaces %s/\s\+$//e

" CommandT
let g:CommandTAlwaysShowDotFiles=1
let g:CommandTMatchWindowAtTop=1

map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT spec<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gj :CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>

" minibuf
let g:miniBufExplSplitBelow=0

" ragtag
let g:ragtag_global_maps = 1

" NERDTree
map <Leader>n :NERDTreeFind<CR>
let g:NERDTreeWinPos = "right"

" Quick run
map <Leader>r :QuickRun<CR>

" Cab vim
let g:cab_ack_cmd = "ack -Qi"

" Ag
let g:ackprg = 'ag --nogroup --nocolor --column'

" html indentation
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Custom functions
fun! s:smallWindow()
  if exists("+lines")
    set lines=22
  endif
  if exists("+columns")
    set columns=80
  endif
endf

command! Small call s:smallWindow()

fun! s:smallTopWindow()
  let bounds = system("osascript -e 'tell application \"Finder\" to get bounds of window of desktop'")
  let screenWidth = split(bounds, ', ')[2]
  let centerX = screenWidth / 2 - 700

  call s:smallWindow()
  exe 'winpos ' . centerX . ' 300'
endf

command! SmallTop call s:smallTopWindow()

fun! s:smallRuby()
  call s:smallTopWindow()
  set filetype=ruby
endf

command! SmallRuby call s:smallRuby()

" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Command for opening last file from indicated directory
function! EditLastFileFromDir(dir, ...)
  let all_files = glob(a:dir . "/*")
  let str_index = get(a:000, 0)
  let index = -1 - str2nr(str_index)

  if len(all_files) > 0
    let last_file_name = split(all_files)[index]
    exe 'e ' . last_file_name
  endif
endfunction

command! -nargs=+ -complete=dir Elast call EditLastFileFromDir(<f-args>)

" Next mapping is adopted from destroyallsoftware.com screencasts
" expand path of directory of current file typing %% in command mode
cnoremap %% <C-R>=expand('%:h').'/'<cr>
" map ,e to open files in the same directory as current file
map <leader>e :edit %%

map -a :call SyntaxAttr()<CR>
