bindkey -s "^h" 'tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr^M'
bindkey -s "^o" 'vim $(fzf)^M'
