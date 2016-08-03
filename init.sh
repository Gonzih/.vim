#!/bin/sh

set -e

ln -sf ~/.vim/vimrc ~/.vimrc
ln -sf ~/.vim/vimrc ~/.ideavimrc
ln -sf ~/.vim/gvimrc ~/.gvimrc
ln -sf ~/.vim/gvimrc ~/.nvimrc

go get -u github.com/nsf/gocode
go get -u golang.org/x/tools/cmd/goimports
go get -u github.com/golang/lint/golint
go get -u github.com/kisielk/errcheck
