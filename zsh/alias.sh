alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias x="zi"
alias sk="sidekiq"
alias dot="code ~/dotfiles"
alias path='echo -e ${PATH//:/\\n}' # Print each PATH entry on a separate line
alias cat='bat'
alias python='python3'
alias docker='nocorrect docker'
alias rails='bundle exec rails'
alias rspec='bundle exec rspec'
alias tldr='nocorrect tldr'
alias java='nocorrect java'
alias sudo=$'nocorrect sudo\t'
alias j='jrnl'
alias je='jrnl -on today --edit'
alias jt='jrnl -on today'
alias jy='jrnl -on yesterday'
alias jf='jrnl -on friday'
alias jte='jrnl todo --edit'
alias jtt='jrnl -to today todo'
alias vsc='code'
alias journal_update='~/dotfiles/journal/journal_export.sh'

# Ubuntu
alias open="xdg-open" # Opens file explorer on ubuntu 20.04
alias lock='gnome-screensaver-command -l'
alias full_update='sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get autoremove -y'

# Vim
alias v='nvim'
alias v.='v .'
alias vim='v'

# Mac
alias god="cd ~/Google\ Drive/"
alias gi="cd ~/GitHub"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias doc="cd ~/Documents"
alias dot="vim ~/dotfiles"
# alias loadnvm=". $(brew --prefix nvm)/nvm.sh"
# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Git
alias gdft='git difftool'
alias gcof='git branch --sort=-committerdate | fzf --header "Checkout Recent Branch" --preview "git diff {1} --color=always" --pointer="" | xargs git checkout'
