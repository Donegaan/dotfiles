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
# You may want to run the individual commands manually, instead of as a       #
# script. In fact, in it's current state, it calls `exit` halfway through     #
# and doesn't finish.                                                         #
#                                                                             #
# TODO:                                                                       #
#   - Utilize Homebrew Cask to install actual apps.                           #
#                                                                             #
# =========================================================================== #

# Install Xcode tools
xcode-select --install
# Note: MacVim (and possibly smlnj I'm not quite sure) require a full-blown
# Xcode installation to work

# Install and set up Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update

# Set up PATH until we clone our dotfiles
# Not necessary on OS X 10.10 (Yosemite)
export PATH="/usr/local/bin:$PATH"

# Install iTerm2
brew cask install iterm2

# Install and setup git
brew install git

# Install newest bash and zsh and make zsh the login shell
brew install bash
brew install bash-completion
echo "$(brew --prefix)/bin/bash" | sudo tee -a /etc/shells
brew install zsh
echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells
chsh -s "$(brew --prefix)/bin/zsh"

# Install gnu coreutils
brew install coreutils
# Note: my bash_profile allows these commands to be run without prefixes

# Install newest vim
brew install vim

# Set up dotfiles
./install

# Set up host-specific (git, sh, zsh, etc.)
# The best way to do this is to look at MacBook Air, Dropbox, & Stripe manually
# Files you'll almost certainly need in some form:
#   gitignore, gitconfig, host.sh, host.zsh
# You may also want to look at:
#   ssh/config


# Now that dotfiles have been installed, open iTerm2
open -a iTerm

# Set up iTerm2

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm_profile"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

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

# Install python
brew install python
brew install python3

# Install node
brew install node

# Helper utilities
brew install wget

# After installing Xcode
# TODO install Xcode using script
sudo xcodebuild -license

# VSCode
#   - Settings Sync
open vscode:extension/Shan.code-settings-sync

p10k configure
# GUI Settings
# TODO: Automate this

# System Preferences
#   - General
#     - Use dark menubar and doc
#     - Default Browser: Firefox
#   - Desktop & Screen Saver
#     - Desktop
#       - Source: Google Drive
#     - Screen Saver
#       - Aerial: https://github.com/JohnCoates/Aerial
#   - Dock
#     - Minimize: Scale effect
#     - Automatically hide and show the dock
#     - Don't show recent apps in dock
#   - Mission Control
#     - Dashboard: As Space?
#   - Sec & Priv
#     - General
#       - Password immediately
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

# Desktop
#   - Sort By
#     - Snap to Grid

# Menu Bar
#   - Battery Icon
#     - Show Percentage

# Spotify
#   - View
#     - Uncheck "Right sidebar"

# Finder
#   - General
#     - New Finder windows show
#       - $HOME or Google Drive?
#   - Advanced
#     - Show all filename extensions
#     - no Show warning before changing an extension
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

# Messages
#
# - Add iCloud account
# - Be sure to sync contacts
# - Google when you need help

# Dock - From left to right
# - Finder
# - Launchpad
# - Firefox
# - Reminders
# - Messages
# - Signal
# - App Store
# - Xcode
# - VSCode
# - Spotify
# - iTerm
# - Settings
# - Vertical Bar
# - Downloads
# - Bin
