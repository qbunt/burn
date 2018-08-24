#!/usr/bin/env bash
read -p "bro, you sure? " -n 1 -r
echo 
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "yeah, didn't think so"
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

sudo -v
# prompt the user for root creds
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
echo 🔥
# nuke user's google login session
for BROWSER in "Google Chrome" "Safari" "firefox"
do
    /usr/bin/open -a "/Applications/$BROWSER.app" 'http://accounts.google.com/logout'
    sleep 10
    killall "$BROWSER"
done
echo $?

# secure nuke sensitive userspace folders
srm -rv $HOME/Dropbox
srm -rv $HOME/.dropbox*
srm -rv $HOME/downloads
srm -rv $HOME/Google\ Drive
srm -rv $HOME/VirtualBox\ VMs
srm -rv $HOME/go
echo "all user data removed..."

# nuke icloud login
defaults delete MobileMeAccounts
echo "removed icloud login..."

# nuke user's dropbox and google drive folders
for CASK in "keybase" "signal" "dropbox" "google-backup-and-sync" "marshallofsound-google-play-music-player" "jetbrains-toolbox" "tower" "kaleidoscope" 
do
    echo "nuking $CASK..."
    brew cask zap $CASK --force
done
echo "all casks removed..."

# nuke homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
echo "done."

exit 0