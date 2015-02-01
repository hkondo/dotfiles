#!/bin/sh
TOP=$(cd $(dirname $0); pwd)
ln -s ${TOP}/dot.vim ~/.vim
ln -s ${TOP}/dot.vimrc ~/.vimrc
ln -s ${TOP}/dot.zshrc ~/.zshrc
ln -s ${TOP}/dot.zshenv ~/.zshenv
