#!/bin/zsh
# Author: MoxHe
# About: This script is used to set up a developing evironmnet for MacOS using zsh, nvim, tmux,
#        iterm2, fzf and powerline and etc.
# Note: This sript is intended for setting up freshed MacOS. It's assuming you are using zsh
#       Please read through the script and comment out software you don't want. It will
#       overlap your exiting .zshrc, init.vim, tmux.conf, and pwerline configs for tmux.
#       Please be careful, and back up your exiting config files before running this script.

echo "Start setting up...\n"
echo "Checking software that need to be installed...\n"

# Check for xcode tools, Install if we don't have it
if [ ! $(which xcode-select) ]; then
  echo "Installing xcode-select..."
  xcode-select --install
else
  echo "xcode-select has already been installed. Skipped"
fi

# Install oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Check for Homebrew, Install if we don't have it
if [ ! $(which brew) ]; then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "Homebrew has already been installed. Skipped"
fi

echo "Updating Homebrew..."
brew update

# Check for git, Install if we don't have it
if [ ! $(which git) ]; then
  echo "Installing git..."
  brew install git
else
  echo "git has already been installed. Skipped"
fi

# Check for fzf, Install if we don't have it
if [ ! $(which fzf) ]; then
  echo "Installing fzf..."
  brew install fzf
else
  echo "fzf has already been installed. Skipped"
fi

# Check for ripgrep, Install if we don't have it
if [ ! $(which rg) ]; then
  echo "Installing ripgrep..."
  brew install ripgrep
else
  echo "ripgrep has already been installed. Skipped"
fi

# Check for tmux, Install if we don't have it
if [ ! $(which tmux) ]; then
  echo "Installing tmux..."
  brew install tmux
else
  echo "tmux has already been installed. Skipped"
fi

# Install zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting..."
brew install zsh-syntax-highlighting

# Install zsh-autosuggestions
 echo "Installing zsh-autosuggestions..."
brew install zsh-autosuggestions

# Check for neovim, Install if we don't have it
if [ ! $(which nvim) ]; then
  echo "Installing neovim..."
  brew install neovim
else
  echo "neovim has already been installed. Skipped"
fi

# Check for bat, Install if we don't have it
if [ ! $(which bat) ]; then
  echo "Installing bat..."
  brew install bat
else
  echo "bat has already been installed. Skipped"
fi

# Install python3
if [ ! $(which python3) ]; then
  echo "Installing python3..."
  brew install python3
else
  echo "python3 has already been installed. Skipped"
fi

# Install pynvim
echo "Installing pynvim..."
pip3 install pynvim

# Install powerline
echo "Installing powerline..."
pip3 install powerline-status

# Hard link .zshrc
if [ -f ~/.zshrc ]; then
  echo "Rmeoved existing .zshrc"
  rm ~/.zshrc
fi
echo "Hard link .zshrc"
ln ./zsh/.zshrc ~/.zshrc

# Hard link .zshenv
if [ -f ~/.zshenv ]; then
  echo "Rmeoved existing .zshenv"
  rm ~/.zshenv
fi
echo "Hard link .zshenv"
ln ./zsh/.zshenv ~/.zshenv

echo "Sourcing .zshrc"
source ~/.zshrc

# Install nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# Install node.js
if [ ! $(nvm which current) ]; then
  echo "Installing Node..."
  nvm install stable
else
  echo "Node has already been installed. Skipped"
fi

# Install node neovim
echo "Installing node neovim..."
sudo npm install -g neovim

# Install iterm2
echo "Installing iterm2..."
brew cask install iterm2

# Install nerd font
echo "Installing nerd font..."
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

echo "\nDone!"
