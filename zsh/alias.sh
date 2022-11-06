alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias x="zi"
alias sk="sidekiq"
alias dot="code ~/dotfiles"
alias path='echo -e ${PATH//:/\\n}' # Print each PATH entry on a separate line
alias bat='batcat'
alias cat='bat'
alias python='python3'
alias docker='nocorrect docker'
alias bundle='nocorrect bundle'
alias sudo=$'nocorrect sudo\t'
alias j='jrnl'
alias je='jrnl -today --edit'
alias jt='jrnl -today'
alias jy='jrnl -on yesterday'
alias jf='jrnl -on friday'
alias vsc='code'

# Ubuntu
alias open="xdg-open" # Opens file explorer on ubuntu 20.04
alias lock='gnome-screensaver-command -l'

# Vim
alias v='lvim'
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
alias gwt='git worktree'
alias gwta='git worktree add'
alias gwtls='git worktree list'
alias gwtlo='git worktree lock'
alias gwtmv='git worktree move'
alias gwtpr='git worktree prune'
alias gwtrm='git worktree remove'
alias gwtulo='git worktree unlock'
alias gdft='git difftool'
