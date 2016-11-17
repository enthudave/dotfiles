#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

printf "${RED}APT SECTION${NC}\n\n"

# sudo apt install ssh tmux
sudo apt install zsh git curl terminator
sudo apt install python-pip python-dev python3-pip python3-dev
sudo apt install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
sudo apt install python-gi python-gi-cairo python-cairo

printf "\n\n${RED}INSTALL NEOVIM${NC}\n\n"

if [ ! -x "/usr/local/bin/nvim" ];
then
	git clone https://github.com/neovim/neovim ~/Desktop/neovim
	cd ~/Desktop/neovim
	make
	sudo make install
fi

printf "\n\n${RED}INSTALL NEOVIM GUI AND PYTHON API${NC}\n\n"

sudo pip install neovim
sudo pip install click
sudo pip install neovim-gui

printf "\n\n${RED}INSTALL OH-MY-ZSH${NC}\n\n"

if [ ! -d "$HOME/.oh-my-zsh" ];then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

printf "\n\n${RED}INSTALL OH-MY-ZSH THEME${NC}\n\n"

if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel9k" ];then
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

printf "\n\n${RED}INSTALL DOTFILES${NC}\n\n"

if [ ! -d "$HOME/Desktop/dotfiles" ];then
	git clone https://github.com/enthudave/dotfiles ~/Desktop/dotfiles
fi

if [ ! -e "$HOME/.zshrc" ];then
	rm $HOME/.zshrc
	ln -s ~/Desktop/dotfiles/linux/zsh/zshrc ~/.zshrc
fi
if [ ! -e "$HOME/.zshenv" ];then
	rm $HOME/.zshenv
	ln -s ~/Desktop/dotfiles/linux/zsh/zshenv ~/.zshenv
fi
if [ ! -d "$HOME/.config" ];then
	mkdir ~/.config/
fi
if [ ! -e "$HOME/.config/nvim" ];then
	if [ ! -d "$HOME/.vim" ];then
		mkdir $HOME/.vim
	fi
	ln -s ~/.vim ~/.config/nvim
fi
if [ ! -e "$HOME/.config/nvim/init.vim" ];then
	ln -s ~/Desktop/dotfiles/linux/nvim/vimrc ~/.config/nvim/init.vim
fi

printf "\n\n${RED}INSTALL FONTS${NC}\n\n"

if [ ! -d "$HOME/Desktop/nerd-fonts" ];then
	git clone https://github.com/ryanoasis/nerd-fonts ~/Desktop/nerd-fonts
	cd ~/Desktop/nerd-fonts
	./install.sh SourceCodePro
	./install.sh Hack
	#rm -rf ~/Desktop/nerd-fonts
fi

if [ ! -d "$HOME/Desktop/powerline-fonts" ];then
	git clone https://github.com/powerline/fonts ~/Desktop/powerline-fonts
	~/Desktop/powerline-fonts/install.sh
fi
