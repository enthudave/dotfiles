#!/usr/bin/env bash

# accept xcode license and install command line tools
sudo xcodebuild -license
sudo xcode-select --install

# install neovim
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install git zsh tmux wget python ctags-exuberant
brew install neovim/neovim/neovim
brew install Caskroom/cask/firefox

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# prepare for neovimconfig
mkdir ~/.config
mkdir ~/.config/nvim
ln -s ~/.vim ~/.config/nvim
ln -s ~/Desktop/dotfiles/osx/vim/vimrc ~/.vimrc
ln -s ~/.vimrc ~/.config/nvim/init.vim
# install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# pull config files
cp ./osx/zsh/zshrc ~/.zshrc ./osx/zsh/zshenv ~/.zshenv
cp ./tmux/tmux.conf ~/.tmux.conf

# install powerlevel9k zsh-theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# install powerline fonts
git clone https://github.com/powerline/fonts ~/Desktop/powerlinefonts
bash ~/Desktop/powerlinefonts/install.sh
