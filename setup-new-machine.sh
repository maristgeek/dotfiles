#!/usr/bin/env bash

# update osx
sudo softwareupdate -i -a

# install xcode command line tools
echo "Installing xcode-command line tools"
xcode-select --install

# install rvm stable
echo "Installing rvm..."
\curl -sSL https://get.rvm.io | bash -s stable

# install homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install brew apps
echo "Installing brew apps..."
./brew.sh
./brew-cask.sh

# change to bash 4 (installed by homebrew)
BASHPATH=$(brew --prefix)/bin/bash
sudo echo $BASHPATH >> /etc/shells
chsh -s $BASHPATH # will set for current user only.
echo $BASH_VERSION # should be 4.x not the old 3.2.X