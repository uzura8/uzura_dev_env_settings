# !/bin/sh

cp .bashrc ../
cp .gitconfig ../
cp .gitexcludes ../
cp .screenrc ../
cp -r .vim ../
cp .vimrc ../

source ../.bashrc

# remove me
rm ~/*
