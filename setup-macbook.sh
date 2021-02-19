#!/usr/bin/env bash
#
# Description:
#   Simple script to setup Macbook for my liking.
#
# TODO:
#   - don't download anything, when there is no need
#   - no user input required
#   - setup zsh(theme, aliases, etc.) automatically


# setup variables
TF_VERSION="0.14.7"

clear
printf ' --- starting setup ---\n   ! if any step fails, please verify System Preferences > Security & Privacy > General\n\n'

# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# update and upgrade Homebrew
brew update
brew upgrade

# install git
brew install git

# install Atom
brew install --cask atom

# install iterm2
brew install --cask iterm2

# install oh-my-zsh
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install Docker
brew install --cask docker

# install VirtualBox
brew install --cask virtualbox

# install Vagrant
brew install --cask vagrant

# install Vagrant Manager
brew install --cask vagrant-manager

# install Ansible
brew install ansible

# install Terraform
curl -s -k -L -O https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_darwin_amd64.zip
unzip terraform_${TF_VERSION}_darwin_amd64.zip
rm -rf terraform_${TF_VERSION}_darwin_amd64.zip
sudo mv terraform /usr/local/bin/

# install Slack
brew install --cask slack

# install Opera
brew install --cask opera

# install caffeine
brew install --cask caffeine

# install Spotify
brew install --cask spotify

# wait 10 seconds
printf '\n --- waiting for 10 seconds before rebooting the system --- \n'
sleep 10

# reboot the system
sudo reboot
