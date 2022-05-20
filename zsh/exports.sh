# EDITOR
export EDITOR="nvim"

export NVM_LAZY=1
export PATH="$HOME/.rbenv/bin:$PATH"

# fzf
export FZF_DEFAULT_COMMAND="rg --files --max-depth=10 -g \"!.git\" -g \"!undodir\" --hidden --color never --follow"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_CTRL_T_OPTS="--preview \"bat --style=numbers --color=always --line-range :500 {}\""
export FZF_DEFAULT_OPTS="--height 96% --reverse --bind=shift-right:preview-page-down,shift-left:preview-page-up"
export FZF_COMPLETION_TRIGGER="#"