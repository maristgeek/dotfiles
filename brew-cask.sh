#!/usr/bin/env bash

# Install native apps
# https://github.com/Homebrew/homebrew-cask/tree/master/Casks

# Link Homebrew casks in `/Applications` rather than `~/Applications`
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# brew install caskroom/cask/brew-cask
brew tap caskroom/cask
brew tap caskroom/versions

# add brew-cask-upgrade
brew tap buo/cask-upgrade


# TODO: look into
## always
# brew cask install alfred
# brew cask install bettertouchtool
# brew cask install caffeine
# brew cask install karabiner
# brew cask install rescuetime
# brew cask install stay
# brew cask install xquartz
## multimedia
# brew cask install gyazo
## utilities
# brew cask install amethyst
# brew cask install tripmode


# always
brew cask install dropbox
brew cask install evernote
# probably unneeded due to Night Shift
# brew cask install flux
brew cask install google-chrome
brew cask install spectacle
brew cask install the-unarchiver
brew cask install transmission

# chat
# brew cask install adium
brew cask install discord
# brew cask install google-hangouts
# brew cask install mumble
brew cask install skype
brew cask install slack

# development
brew cask install iterm2
# brew cask install menumeters
brew cask install kdiff3
brew cask install p4v
brew cask install sublime-text
brew cask install vagrant
brew cask install vagrant-manager
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install visual-studio-code
# brew cask install wireshark

# multimedia
# brew cask install exiftool
brew cask install skitch
brew cask install spotify
brew cask install vlc

# TODO
# quicklook plugins
# brew cask install betterzipql
# brew cask install qlcolorcode
# brew cask install qlmarkdown
# brew cask install qlprettypatch
# brew cask install qlstephen
# brew cask install quicklook-csv
# brew cask install quicklook-json
# brew cask install suspicious-package

# security
brew cask install 1password
brew cask install keybase
brew cask install lastpass
# brew cask install tunnelblick

# utilities
# brew cask install logitech-unifying