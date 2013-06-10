" Igor Pstyga's .vimrc file
" Based on https://github.com/vadimr/dotfiles/blob/master/.vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set encoding=utf-8              "Set encoding
set clipboard=unnamed
set ruler                       "Always show cursor position

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Remap leader
if has('eval')
  let mapleader=","
end

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set ignorecase
set viminfo='100,f1  "Save up to 100 marks, enable capital marks
set smartcase

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/tmp/undo > /dev/null 2>&1
set undodir=~/.vim/tmp/undo
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set wrap
" set nowrap       "Don't wrap lines
" set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=.git
set wildignore+=*.rbc
set wildignore+=*.gem
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**,vendor/cache/**,vendor/gems/**
set wildignore+=public/*,coverage/**
set wildignore+=log/**,tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


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

autocmd Filetype gitcommit setlocal spell textwidth=72

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
  set lsp=2

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

set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё~


if has('gui_macvim')
  nmap <SwipeLeft> :bN<CR>
  nmap <SwipeRight> :bn<CR>
  nmap <D-{> :bp<CR>
  nmap <D-}> :bn<CR>
endif

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

" Cab vim
let g:cab_ack_cmd = "ack -Qi"

" Ag
let g:ackprg = 'ag --nogroup --nocolor --column'

" html indentation
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

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

" ================ Plugins initialization ===========
" Vudnle stuff {

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'tsaleh/vim-matchit'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'rking/ag.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'thinca/vim-quickrun'

Bundle 'vadimr/bclose.vim'

filetype plugin indent on

" } Vundle

" NERDTree
map <Leader>n :NERDTreeFind<CR>
let g:NERDTreeWinPos = "right"

" Quick run
map <Leader>r :QuickRun<CR>

" minibuf
let g:miniBufExplSplitBelow = 0
let g:miniBufExplCheckDupeBufs = 0

" ragtag
let g:ragtag_global_maps = 1
