#!/usr/bin/env bash
# =========================================================================== #
#                                                                             #
#                                                                             #
#  Original Author:  Jake Zimmerman,  https://github.com/jez                  #
#                                                                             #
# This is a script designed to be run on a fresh OS X installation.           #
# It has yet to be tested, though it is an accurate transcription of          #
# I just ran when setting up my OS X installation after a clean re-install.   #
#                                                                             #
#                                                                             #
# =========================================================================== #

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Xcode tools
xcode-select --install

# Install and set up Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew doctor
brew update

# Install iTerm2
brew cask install iterm2

# Install newest bash and zsh and make zsh the login shell
brew install bash
brew install bash-completion
echo "$(brew --prefix)/bin/bash" | sudo tee -a /etc/shells
brew install zsh
echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells
chsh -s "$(brew --prefix)/bin/zsh"

# Install gnu coreutils
brew install coreutils

# Install newest vim
brew install vim

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set up dotfiles
./install

# Install ruby
brew install rbenv
brew install ruby-build
echo "rbenv is installed."

# Other utilities
brew cask install alfred
brew cask alfred
brew cask install google-chrome
brew cask install google-backup-and-sync
brew cask install firefox
brew cask install firefox-developer-edition
brew cask install spotify
brew cask install signal
brew cask install vlc
# Tiling window manager à la xmonad
# brew cask install amethyst
brew cask install visual-studio-code
brew cask install flux
brew tap homebrew/cask-fonts
brew cask install font-fira-code

# Helper utilities
brew install wget

# OS Settings

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# GUI Settings
# TODO: Automate this, think lots of defaults write commands are needed

# System Preferences
#   - General
#     - Use dark menubar and doc
#     - Default Browser: Firefox
#   - Desktop & Screen Saver
#     - Desktop
#       - Source: Google Drive
#     - Screen Saver
#       - Aerial: https://github.com/JohnCoates/Aerial

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Automatically hide and show the dock
defaults write com.apple.dock autohide -bool true

# Set time for dock to appear to be 0.12 so its quicker than default but not jarring
defaults write com.apple.dock autohide-time-modifier -float 0.12

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use the Dock to launch apps.
defaults write com.apple.dock persistent-apps -array

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

#   - Sec & Priv
#     - General

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

#       - Allow for app store and identified devs
#     - FileVault / Firewall ON
#   - Trackpad
#     - Point & Click
#       - No lookup with 3 fingers
#       - Secondary click
#     - More Gestures
#       - All except App Exposé
#   - Date & Time
#     - Clock
#       - Show date
#   - Keyboard
#     - Keyboard
#       - Key repeat
#         - 1 from Fast
#       - Delay until repeat
#         - 3 from left
#       - Touch Bar shows: Expanded Control Strip
#     - Services
#       - Start Screen Saver (for aerial) - need automator script for this
#     - Shortcuts
#       - Spotlight
#         - Show Spotlight search: Ctrl + Space
#           - Don't forget to install alfred and change to Command + Space

# Set machine sleep to 5 minutes on battery
sudo pmset -b sleep 5

# Alfred
#   - General
#     - Alfred Hotkey
#       - Command + Space
#   - Appearance
#     - Theme
#       - Alfred macOS Dark
#     - Options
#       - Hide hat on Alfred window
#       - Hide menu bar icon

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Menu Bar
#   - Battery Icon
#     - Show Percentage

# Spotify
#   - View
#     - Uncheck "Right sidebar"

###############################################################################
# Finder                                                                      #
###############################################################################

#   - Favorites
#     - Applications
#     - Desktop
#     - Downloads
#     - Documents
#     - Google Drive
#     - GitHub
#     - Home
#     - AirDrop
#   - Sort By:
#     - View > [hold Option] Sort by ... > Name (⌃⌥⌘1)
#   - Add iterm and Code icons for folders to be dragged to.

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
# Might want to change this to Google Docs or $HOME
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Set low spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0.2

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show the ~/Library folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

# Use column view in all Finder windows by default. Icon, List, Column, Gallery
# Four-letter codes for the other view modes: `icnv`, `Nlsv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true


###############################################################################
# iTerm2                                                                      #
###############################################################################

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm_profile"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Messages
#
# - Add iCloud account
# - Be sure to sync contacts
# - Google when you need help

###############################################################################
# Mac App Store                                                               #
###############################################################################


# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

###############################################################################
# Finishing up                                                                #
###############################################################################

echo "Set lock text: defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText \"<message>\""

# VSCode
#   - Settings Sync
open vscode:extension/Shan.code-settings-sync

# Now that dotfiles have been installed, open iTerm2
open -a iTerm

echo "run p10k configure in iTerm2"

echo "Done. Restart for changes to take effect."