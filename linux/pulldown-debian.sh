#!/usr/bin/env bash

su

# remove cdrom entries from apt's sources
mv /etc/apt/sources.list /etc/apt/sources.backup
sed '/cdrom/d' /etc/apt/sources.backup > /etc/apt/sources.list

RED='\033[0;31m'
NC='\033[0m' # No Color

printf "${RED}APT SECTION${NC}\n\n\n"

apt update

apt install sudo
adduser enthu sudo

printf "${RED}LOGIN ENTHU${NC}\n\n\n"
login enthu

# sudo apt install ssh tmux
sudo apt install zsh git curl terminator
sudo apt install python-pip python-dev python3-pip python3-dev
sudo apt install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
sudo apt install python-gi python-gi-cairo python-cairo

printf "${RED}INSTALL NEOVIM${NC}\n\n\n"

if [[ ! -x "/usr/local/bin/nvim" ]];
then
	git clone https://github.com/neovim/neovim ~/Desktop/neovim
	cd ~/Desktop/neovim
	make
	sudo make install
fi

printf "${RED}INSTALL NEOVIM GUI AND PYTHON API${NC}\n\n\n"

sudo pip install neovim
sudo pip install click
sudo pip install neovim-gui

printf "${RED}INSTALL OH-MY-ZSH${NC}\n\n\n"

if [[ ! -d "$(dirname ~/.oh-my-zsh)" ]];then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

printf "${RED}INSTALL OH-MY-ZSH THEME${NC}\n\n\n"

if [[ ! -d "$(dirname ~/.oh-my-zsh/custom/themes/powerlevel9k)" ]];then
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

printf "${RED}INSTALL DOTFILES${NC}\n\n\n"

if [[ ! -d "$(dirname ~/Desktop/dotfiles)" ]];then
	git clone https://github.com/enthudave/dotfiles ~/Desktop/dotfiles
	ln -s ~/Desktop/dotfiles/linux/zsh/zshrc ~/.zshrc
	ln -s ~/Desktop/dotfiles/linux/zsh/zshenv ~/.zshenv
	mkdir ~/.config/
	ln -s ~/.vim ~/.config/nvim
	ln -s ~/Desktop/dotfiles/linux/nvim/vimrc ~/.config/nvim/init.vim
fi

printf "${RED}INSTALL FONTS${NC}\n\n\n"

if [[ ! -d "$(dirname ~/.local/share/fonts/NerdFonts)" ]];then
	git clone https://github.com/ryanoasis/nerd-fonts ~/Desktop/nerd-fonts
	cd ~/Desktop/nerd-fonts
	./install.sh SourceCodePro
	./install.sh Hack
	#rm -rf ~/Desktop/nerd-fonts
fi

if [ ! -d "$(dirname ~/Desktop/powerline-fonts)" ];
then
	git clone https://github.com/powerline/fonts ~/Desktop/powerline-fonts
	~/Desktop/powerline-fonts/install.sh
fi
