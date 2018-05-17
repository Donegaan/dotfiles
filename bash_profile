# Add `usr/local` to the `$PATH`
PATH=$PATH:/usr/local
export PATH

# Load the shell dotfiles, and then some:
for file in ~/.{aliases,bash_prompt}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;





