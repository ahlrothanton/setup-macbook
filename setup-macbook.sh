#!/usr/bin/env bash
#
# Description:
#   Simple script to setup Macbook for my liking.
#
# TODO:
#   - no user input required
#     - at least brew installation requires sudo password and confirmation
#   - setup zsh(theme, aliases, etc.) automatically - use Ansible?


clear
printf "\n--- starting setup ---\n  ! if any step fails, please verify System Preferences > Security & Privacy > General\n"
sleep 3

# install Homebrew
printf "\n--- downloading and installing Homebrew ---\n"
sleep 1
if ! command -v brew &> /dev/null; then

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    printf "  - Skipping.. is Homebrew already installed\n"
fi

# update and upgrade Homebrew
printf "\n--- updating Homebrew ---\n"
brew update

printf "\n--- upgrading Homebrew packages ---\n"
brew upgrade

# install brews
for BREW in git vim golang kubectl helm ansible terraform packer awscli aws-cdk watch eksctl; do
    printf "\n--- installing ${BREW} ---\n"
    brew install "${BREW}"
done

# install casks
for CASK in atom iterm2 docker virtualbox vagrant vagrant-manager slack opera caffeine spotify vscodium aws-vault vlc; do
    printf "\n--- installing ${CASK} ---\n"
    brew install --cask "${CASK}"
done

# install oh-my-zsh
printf "\n--- downloading and installing oh-my-zsh ---\n"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# wait 10 seconds
printf "\n--- waiting for 10 seconds before rebooting the system --- \n"
sleep 10

# reboot the system
sudo reboot
