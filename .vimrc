" +--------------------------------------------------------+
" |   FileName: .vimrc                                     |
" |       Desc: Personal Vim Configuration                 |
" |     Author: Joshua                                     |
" |      Email: joshua7v@hotmail.com                       |
" |   HomePage: https://blog.sigmastudio.me                |
" |    Version: 0.0.1                                      |
" | LastChange: 2016-03-23 02:28:56                        |
" |    History:                                            |
" +--------------------------------------------------------+
"
" Plugin tabular -------------------------------------------
" ;a=                       indent with =
" ;a:                       indent with :
" ;aa                       indent with custom
"
" Plugin emmet ---------------------------------------------
" C-e                       trigger
"
" Plugin a.vim ---------------------------------------------
" ;ch                       .cpp <-> .h
" ;sch                      sub window .cpp <-> .h

" Plugin a.vim ---------------------------------------------
" ;au                       add author info

" Plugin tagbar --------------------------------------------
" ;tl                       toggle tag list
" s                         change order

" Plugin Gundo ---------------------------------------------
" ;undo                     toggle undo list

" Plugin vim-surround --------------------------------------
" cs"'                      "hello world" -> 'hello world'
" ds"                       "hello world" -> hello world
" ysiw[                     hello world -> [ hello ] world
" ysiw]                     hello world -> [hello] world
" yssb / yss)               hello world -> (hello world)
" S(visual mode)

" Plugin CtrlSF (need ack)  --------------------------------
" ;sp                       search in project

" Plugin NERD Commenter  -----------------------------------
" ;cc                       comment current text
" ;cu                       uncomment current text

" Plugin DrawIt!  ------------------------------------------
" ;di                       start drawing
" ;ds                       stop drawing

" Plugin NERDtree  -----------------------------------------
" ;fl                       toggle file list
" r                         refresh
" I                         toggle display hidden files
" m                         toggle menu

" Plugin MiniBufExplorer  ----------------------------------
" ;bl                       toggle buffer explorer"
" ;ct                       switch buffer
" ;sct                      switch buffer reverse
" ;dt                       delete buffer
" ;wt                       wipeout buffer
" ;ut                       unload buffer
" d                         delete buffer
" s                         split with current window
" v                         vertical split with current window

" Plugin signature -----------------------------------------
" m                         leader
" m,                        place next mark
" m.                        toggle mark at line
" m-                        purge marks at line
" dm                        delete mark
" mda                       purge marks
" m<BS>                     purge markers
" ']                        goto next line alpha
" '[                        goto prev line alpha
" `]                        goto next spot alpha
" `[                        goto prev spot alpha
" ]'                        goto next line by pos
" ['                        goto prev line by pos
" mn                        goto next spot by pos
" mp                        goto prev spot by pos
" [+                        goto next marker
" [-                        goto prev marker
" ]=                        goto next marker any
" [=                        goto prev marker any
" ms                        list local marks
" m?                        list local mark

" Basic ----------------------------------------------------
" ;ss                       save session
" ;rs                       restore session
" ;R                        replace without confirm, not whole word
" ;rw                       replace without confirm, whole word
" ;rc                       replace with confirm, not whole word
" ;rcw / ;rwc               replace with confirm, whole word
" za                        toggle fold
" :zM                       close all folds
" :zR                       open all folds

" +--------------------------------------------------------+
" |                        Vundle                          |
" +--------------------------------------------------------+

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dyng/ctrlsf.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'Valloric/YouCompleteMe'
Plugin 'easymotion/vim-easymotion'
Plugin 'gcmt/wildfire.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'a.vim'
Plugin 'AuthorInfo'
Plugin 'Gundo'
Plugin 'DfrankUtil'
Plugin 'vimprj'
Plugin 'indexer.tar.gz'
Plugin 'The-NERD-Commenter'
Plugin 'The-NERD-tree'
Plugin 'Tagbar'
Plugin 'Indent-Guides'
Plugin 'DrawIt'
Plugin 'XSLT-syntax'
Plugin 'UltiSnips'
Plugin 'neocomplcache'
Plugin 'vim-scripts/Emmet.vim'
Plugin 'Tabular'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" +--------------------------------------------------------+
" |                        Basic                           |
" +--------------------------------------------------------+

" leader
let mapleader=","
"
filetype on
" load plugin depend on file type
filetype plugin on
" search
set incsearch
" case insensitive
set ignorecase
" highlight result
set hlsearch
" command autocomplete
set wildmenu

" shortcuts
vnoremap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>q :q<CR>
map <Leader>w :w<CR>
nmap <Leader>WQ :wa<CR>:q<CR>
nmap <Leader>Q :qa!<CR>
noremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>jw <C-W>j

" session
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" save session
au BufWinLeave * silent mkview
" restore session
au BufRead * silent loadview
" save undo history
set undodir=~/.undo_history/
set undofile
" save shortcut
map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
" restore shortcut
map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>

" theme
set background=dark
colorscheme molokai

" disable blink
set gcr=a:block-blinkon0
" disable scroll bar
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" disable menu
set guioptions-=m
set guioptions-=T

" always status bar
set laststatus=2
" current pos
set ruler
" line number
set number
" highlight current Line
set cursorline
" set cursorcolumn

" syntax
syntax enable
" allow custom
syntax on
" self indent
filetype indent on
" tab -> space
set expandtab
" space number
set tabstop=4
set shiftwidth=4
" concat space -> tab
set softtabstop=4
" fold
"set foldmethod=indent
set foldmethod=syntax
" disable fold on startup
set nofoldenable

" replacement
" no confirm not whole word
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" no confirm whole word
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" confirm not whole word
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" confirm whole word
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" confirm: need confrim
" wholeword: whether whole word
" replace: need to be replaced string
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction


" +--------------------------------------------------------+
" |                        Plugin                          |
" +--------------------------------------------------------+

" pathogen
" runtime bundle/pathogen/autoload/pathogen.vim
" Run pathogen
" execute pathogen#infect()

" Power line https://github.com/Lokaltog/vim-powerline
" let g:Powerline_colorscheme='solarized256'

" Airline

" Indent Guides https://github.com/nathanaelkane/vim-indent-guides
"let g:indent_guides_auto_colors=0
"hi IndentGuidesOdd  guibg=white   ctermbg=black
"hi IndentGuidesEven guibg=lightgray ctermbg=grey
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
" Shortcut to open/close
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" a https://github.com/vim-scripts/a.vim
" .cpp .h switch
nmap <Leader>ch :A<CR>
" .cpp .h in sub window
nmap <Leader>sch :AS<CR>

" Signature Map https://github.com/kshenoy/vim-signature
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" Ctags
nmap <Leader>tn :tnext<CR>
nmap <Leader>tp :tprevious<CR>

" Indexer http://www.vim.org/scripts/script.php?script_id=3221
" DfrankUtil http://www.vim.org/scripts/script.php?script_id=3884
" vimprj http://www.vim.org/scripts/script.php?script_id=3872
" invoke ctags
" default --c++-kinds=+p+l set to --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" default --fields=+iaS does not fit YCM, set to --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v--fields=+iaSl --extra=+q"
let g:indexer_disableCtagsWarning=1

" NeoComplCache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_disableautocomplete=1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
set completeopt-=preview

imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
imap <C-l> <Plug>(neocomplcache_snippets_force_jump)
smap <C-l> <Plug>(neocomplcache_snippets_force_jump)

" Emmet
let g:user_emmet_expandabbr_key='<C-e>'

" Tabular
let mapleader=','
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>aa :Tabularize /
vmap <Leader>aa :Tabularize /

" Tagbar https://github.com/majutsushi/tagbar
let tagbar_left=1
nnoremap <Leader>tl :TagbarToggle<CR>
" tarbar width
let tagbar_width=32
" no help info
let g:tagbar_compact=1
" ctags for elements
let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:external:0:0',
        \ 'l:local:0:0'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" CtrlSF
" search in project
nnoremap <Leader>sp :CtrlSF<CR>

" Nerdcommenter https://github.com/scrooloose/nerdcommenter

" Authorinfo
let g:vimrc_author='Joshua'
let g:vimrc_email='joshua7v@hotmail.com'
let g:vimrc_homepage='https://blog.sigmastudio.me'
nmap <Leader>au :AuthorInfoDetect<CR>

" Wildfire https://github.com/gcmt/wildfire.vim
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]

" UltiSnips https://github.com/SirVer/ultisnips
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" NERDtree https://github.com/scrooloose/nerdtree
nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

" Gundo
nnoremap <Leader>ud :GundoToggle<CR>
set undofile
set undodir=~/.undo_history/

" MiniBufExplorer https://github.com/fholgado/minibufexpl.vim
nnoremap <Leader>bl :MBEToggle<cr>
nnoremap <Leader>ct :MBEbn<cr>
nnoremap <Leader>sct :MBEbp<cr>
nnoremap <Leader>dt :MBEbd<cr>
nnoremap <Leader>wt :MBEbw<cr>
nnoremap <Leader>ut :MBEbun<cr>

" YCM
set completeopt=longest,menu
highlight Pmenu ctermfg=7 ctermbg=0 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=0 ctermbg=7 guifg=#AFD700 guibg=#106900
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
set tags+=/data/misc/software/misc./vim/stdcpp.tags
inoremap <leader>; <C-x><C-o>
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_global_ycm_extra_conf='~/.vim/YCM/.ycm_extra_conf.py'
let g:syntastic_error_symbol = 'e'
let g:syntastic_warning_symbol = 'w'
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>
