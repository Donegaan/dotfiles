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
# xcode-select --install

# Install and set up Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew doctor
brew update

# Install iTerm2
brew install iterm2

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

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zdharma/fast-syntax-highlighting.git \
  ~ZSH_CUSTOM/plugins/fast-syntax-highlighting

# Set up dotfiles
./install

# Install ruby
brew install rbenv
brew install ruby-build
echo "rbenv is installed."

# Other utilities
brew install alfred
brew install google-chrome
brew install google-backup-and-sync
brew install firefox
brew install firefox-developer-edition
brew install spotify
brew install signal
brew install vlc
# Tiling window manager à la xmonad
# brew install amethyst
brew install visual-studio-code
# brew install flux
brew tap homebrew/cask-fonts
brew install font-fira-code
brew install rectangle
brew install do-not-disturb
brew install knockknock
brew install oversight
# brew install aerial

# Helper utilities
brew install wget

# GUI Settings
# TODO: Automate this, think lots of defaults write commands are needed

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

#       - Allow from app store and identified devs
#     - FileVault / Firewall ON
#   - Date & Time
#     - Clock
#       - Show date
#   - Keyboard
#     - Services
#       - Start Screen Saver (for aerial) - need automator script for this
#     - Shortcuts
#       - Spotlight
#         - Show Spotlight search: alt + Space
#           - Don't forget to install alfred and change to Command + Space

# Set machine sleep to 5 minutes on battery
sudo pmset -b sleep 5

# Alfred
#   - General
#     - Alfred Hotkey
#       - Command + Space
#   - Features
#     - Default Results
#       - Extras: Folders, Documents, Text Files
#   - Appearance
#     - Theme
#       - Alfred macOS Dark
#     - Options
#       - Hide hat on Alfred window
#       - Show on active screen

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

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
#   - Add iterm and Code icons for folders to be dragged to. (Hold cmd plus drag app icon to finder bar)

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
# Might want to change this to Google Docs or $HOME
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

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

# Now that dotfiles have been installed, open installed apps to be configured
open -a iTerm
open -a Firefox
open -a Rectangle
open -a Signal
open -a Spotify
# open -a Flux
open -a Backup\ and\ Sync

echo "run p10k configure in iTerm2 then restart for changes to take effect."
