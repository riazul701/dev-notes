#!/bin/bash

##################################Start: Test-Code#####################################
#echo 'abcd'
#exit
##################################End: Test-Code#######################################

# Tested (WSL): Ubuntu-20.04
# Get configurations from "apt-antix-software.sh" and "xampp_8.2.4->php-apache"
# PreInstalled in WSL: tmux, python3

declare -a apt_softwares

apt_office_softwares=(
#	"locales"
	"php"
	"python3"
	"python3-pip"
	"rsync"
	"sqlite3"
#	"git"
	"gpg"
	"pass"
	"curl"
	"wget"
	"vim"
	"nano"
	"tmux"
#	"tmuxinator"
	"gnupg2"
	"fd-find"
	"ripgrep"
	"openssh-server"
	"mycli"
	"tree"
	"vifm"
	"libgd-dev"
	"libzip-dev"
	"libpng-dev"
)

apt_home_softwares=(
	"zip"
	"unzip"
)

apt_softwares+=("${apt_office_softwares[@]}")

echo -n "Is this a workstation for Home use [yes/no(default)]?"
read workstation_response

sudo apt-get update

if [ "$workstation_response" == "yes" ]
then
    apt_softwares+=("${apt_home_softwares[@]}")
fi

# Install APT Softwares
for ((i = 0; i < ${#apt_softwares[@]}; i++))
do
    apt_software="${apt_softwares[$i]}"
	apt_split_software_name=($apt_software)
	apt_software_base_name=${apt_split_software_name[0]}
	
	apt_installed_software=$(dpkg -s ${apt_software_base_name} | grep 'Status' | awk '{print $4}')
	   
	if [ "$apt_installed_software" == "installed" ]
	then
	    echo -e "\033[1;32m APT: ${apt_software_base_name} is already installed, skipping... \033[0m"
    else
	    apt_snap_installed_software=$(snap list | awk '{print $1}' | grep ${apt_software_base_name})
	
	    if [ "$apt_software_base_name" == "$apt_snap_installed_software" ]
        then
		    echo -e "\033[1;32m APT(Snap): ${apt_software_base_name} is already installed, skipping... \033[0m"
            continue			
        fi
	
        sudo apt --yes install ${apt_software}
	    #echo APT: "${apt_software_base_name} is going to be installed."	
	fi
done

echo -e '\033[1;32m APT: All Software Installed. \033[0m'

sudo apt-get clean

<<'###BLOCK-COMMENT'
###########################################################################
# Locales:
###########################################################################
sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
locale-gen
echo "export LC_ALL=en_US.UTF-8" >> ~/.bashrc
echo "export LANG=en_US.UTF-8" >> ~/.bashrc
echo "export LANGUAGE=en_US.UTF-8" >> ~/.bashrc
bash -c "source ~/.bashrc"
###BLOCK-COMMENT

###########################################################################
# Composer:
###########################################################################
# Install composer and add its bin to the PATH.
if ! command -v composer &> /dev/null
then
	curl -s http://getcomposer.org/installer | php
 	mv composer.phar /usr/local/bin/composer
else
	echo -e "\033[1;32m Composer is already installed, skipping... \033[0m"
fi

###########################################################################
# Ruby & Gem:
###########################################################################
# if [[ "$(which ruby)" != "$HOME/.rvm/rubies/ruby-3.2.2/bin/ruby" ]]
if ! command -v ruby &> /dev/null	
then
	curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
    curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
    curl -sSL https://get.rvm.io | bash -s stable
    source ~/.bashrc
    rvm install ruby-3.2.2
    echo 'export PATH="$HOME/.rvm/gems/ruby-3.2.2/bin:$HOME/.rvm/gems/ruby-3.2.2@global/bin:$HOME/.rvm/rubies/ruby-3.2.2/bin:$PATH"' >> ~/.bashrc
	echo 'export GEM_HOME="$HOME/.rvm/gems/ruby-3.2.2"' >> ~/.bashrc
	echo 'export GEM_PATH="$HOME/.rvm/gems/ruby-3.2.2:/home/riazul/.rvm/gems/ruby-3.2.2@global"' >> ~/.bashrc
	source ~/.bashrc
else
	echo -e "\033[1;32m Ruby and Gem is already installed, skipping... \033[0m"
fi

###########################################################################
# Rust & Cargo:
###########################################################################
if ! command -v rustc &> /dev/null
then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
	echo 'source "$HOME/.cargo/env"' >> ~/.bashrc
	source ~/.bashrc
else
	echo -e "\033[1;32m Rust (rustc) and Cargo is already installed, skipping... \033[0m"
fi

<<'###BLOCK-COMMENT'
###########################################################################
# Git & Lazygit:
###########################################################################
if ! command -v git-credential-manager &> /dev/null
then
	wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.2.2/gcm-linux_amd64.2.2.2.tar.gz
	sudo tar -xvf gcm-linux_amd64.2.2.2.tar.gz -C /usr/local/bin
	git-credential-manager configure
	rm gcm-linux_amd64.2.2.2.tar.gz
	git config --global credential.credentialStore gpg
	echo 'export GPG_TTY=$(tty)' >> ~/.bashrc
	bash -c "source ~/.bashrc"
else
	echo -e "\033[1;32m Git-Credential-Manager is already installed, skipping... \033[0m"
fi

if ! command -v lazygit &> /dev/null
then
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo mv lazygit /usr/local/bin
	rm lazygit.tar.gz
else
	echo -e "\033[1;32m Lazygit is already installed, skipping... \033[0m"
fi
###BLOCK-COMMENT

###########################################################################
# Tmux & Tmuxinator:
###########################################################################
if ! command -v tmuxinator &> /dev/null
then
	# gem install tmuxinator # Install via apt
	touch ~/.tmux.conf
    echo 'set-option -g prefix C-a' >> ~/.tmux.conf
    echo 'set -g default-terminal "tmux-256color"' >> ~/.tmux.conf
    echo 'set -sg terminal-overrides ",*:RGB"' >> ~/.tmux.conf
    echo 'export TMUXINATOR_CONFIG=/e/stproject/tmuxinator' >> ~/.bashrc
    source ~/.bashrc;
else
	echo -e "\033[1;32m Tmuxinator is already installed, skipping... \033[0m"
fi

###########################################################################
# Node / NVM:
###########################################################################
if ! command -v node &> /dev/null
then
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
	export NVM_DIR="$HOME/.nvm"
	. $NVM_DIR/nvm.sh
	nvm install --lts
	nvm use --lts
else
	echo -e "\033[1;32m Nodejs and NVM is already installed, skipping... \033[0m"
fi

###########################################################################
# LunarVim:
###########################################################################
if ! command -v lvim &> /dev/null
then
	wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
	sudo tar xzvf nvim-linux64.tar.gz --directory /opt
	echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc
	source ~/.bashrc
	rm nvim-linux64.tar.gz
	export LV_BRANCH='release-1.3/neovim-0.9'
	wget https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh
	bash install.sh -s -- -y
	echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc
	source ~/.bashrc
	# Fix "lvim"->":checkhealth" warnings and errors
	# && touch ~/.config/lvim/init.vim \
	# && gem install neovim
else
	echo -e "\033[1;32m LunarVim is already installed, skipping... \033[0m"
fi

###########################################################################
# Starship:
###########################################################################
if ! command -v starship &> /dev/null
then
	curl -sS https://starship.rs/install.sh | sh -s - --yes
	echo 'eval "$(starship init bash)"' >> ~/.bashrc
	bash -c "source ~/.bashrc"
else
	echo -e "\033[1;32m Starship is already installed, skipping... \033[0m"
fi
