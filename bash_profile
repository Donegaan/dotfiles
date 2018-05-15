#Inspiration from: https://github.com/mathiasbynens/dotfiles

PATH=/Library/Frameworks/Python.framework/Versions/3.6/bin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/bin:/usr/local/texlive/2018/bin/x86_64-darwin

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
for file in ~/.{aliases,bash_prompt}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# echo 'Test'

read -r -d '' VAR <<'EOF'
            .----.
         _.'__    `. 
     .--(#)(##)---/#\
   .' @          /###\
   :         ,   #####
    `-..__.-' _.-\###/  
          `;_:    `"'
        .'"""""`. 
       /,  JOE  ,\
      //  COOL!  \\
      `-._______.-'
      ___`. | .'___ 
     (______|______)
EOF
echo "$VAR"




