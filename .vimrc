" Muestra bien los caracteres usando UTF-8
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" ========================================================================
" Vundle stuff
" ========================================================================
set nocompatible " Required by vundle
filetype off     " Required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My bundles
" =========================

" Supertab allows you to use <Tab> for all your insert completion needs (:help ins-completion).
Plugin 'ervandew/supertab'

" Adds CoffeeScript support to vim. It covers syntax, indenting, compiling, and more.
Plugin 'kchmck/vim-coffee-script'

" Search and replace across many files.
" Use :Gsearch to get a buffer window of your search results then you can make the replacements
" inside the buffer window using traditional tools (s/foo/bar/) and invoke :Greplace to make your changes.
Plugin 'skwp/greplace.vim'

" Provides easy to use, file-type sensible comments for Vim. It works like a toggle.
Plugin 'tomtom/tcomment_vim'

" Lightweight support for Ruby's Bundler
Plugin 'tpope/vim-bundler'

" Provides syntax highlighting, indenting, and some editing commands for Cucumber
Plugin 'tpope/vim-cucumber'

" Asynchronous build and test dispatcher
Plugin 'tpope/vim-dispatch'

" Helps to end certain structures automatically. In Ruby, adds end after if, do, def and other keywords.
Plugin 'tpope/vim-endwise'

" A Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'

" Ruby on Rails power tools
Plugin 'tpope/vim-rails'

" enable repeating supported plugin maps with '.'
Plugin 'tpope/vim-repeat'

" Provides mappings to easily delete, change and add such surroundings in pairs.
Plugin 'tpope/vim-surround'

" Pairs of handy bracket mappings
Plugin 'tpope/vim-unimpaired'

" Vim configuration files for editing and compiling Ruby within Vim
Plugin 'vim-ruby/vim-ruby'

" Fast file navigation for VIM
" Plugin 'wincent/Command-T'

" A tree explorer plugin for vim.
Plugin 'scrooloose/nerdtree'

" Provides a much simpler way to use some motions in vim <leader><leader>
Plugin 'Lokaltog/vim-easymotion'

" Syntax checking plugin for Vim that runs files through external syntax checkers
Plugin 'scrooloose/syntastic'

" Fuzzy file, buffer, mru, tag, etc finder
Plugin 'kien/ctrlp.vim'

" Snippets in Vim
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Grammar checker for English, French, German (etc.)
Plugin 'vim-scripts/LanguageTool'

" Visually select increasingly larger regions of text using the same key combination
Plugin 'terryma/vim-expand-region'

" nelstrom's plugin depends on kana's
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-fireplace'

" Colors
Plugin 'nanotech/jellybeans.vim'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" JavaScript
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'einars/js-beautify'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'majutsushi/tagbar'

" =========================

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Use the colorscheme from above
colorscheme jellybeans

" ========================================================================
" Ruby stuff
" ========================================================================
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?

  " Clojure
  autocmd FileType clojure setlocal colorcolumn=80
  autocmd FileType clojure map <Leader>t :!lein test %<cr>
augroup END

" Enable built-in matchit plugin
runtime macros/matchit.vim
" ================

" ========================================================================
" JavaScript stuff
" ========================================================================
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" ================

let mapleader = " "

map <Leader>ac :sp app/controllers/application_controller.rb<cr>
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
map <Leader>bb :!bundle install<cr>
nmap <Leader>bi :source ~/.vimrc<cr>:PluginInstall<cr>
vmap <Leader>bed "td?describe<cr>obed<tab><esc>"tpkdd/end<cr>o<esc>:nohl<cr>
map <Leader>cc :!cucumber --drb %<CR>
map <Leader>cu :Tabularize /\|<CR>
map <Leader>co ggVG"*y
map <Leader>cc :Rjcollection client/
map <Leader>cj :Rjspec client/
map <Leader>cm :Rjmodel client/
map <Leader>cs :call SearchForCallSites()<CR>
map <Leader>ct :Rtemplate client/
map <Leader>cv :Rjview client/
map <Leader>cn :e ~/Dropbox/notes/coding-notes.txt<cr>
map <Leader>d orequire 'pry'<cr>binding.pry<esc>:w<cr>
map <Leader>dr :e ~/Dropbox<cr>
map <Leader>dj :e ~/Dropbox/notes/debugging_journal.txt<cr>
map <Leader>ec :e ~/code/
map <Leader>gac :Gcommit -m -a ""<LEFT>
map <Leader>gc :Gcommit -m ""<LEFT>
map <Leader>gs :Gstatus<CR>
map <Leader>gw :!git add . && git commit -m 'WIP' && git push<cr>
map <Leader>f :call OpenFactoryFile()<CR>
map <Leader>fix :cnoremap % %<CR>
map <Leader>fa :sp test/factories.rb<CR>
map <Leader>h :CommandT<CR>
map <Leader>i mmgg=G`m<CR>
map <Leader>j :CommandT app/assets/javascripts<cr>client/
map <Leader>l oconsole.log 'debugging'<esc>:w<cr>
map <Leader>m :Rmodel 
map <Leader>nn :sp ~/Dropbox/notes/programming_notes.txt<cr>
map <Leader>o :w<cr>:call RunCurrentLineInTest()<CR>
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
map <Leader>pn :sp ~/Dropbox/work/thoughtbot/notes/project-notes.txt<cr>
map <Leader>ra :%s/
map <Leader>rd :!bundle exec rspec % --format documentation<CR>
map <Leader>rf :CommandTFlush<CR>:CommandT<CR>
map <Leader>rs :vsp <C-r>#<cr><C-w>w
map <Leader>rt q:?!ruby<cr><cr>
map <Leader>rw :%s/\s\+$//<cr>:w<cr>
map <Leader>sc :sp db/schema.rb<cr>
map <Leader>sg :sp<cr>:grep 
map <Leader>sj :call OpenJasmineSpecInBrowser()<cr>
map <Leader>sm :RSmodel 
map <Leader>sp yss<p>
map <Leader>sn :e ~/.vim/snippets/ruby.snippets<CR>
map <Leader>so :so %<cr>
map <Leader>sq j<c-v>}klllcs<esc>:wq<cr>
map <Leader>ss ds)i <esc>:w<cr>
map <Leader>st :!ruby -Itest % -n "//"<left><left>
map <Leader>su :RSunittest 
map <Leader>sv :RSview 
map <Leader>t :w<cr>:call RunCurrentTest()<CR>
map <Leader>y :!rspec --drb %<cr>
map <Leader>u :Runittest<cr>
map <Leader>vc :RVcontroller<cr>
map <Leader>vf :RVfunctional<cr>
map <Leader>vg :vsp<cr>:grep 
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>vu :RVunittest<CR>
map <Leader>vm :RVmodel<cr>
map <Leader>vv :RVview<cr>
map <Leader>w <C-w>w
map <Leader>x :exec getline(".")<cr>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

map <C-h> :nohl<cr>
" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c
" map <C-n> :cn<CR>
" map <C-p> :cp<CR>

" Map <leader>w to :w!
map <leader>w :w!<CR>

" Like Ctrl-w in Insert mode but to the other side
imap <C-d> <C-o>dw

" Like Ctrl-h in Insert mode but to the other side
imap <C-l> <C-o>x

" Ctrl-P maps
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Para sacarme un mal hábito (moverme del homerow)
inoremap <BS> <C-o>:echoe 'Usa <CTRL-h> para mover menos las manos'<CR>

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=500		" keep 500 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set autoindent
set showmatch
set nowrap
set showbreak=\ \ >\ 
set cpoptions+=n
set formatoptions+=l
set lbr
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
set autoread
set wmh=0
set viminfo+=!
set guioptions-=T
set et
set sw=2
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2  " Always show status line.
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent " always set autoindenting on
set bg=light

" Set the tag file search order
set tags=./tags;

" Use _ as a word-separator
" set iskeyword-=_

" Use Silver Searcher instead of grep
set grepprg=ag

" Make the omnicomplete text readable
:highlight PmenuSel ctermfg=black

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

" Format xml files
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null" 

set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.

set nofoldenable " Say no to code folding...

command! Q q " Bind :Q to :q
command! Qall qall 

" Disable Ex mode
map Q <Nop>

au BufNewFile,BufRead *.txt setlocal nolist " Don't display whitespace

" Better? completion on command line
set wildmenu
" What to do when I press 'wildchar'. Worth tweaking to see what feels right.
set wildmode=list:full

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

" Copy paragraph to clipboard
nmap <C-c> "+yip`]

" Open markdown files with Chrome.
autocmd BufEnter *.md exe 'noremap <F5> :!start  C:\Program Files\Google\Chrome\Application\chrome.exe %:p<CR>'

" Lenguage tool config
let g:languagetool_jar='C:\LanguageTool-2.7\languagetool-commandline.jar'

" Turn on spell-checking in markdown and text.
au BufRead,BufNewFile *.md,*.txt setlocal spell
au BufRead,BufNewFile *.md,*.txt set wrap

" Toggle spell checking on and off with `,s`
map <silent> <leader>ts :set spell!<CR>

" Set spell-cheging language to Spanish
set spelllang=es

" Set spell highlight style
if version >= 700
  hi SpellBad   guisp=red    gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=underline
  hi SpellCap   guisp=yellow gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=underline
  hi SpellRare  guisp=blue   gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=underline
  hi SpellLocal guisp=orange gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=underline
endif

" Toggle between relative and normal line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    call SetRelativeNumberOff()
  else
    call SetRelativeNumberOn()
  endif
endfunc
function! SetRelativeNumberOn()
    set nonumber
    set relativenumber
endfunction
function! SetRelativeNumberOff()
    set number
    set norelativenumber
endfunction

nnoremap <C-n> :call NumberToggle()<cr>

" Automatic toggle relative line numbers
autocmd FocusLost * :call SetRelativeNumberOff()
autocmd FocusGained * :call SetRelativeNumberOn()
autocmd InsertEnter * :call SetRelativeNumberOff()
autocmd InsertLeave * :call SetRelativeNumberOn()

" Merge a tab into a split in the previous window
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction

nmap <C-W>u :call MergeTabs()<CR>


" Squash all commits into the first during rebase
function! SquashAll()
  normal ggj}klllcf:w
endfunction

" Search for call sites for word under cursor (excluding its definition) and
" load into the quickfix list.
function! SearchForCallSites()
  let searchTerm = expand("<cword>")

  cexpr system('ag ' . searchTerm . '\| grep -v def')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!bin/cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("!bin/rspec")
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec "!bin/rspec" g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap <Tab> <C-P>

" Let's be reasonable, shall we?
nmap k gk
nmap j gj


" Set up some useful Rails.vim bindings for working with Backbone.js
autocmd User Rails Rnavcommand template    app/assets/templates               -glob=**/*  -suffix=.jst.ejs
autocmd User Rails Rnavcommand jmodel      app/assets/javascripts/models      -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jview       app/assets/javascripts/views       -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jcollection app/assets/javascripts/collections -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jrouter     app/assets/javascripts/routers     -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jspec       spec/javascripts                   -glob=**/*  -suffix=.coffee

" Don't add the comment prefix when I hit enter or o/O on a comment line.
set formatoptions-=or


function! OpenJasmineSpecInBrowser()
  let filename = expand('%')
  "                  substitute(exprsson, pattern,            substitution,    flags)
  let url_fragment = substitute(filename, "spec/javascripts", "evergreen/run", "")
  let host_fragment = "http://localhost:3001/"
  let url = host_fragment . url_fragment
  silent exec "!open ~/bin/chrome" url
endfunction

" Statusline format
set statusline+=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

let g:CommandTMaxHeight=50
let g:CommandTMatchWindowAtTop=1

" Don't wait so long for the next keypress (particularly in ambigious Leader
" situations.
set timeoutlen=500

" Don't go past 100 chars on levelup:
autocmd BufNewFile,BufRead /Users/ben/code/levelup/*.rb set colorcolumn=100

" Remove trailing whitespace on save for ruby files.
au BufWritePre *.rb :%s/\s\+$//e

function! OpenFactoryFile()
  if filereadable("test/factories.rb")
    execute ":sp test/factories.rb"
  else
    execute ":sp spec/factories.rb"
  end
endfunction

" Set gutter background to black
highlight SignColumn ctermbg=black

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <Leader>n :call RenameFile()<cr>

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Make it more obvious which paren I'm on
hi MatchParen cterm=none ctermbg=black ctermfg=yellow

" ========================================================================
" End of things set by me.
" ========================================================================

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

" Setea font en gVim
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Consolas 15
  elseif has("gui_photon")
    set guifont=Consolas:s15
  else
    set guifont=Consolas:h15:cDEFAULT
  endif
endif

" Cursor lindo
highlight Cursor guifg=white guibg=#ffb600
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" Permite que Vim detecte el directorio para crear archivos temporarios
" en Windows
set directory+=.,$TMP,$TEMP

" Mis mappings
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Auto close tags
:iabbrev <silent> </ </<C-x><C-o>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Map to edit .vimrc
nmap <leader>ev :tabedit $MYVIMRC<CR>

" Syntastic Plugin configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Tagbar config
nmap <F8> :TagbarToggle<CR>

" Toggle for line at cursor to be always vertically aligned
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

" UltiSnips configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Expand region plugin mappings
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)
