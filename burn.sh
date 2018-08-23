#!/usr/bin/env bash
sudo -v
# prompt the user for root creds
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

/usr/bin/open -a "/Applications/Google Chrome.app" 'http://accounts.google.com/logout'

echo $HOME/Dropbox
echo $HOME/.dropbox*
echo $HOME/Google\ Drive
echo $HOME/VirtualBox\ VMs
echo $HOME/go

# drop remove the user's dropbox and google drive folders
brew cask uninstall dropbox
brew cask uninstall google-backup-and-sync
brew cask uninstall marshallofsound-google-play-music-player
brew cask uninstall jetbrains-toolbox
brew cask uninstall tower
brew cask uninstall kaleidoscope
brew cask uninstall kaleidoscope

