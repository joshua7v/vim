# My Vim

Personal Vim Configuration

# How to install

For now, only support apt-get | yum. I have tested on Ubuntu / Centos Server

    curl https://raw.github.com/joshua7v/vim/master/install.sh -L > jvim.sh && sh jvim.sh

# Usage

This vim configuration is designed for writing c / cpp on Linux server.

## Cheet Sheet

```vimscript
" Plugin a.vim ---------------------------------------------
" ;ch                       .cpp <-> .h
" ;sch                      sub window .cpp <-> .h

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
```
