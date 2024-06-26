#!/bin/bash
echo "set backspace=indent,eol,start" >> ~/.vimrc  #fixes backspace issue
echo "set nocompatible" >> ~/.vimrc #fixes arrow key issues in vim
echo "set belloff=all" >> ~/.vimrc   # sets annoyim vim bells off
echo "set number" >> ~/.vimrc   # line number
echo "syntax on" >> ~/.vimrc   # for colour syntax
echo "bind 'set bell-style none'" >> ~/.bashrc # sets the bell off for specific user
