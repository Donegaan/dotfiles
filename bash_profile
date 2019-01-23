# Add `usr/local` to the `$PATH`
PATH=$PATH:/usr/local
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH
# export PATH=$PATH:~/Documents/python-scripts

eval "$(rbenv init -)"

source ~/.git-completion.bash

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Load the shell dotfiles, and then some:
for file in ~/.{aliases,bash_prompt}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;