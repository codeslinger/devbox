#!/bin/sh
cd $HOME
git clone git@github.com:codeslinger/profile.git .profile.d
git clone git@github.com:codeslinger/vim.git .vim
rm -f .profile
ln -sf .profile.d/init .profile
ln -sf .profile.d/dotfiles/screenrc .screenrc
ln -sf .profile.d/dotfiles/gitconfig .gitconfig
ln -sf .vim/vimrc .vimrc

