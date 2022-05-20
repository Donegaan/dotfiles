# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Autosuggestion colour
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=102"

# Colours:
#   Background: #282B34, #282C34
#   Text: #A8AEBB

# Set list of themes to loadp
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

([[ -f "$HOME/.fzf.zsh" ]] || (git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install)) && source "$HOME/.fzf.zsh"

([[ -f "$HOME/.cache/z.lua" ]] || (cd ~/.cache && curl -fsSLO https://raw.githubusercontent.com/skywind3000/z.lua/master/z.lua)) && eval "$(lua ~/.cache/z.lua --init zsh once enhanced fzf)"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vscode
  bundler
  sudo
  rails
  ruby
  you-should-use
  zsh-autosuggestions
  zsh-nvm
  fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias x="z -I"
alias sk="sidekiq"
alias dot="code ~/dotfiles"
alias path='echo -e ${PATH//:/\\n}' # Print each PATH entry on a separate line
alias cat='bat'
alias python='python3'
alias docker='nocorrect docker'
alias j='jrnl'
alias je='jrnl -today --edit'
alias jt='jrnl -today'
alias jy='jrnl -on yesterday'

# Ubuntu
alias open="xdg-open" # Opens file explorer on ubuntu 20.04
alias lock='gnome-screensaver-command -l'

# Vim
alias vim='nvim'
alias vcs='cat ~/dotfiles/nvim/Vim_as_your_editor.md'


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf
export FZF_DEFAULT_COMMAND="rg --files --max-depth=10 -g \"!.git\" -g \"!undodir\" --hidden --color never --follow"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_CTRL_T_OPTS="--preview \". $ZDOTDIR/functions/fuzzy_preview {}\""
export FZF_DEFAULT_OPTS="--height 96% --reverse --bind=shift-right:preview-page-down,shift-left:preview-page-up"
export FZF_COMPLETION_TRIGGER="#"
export FZF_COMPLETION_TRIGGER="#"

export PATH="$HOME/.rbenv/bin:$PATH"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(rbenv init -)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
