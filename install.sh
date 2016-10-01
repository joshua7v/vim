#!/bin/bash

APP_NAME='svim'
REQUIRE="npm node git"
[ -z "$VIM_PATH" ] && VIM_PATH="$HOME/.svim"
[ -z "$REPO_URI" ] && REPO_URI='https://github.com/joshua7v/vim.git'

# help functions
msg() {
    printf '\t---> %b\n' "$1" >&2
}

success() {
    msg "\33[32m ✔ \33[0m ${1}${2}"
}

error() {
    msg "\33[31m ✘ \33[0m ${1}${2}"
    exit 1
}

warn() {
    msg "\33[33m ⚠ \33[0m ${1}${2}"
}

info() {
    msg "\33[32m ➜ \33[0m ${1}${2}"
}

lnif() {
    if [ ! -e $2 ] ; then
        ln -s $1 $2
    fi
}

# check if node & npm are installed
for i in $REQUIRE
do
    command -v $i >/dev/null && continue || { error "$i command not found. Please Make sure you have $i installed"; }
done

if [ ! -e "$VIM_PATH" ]; then
    info "clone svim to $VIM_PATH"
    mkdir -p "$VIM_PATH"
    git clone "$REPO_URI" "$VIM_PATH"
    ret="$?"
    success "Successfully cloned $APP_NAME"
else
    info "update svim in $VIM_PATH"
    cd "$VIM_PATH" && git pull origin
    ret="$?"
    success "Successfully updated $APP_NAME"
fi

info "backing up current vim config"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
for i in $HOME/.vim $HOME/.vimrc; do [ -L $i ] && unlink $i ; done
success "successfully backed up your vim configuration"

info "setting up symlinks"
lnif $VIM_PATH/vimrc $HOME/.vimrc
lnif $VIM_PATH/ $HOME/.vim
lnif $VIM_PATH/config/tern-config $HOME/.tern-config
lnif $VIM_PATH/config/editorconfig $HOME/.editorconfig
lnif $VIM_PATH/config/eslintrc $HOME/.eslintrc
success "successfully created symbol links"

# install vim-plug
if [ ! -e $VIM_PATH/autoload/plug.vim ]; then
    info "installing Vim-Plug"
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    success "successfully installed vim-plug"
fi

info "update/install plugins using vim-plug"
system_shell=$SHELL
export SHELL="/bin/sh"
vim -u $VIM_PATH/vimrc +PlugInstall! +PlugClean +qall
export SHELL=$system_shell

command -v eslint >/dev/null || warn "eslint is not found from global installation, you may want to run: npm i -g eslint"
command -v jsctags >/dev/null || warn "for better javascript tags support, it's recommend to install jstags, npm i -g git+https://github.com/ramitos/jsctags.git"
command -v js-beautify >/dev/null || warn "you may also want to install js-beautify, npm i js-beautify -g"

#vim undo dir
if [ ! -d $HOME/.undodir ]
then
    mkdir -p $HOME/.undodir
fi
