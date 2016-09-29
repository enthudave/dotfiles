#!/usr/bin/env bash

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

sudo apt install ssh tmux zsh git vim neovim
sudo apt install software-properties-common python-pip python-dev python3-pip python3-dev
sudo pip install neovim

cp ./zsh/zshrc ~/.zshrc ./zsh/zshenv ~/.zshenv ./tmux/tmux.config ~/.tmux.config
cp ./nvim/vimrc ~/.vimrc ./tmux/tmux.conf ~/.tmux.conf

mkdir ~/.config/nvim
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
