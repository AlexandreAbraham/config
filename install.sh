#! /bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=`dirname "$SCRIPT"`

# Bash
ln -fs $SCRIPTPATH/bashrc ~/.bashrc
ln -fs $SCRIPTPATH/bash_profile ~/.bash_profile

# Vim
ln -fs $SCRIPTPATH/vimrc ~/.vimrc
ln -fs $SCRIPTPATH/vim ~/.vim
