#!/bin/bash

msg() {
    printf '\t---> %b\n' "$1" >&2
}

setup_packages() {
    if which apt-get > /dev/null 2>&1; then
        msg "\033[36m1. Updating packages ...\033[0m\n"
        sudo apt-get update > /dev/null
        msg "\033[36m2. Installing packages ...\033[0m\n"
        sudo apt-get install -y vim ctags git ack-grep build-essential cmake python-dev python3-dev > /dev/null 2>&1
    elif which yum > /dev/null; then
        msg "\033[36m1. Updating packages ...\033[0m\n"
        sudo yum update -y > /dev/null
        msg "\033[36m2. Installing packages ...\033[0m\n"
        sudo yum install -y vim git ctags gcc-c++ ack build-essential cmake python-devel python3-devel > /dev/null 2>&1
    fi
}

do_backup() {
    if [ -e "$1" ] || [ -e "$2" ] || [ -e "$3" ]; then
        msg "\033[36m*. Attempting to back up your original vim configuration.\033[0m\n"
        today=`date +%Y%m%d_%s`
        for i in "$1" "$2" "$3"; do
            [ -e "$i" ] && [ ! -L "$i" ] && mv -v "$i" "$i.$today";
        done
    fi
}

prepare_install() {
    if [ -d ~/vim ]; then
        mv -f ~/vim ~/vim.old
    fi
    cd ~/ && git clone https://github.com/joshua7v/vim > /dev/null 2>&1
    mv -f ~/vim/.vim ~/.vim
    mv -f ~/vim/.vimrc ~/.vimrc
    msg "\033[36m3. Cloning repos...\033[0m\n"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null 2>&1
}

after_install() {
    msg "\033[36m5. Setting up snippets ...\033[0m\n"
    if [ -d ~/.vim/bundle/UltiSnips ]; then
        mv -f ~/vim/snippets ~/.vim/bundle/UltiSnips/mysnippets
    fi
    msg "\033[36m6. Setting up YCM ... this may take 5 minutes.\033[0m\n"
    if [ -d ~/.vim/bundle/YouCompleteMe ]; then
        sudo dd if=/dev/zero of=/swapfile bs=250M count=8 > /dev/null 2>&1
        sudo chmod 600 /swapfile
        sudo mkswap /swapfile > /dev/null 2>&1
        sudo swapon /swapfile
        ~/.vim/bundle/YouCompleteMe/install.py --all > /dev/null 2>&1
        sudo swapoff /swapfile
        sudo rm /swapfile
    fi
}

setup_vundle() {
    msg "\033[36m4. Installing Plugins ...\033[0m\n"
    local system_shell="$SHELL"
    export SHELL="/bin/sh"
    vim -u "$HOME/.vimrc" +PluginInstall! +PluginClean +qall
    export SHELL="$system_shell"
}

setup_packages
do_backup "$HOME/.vim" \
            "$HOME/.vimrc"\
            "$HOME/.gvimrc"
prepare_install
setup_vundle
after_install
rm -fr ~/vim
if [ -d ~/vim.old ]; then
    mv -f ~/vim.old vim
fi
msg "\033[36m7. Install Finished. Thanks for installing.\033[0m\n"
