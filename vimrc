" ----------------------------------------------------------------------------
" Author:  joshua
" Version: 0.2
" ----------------------------------------------------------------------------
"
" ----------------------------------------------------------------------------
" cheetsheet
" ----------------------------------------------------------------------------
" ,rw
" ,R
"
" ,a
" ,i
" ,j
" ,k
" ,c
" ,x
" ,sa
"
" ,m
" ,M
"
" qq
" qo
"
" ,ud
"
" ,f
" ,d
"
" ,dd
"
" ,au
"
" ,a=/:/"/
" ,aa
"
" ,tab
"
" C-e
"
" ,space
"
" ,/
"
" ,ag
"
" ,s
"
" ,fu
"
" ,tl
" ,e
" ----------------------------------------------------------------------------

set nocompatible
if has('termguicolors')
    set termguicolors
endif

" ----------------------------------------------------------------------------
" Vim-Plug:Plgin management and setting
" ----------------------------------------------------------------------------
call plug#begin('~/.vim/bundle')

let mapleader = ','
let g:mapleader = ','

" ----------------------------------------------------------------------------
" vim plugin bundle control, command model
" :PlugInstall     install
" :PlugInstall!    update
" :PlugClean       remove plugin not in list
" ----------------------------------------------------------------------------

" theme
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'ashfinal/vim-colors-violet'

" display
Plug 'Valloric/MatchTagAlways'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gorodinskiy/vim-coloresque'
Plug 'airblade/vim-gitgutter'
Plug 'inside/vim-search-pulse'

" fast move
Plug 'vim-scripts/matchit.zip'
Plug 'Lokaltog/vim-easymotion'
" Plug 'unblevable/quick-scope'

" fast edit
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-repeat'
Plug 'gcmt/wildfire.vim'
Plug 'Raimondi/delimitMate'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}

" tools
Plug 'vim-scripts/DrawIt'
Plug 'vim-scripts/AuthorInfo'
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
Plug 'scrooloose/syntastic'
"Plug 'ruanyl/vim-eslint', {'do': 'npm install'}
Plug 'majutsushi/tagbar'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-obsession' | Plug 'dhruvasagar/vim-prosession'
Plug 'szw/vim-maximizer'
Plug 'thinca/vim-quickrun'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
"Plug 'ruanyl/vim-fidget', {'do': 'npm install'}
Plug 'MattesGroeger/vim-bookmarks'
"Plug 'ruanyl/vim-fixmyjs', {'on': 'Fixmyjs'}
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/BufOnly.vim'
Plug 'junegunn/gv.vim'

" search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
"Plug 'dyng/ctrlsf.vim', {'on': '<Plug>CtrlSFVwordExec'}
Plug 'dyng/ctrlsf.vim'
Plug 'ggVGc/vim-fuzzysearch'
"Plug 'rking/ag.vim'

" javascript
Plug 'pangloss/vim-javascript'
Plug 'marijnh/tern_for_vim', {'do': 'npm install'}
Plug 'othree/javascript-libraries-syntax.vim'
"Plug 'kchmck/vim-coffee-script'
Plug 'heavenshell/vim-jsdoc', {'for': ['javascript', 'jsx']}
"Plug 'burnettk/vim-angular'
Plug 'mxw/vim-jsx'

" CSS
"Plug 'ruanyl/vim-caniuse', {'on': 'Caniuse', 'for': ['css', 'html']}
"Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'JulesWang/css.vim'
au BufRead,BufNewFile *.scss set filetype=scss.css

" python
Plug 'klen/python-mode'

call plug#end()

" ----------------------------------------------------------------------------
" MatchTagAlways
" ----------------------------------------------------------------------------
let g:mta_filetypes = {
    \ 'html': 1,
    \ 'xhtml': 1,
    \ 'xml': 1,
    \ 'jinja': 1,
    \ 'javascript.jsx': 1,
    \ 'javascript': 1,
    \}
nnoremap <leader>% :MtaJumpToOtherTag<cr>
let g:mta_use_matchparen_group = 0
let g:mta_set_default_matchtag_color = 1
highlight MatchTag ctermfg=black

" ----------------------------------------------------------------------------
" vim-search-pulse
" ----------------------------------------------------------------------------
let g:vim_search_pulse_mode = 'pattern'
let g:vim_search_pulse_duration = 400

" ----------------------------------------------------------------------------
" vim-closetag
" ----------------------------------------------------------------------------
let g:closetag_filenames = "*.html,*.xhtml,*.js"

" ----------------------------------------------------------------------------
" NERDCommenter
" ----------------------------------------------------------------------------
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

" ----------------------------------------------------------------------------
" gv
" ----------------------------------------------------------------------------
nnoremap <leader>gv :GV<cr>

" ----------------------------------------------------------------------------
" NERDTree
" ----------------------------------------------------------------------------
nnoremap <leader>e :NERDTreeToggle<CR>
let NERDTreeWinSize=32
" let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeHighlightCursorline=1
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

" ----------------------------------------------------------------------------
" tagbar
" require ctags, jsctags
" npm install -g git+https://github.com/ramitos/jsctags.git
" ----------------------------------------------------------------------------
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : 'jsctags'
    \ }
nnoremap <leader>tl :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_width = 50

" ----------------------------------------------------------------------------
" ctrlp.vim
" ----------------------------------------------------------------------------
nnoremap <leader>m :CtrlPMRU<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](node_modules|target|dist)|\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
let g:ctrlp_follow_symlinks=1

" ----------------------------------------------------------------------------
" ctrlp-funky
" ----------------------------------------------------------------------------
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
nnoremap <Leader>fu :CtrlPFunky<Cr>

" ----------------------------------------------------------------------------
" ctrlsf.vim
" ----------------------------------------------------------------------------
let g:ctrlsf_ackprg = 'ack'
vmap <Leader>s <Plug>CtrlSFVwordExec
hi def link ctrlsfMatch Search

" ----------------------------------------------------------------------------
" ag.vim
" ----------------------------------------------------------------------------
nnoremap <Leader>ag :Ag!<space>
let g:ag_working_path_mode='r'

" ----------------------------------------------------------------------------
" vim-fuzzysearch
" ----------------------------------------------------------------------------
nnoremap <leader>/ :FuzzySearch<cr>

" ----------------------------------------------------------------------------
" vim-airline
" ----------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1

" ----------------------------------------------------------------------------
" vim-better-whitespace
" Mapping: <leader><space>
" ----------------------------------------------------------------------------
map <leader><space> :StripWhitespace<cr>
highlight ExtraWhitespace ctermbg=red
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help']
let g:better_whitespace_filetypes_verbosity=1

" ----------------------------------------------------------------------------
" vim-bookmarks
" ----------------------------------------------------------------------------
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
let g:bookmark_no_default_key_mappings = 1
nnoremap <Leader>mm :BookmarkToggle<CR>
nnoremap <Leader>i :BookmarkAnnotate<CR>
nnoremap <Leader>a :BookmarkShowAll<CR>
nnoremap <Leader>j :BookmarkNext<CR>
nnoremap <Leader>k :BookmarkPrev<CR>
nnoremap <Leader>c :BookmarkClear<CR>
nnoremap <Leader>x :BookmarkClearAll<CR>

" ----------------------------------------------------------------------------
" Emmet
" ----------------------------------------------------------------------------
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_mode='a'

" ----------------------------------------------------------------------------
" vim-maximizer
" ----------------------------------------------------------------------------
nnoremap <tab> :MaximizerToggle<CR>

" ----------------------------------------------------------------------------
" vim-colors-solarized
" ----------------------------------------------------------------------------
let g:solarized_termcolors=16
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"

" ----------------------------------------------------------------------------
" vim-easymotion
" ----------------------------------------------------------------------------
" map <space> <Plug>(easymotion-s2)
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1

" ----------------------------------------------------------------------------
" wildfire.vim
" Mapping: <Space>
" ----------------------------------------------------------------------------
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
    \ "html,xml" : ["at"],
\ }
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)

" ----------------------------------------------------------------------------
" YouCompleteMe
" ----------------------------------------------------------------------------
set completeopt=longest,menu
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_complete_in_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf=0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_key_list_select_completion = ['<Tab>', '<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.'],
            \   'objc' : ['->', '.'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::', '(', 'use ', 'namespace ', '\'],
            \   'cs,java,typescript,d,python,perl6,scala,vb,elixir,go' : ['.', 're!(?=[a-zA-Z]{3,4})'],
            \   'html': ['<', '"', '</', ' '],
            \   'vim' : ['re![_a-za-z]+[_\w]*\.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \   'haskell' : ['.', 're!.'],
            \   'scss,css': [ 're!^\s{2,4}', 're!:\s+' ],
            \   'javascript': ['.', 're!(?=[a-zA-Z]{3,4})'],
            \ }

" ----------------------------------------------------------------------------
" ultisnips
" ----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" ----------------------------------------------------------------------------
" delimitMate
" ----------------------------------------------------------------------------
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_expand_cr = 1

" ----------------------------------------------------------------------------
" tabular
" ----------------------------------------------------------------------------
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a" :Tabularize /"<CR>
vmap <Leader>a" :Tabularize /"<CR>
nmap <Leader>aa :Tabularize /
vmap <Leader>aa :Tabularize /

" ----------------------------------------------------------------------------
" syntastic
" ----------------------------------------------------------------------------
let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol='❗'
let g:syntastic_style_error_symbol='»'
let g:syntastic_style_warning_symbol='•'
let g:syntastic_check_on_open=0
let g:syntastic_enable_highlighting = 0
let g:syntastic_javascript_checkers = ['eslint']

" ----------------------------------------------------------------------------
" vim-markdown
" ----------------------------------------------------------------------------
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_frontmatter=1

" ----------------------------------------------------------------------------
" author_info
" ----------------------------------------------------------------------------
let g:vimrc_author='Joshua'
let g:vimrc_email='joshua7v@hotmail.com'
let g:vimrc_homepage='https://blog.sigmastudio.me'
nmap <Leader>au :AuthorInfoDetect<CR>

" ----------------------------------------------------------------------------
" vim-jsx
" ----------------------------------------------------------------------------
let g:jsx_ext_required = 0 " Allow JSX in normal JS files"

" ----------------------------------------------------------------------------
" vim-jsdoc
" ----------------------------------------------------------------------------
let g:jsdoc_default_mapping = 0
let g:jsdoc_enable_es6 = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
autocmd FileType javascript nnoremap <Leader>d :JsDoc<CR>

" ----------------------------------------------------------------------------
" tern_for_vim
" ----------------------------------------------------------------------------
let tern_show_signature_in_pum = 1
let tern_show_argument_hints = 'on_hold'
autocmd FileType javascript nnoremap <Leader>dd :TernDef<CR>
autocmd FileType javascript setlocal omnifunc=tern#Complete

" ----------------------------------------------------------------------------
" gundo.vim
" ----------------------------------------------------------------------------
nnoremap <leader>ud :GundoToggle<CR>
let g:gundo_auto_preview = 0

" ----------------------------------------------------------------------------
" vim-autoformat
" require: npm install -g js-beautify
" ----------------------------------------------------------------------------
autocmd FileType javascript,json,html,css,scss noremap <buffer>  <Leader>f :Autoformat<cr>

" ----------------------------------------------------------------------------
" vim-bbye
" ----------------------------------------------------------------------------
nnoremap qq :bd<cr>

" ----------------------------------------------------------------------------
" BufOnly.vim
" ----------------------------------------------------------------------------
nnoremap <silent> qo :BufOnly<CR>

" ----------------------------------------------------------------------------
" pymode
" ----------------------------------------------------------------------------
let g:pymode_rope_goto_definition_bind="<Leader>dd"
let g:pymode_doc_bind="<Leader>d"
let g:pymode_virtualenv = 1
autocmd FileType python set colorcolumn=120

filetype plugin indent on
syntax enable
syntax on

" colorscheme solarized
" colorscheme molokai
" colorscheme desert
colorscheme violet

set background=dark
set t_Co=256
set t_ut=
set history=200           " history: number of command-lines remembered
set autoread              " auto reload file after being modified
set shortmess=atI         " do not show initial page
set nobackup
set noswapfile
" set cursorcolumn          " highlight current column
set cursorline            " highlight current line
set t_ti= t_te=           " alway show the content on the screen after exist VIM
set mouse-=a              " disable mouse
set selection=inclusive   " set selection=exclusive
set selectmode=mouse,key
set title                 " change the terminal's title
set novisualbell          " don't beep
set noerrorbells          " don't beep
set t_vb=
set tm=500
set nostartofline         " keep cursor postion when switching between buffers

set number " show line number
set nowrap " disable wrap

"set list
"set listchars=tab:›\ ,trail:•,extends:❯,precedes:❮

set showmatch         " show matched brackets
set mat=2             " How many tenths of a second to blink when matching brackets

set hlsearch          " highlight the searching words
set ignorecase        " ingnore case when do searching

set incsearch         " instant search
set smartcase         " ignore case if search pattern is all lowercase, case-sensitive otherwise

set foldenable        " code folding
set foldmethod=indent " options: manual, indent, expr, syntax, diff, marker
set foldlevel=99

set smartindent       " Do smart autoindenting when starting a new line
set autoindent        " always set autoindenting on

set tabstop=4         " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4      " number of spaces to use for autoindenting
set softtabstop=4     " Number of spaces that a <Tab> counts for while performing editing operations
set smarttab
set expandtab         " when typing <Tab>, use <space> instead
set shiftround        " use multiple of shiftwidth when indenting with '<' and '>'

set hidden            " A buffer becomes hidden when it is abandoned
set wildmode=longest:full,full
set ttyfast

set relativenumber " show relative line number
set numberwidth=3
set ruler          " show the current line number and column number
set showcmd        " show the current typing command
set noshowmode     " Show current mode
set scrolloff=7    " Set 7 lines to the cursor - when moving vertically using j/k

" File encode:encode for varied filetype
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=en
set termencoding=utf-8

set ffs=unix,dos,mac         " Use Unix as the standard file type
set formatoptions+=m
set formatoptions+=B         " When joining lines, don't insert a space between two multi-byte characters.
set completeopt=longest,menu " behaviour of insert mode completion
set wildmenu                 " auto complete command
set wildignore=**.o,*~,.swp,*.bak,*.pyc,*.class " Ignore compiled files

set viminfo^=% " Remember info about open buffers on close
set magic      " For regular expressions turn magic on

set backspace=eol,start,indent               " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set pastetoggle=<F5>                         " when in insert mode, toggle between 'paste' and 'nopaste'

" let &colorcolumn="80,".join(range(120,999),",")
let &colorcolumn="120"

autocmd InsertEnter * :set norelativenumber " no relativenumber in insert mode
autocmd InsertLeave * :set relativenumber   " show relativenumber when leave insert mode

" create undo file
if has('persistent_undo')
  set undofile                " So is persistent undo ...
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
  set undodir=~/.undodir/
endif


if has('statusline')
    set laststatus=2
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    if has('fugitive')
        set statusline+=%{fugitive#statusline()} " Git Hotness
    endif
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif


if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
au InsertLeave * set nopaste

" close popup menu when leave insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType javascript,json,css,scss,html set tabstop=2 shiftwidth=2 expandtab ai

autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif

" ----------------------------------------------------------------------------
" Key Mappings:Customized keys
" ----------------------------------------------------------------------------

nnoremap <Leader>; A;<ESC>
nnoremap <Leader>c A,<ESC>
nnoremap <Leader>. A.<ESC>
nnoremap <Leader>\ A \<ESC>
nnoremap <Leader>cl :CtrlPClearCache<cr>
nnoremap <Leader>cla :CtrlPClearAllCache<cr>

command! W w !sudo tee % > /dev/null

" replace currently selected text with default register without yanking it
vnoremap p "_dP

vnoremap <Leader>y "+y
nmap <Leader>p "+p

" search in project
nnoremap <Leader>sp :CtrlSF<CR>

" treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" better command line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" no Highlight
noremap <silent><leader>// :nohls<CR>

" I can type :help on my own, thanks.
noremap <F1> <Esc>"

" keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" use 'm/M' to move among buffers
noremap <Leader>m :bn<CR>
noremap <Leader>M :bp<CR>

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" select all
noremap <Leader>sa ggVG

nnoremap dp :diffput<CR>
nnoremap dg :diffget<CR>

" toggle between two buffers
nnoremap <Leader>t <C-^>

" vmap for maintain Visual Mode after shifting > and <
vnoremap < <gv
vnoremap > >gv

" move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" quick move in insert mode
inoremap <C-o> <Esc>o
inoremap <C-a> <Home>
inoremap <C-e> <End>

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

if has('macunix')
  " pbcopy for OSX copy/paste
  " vnoremap <C-x> :!pbcopy<CR>
  " vnoremap <C-c> :w !pbcopy<CR><CR>
endif

hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight
hi clear SpellBad
hi SpellBad term=standout ctermfg=1 term=underline cterm=underline
hi clear SpellCap
hi SpellCap term=underline cterm=underline
hi clear SpellRare
hi SpellRare term=underline cterm=underline
hi clear SpellLocal
hi SpellLocal term=underline cterm=underline

function s:SetCursorLine()
    set cursorline
    hi cursorline cterm=none ctermbg=235
endfunction
autocmd VimEnter * call s:SetCursorLine()

" hi Pmenu ctermfg=7 ctermbg=0 guifg=#005f87 guibg=#EEE8D5
" hi Pmenu ctermfg=7 ctermbg=0 guifg=#005f87 guibg=#EEE8D5
" hi PmenuSel ctermfg=0 ctermbg=7 guifg=#AFD700 guibg=#106900
" hi search ctermfg=black
" hi incsearch ctermfg=black

inoremap jj <ESC>

hi MatchParen ctermfg=black

" change background
nnoremap <silent> <Leader>b :call ToggleBackground()<CR>
function! ToggleBackground()
    if &background == "light"
        set background=dark
    else
        set background=light
    endif
endfunction
