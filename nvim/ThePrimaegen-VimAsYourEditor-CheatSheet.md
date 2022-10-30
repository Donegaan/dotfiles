# Cheat sheet for ThePrimaegen ["Vim As Your Editor"](https://www.youtube.com/playlist?list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R) series

ThePrimaegen has created a, in my opinion, great getting started guide for vim in 6 parts.
It has inspired me to look into vim more as a standalone editor instead of just a plugin for most modern IDEs.
Since getting used to new vim commands can be tricky without a cheat sheet, I created this one, containing all the commands that I saw Michael using in this series.

This is by no means a complete cheat sheet for vim and people are giving a lot of good suggestions in the comments to the videos of this series. However, I find this quite comprehensive to get started. This is not an official version and I might have missed something. Please let me know if I did, so I can update the document.

## 1. [The Basic Vim Movements](https://youtu.be/H3o4l4GVLW0)

### Movement keys

Command | Description
--- | ---
`w` | one word forward
`b` | one word backwards
`h` | one character to the left
`j` | one line down
`k` | one line up
`l` | one character to the right

### Copy/Paste/Delete

Command | Description
--- | ---
`y` | yank `yy` to yank line
`p` | paste after for entire line pastes on a new line
`d` | delete and put into buffer `dd` to delete line `dw` to delete word

### Modes

Command | Description
--- | ---
`i` | enter insert mode
`v` | enter visual mode
`V` | enter visual line mode
`<esc>` | exit insert/visual mode  
`<ctrl>+[` | exit insert mode

### Other

Command | Description
--- | ---
`:w` | write the file
`u` | undo

## 2. [Foundation for Speed](https://youtu.be/gSHf_b6AWKc)

Command | Description
--- | ---
`o` / `O` | insert mode on new line below/above
`P` | paste before for entire line pastes on a new line
`a` | enter insert mode after current position
`I` / `A` | insert mode at the beginning/end of line
`/` | enter command mode search for words
`n` / `N` | next/previous search result
`*` / `#` | next/previous occurence of what is under cursor

## 3. [Horizontal Speed](https://youtu.be/Q6mr7w0YmkQ)

Command | Description
--- | ---
`f` / `F` | jump on next/previous of character. Can be combined with `y`, `v` and `d` as in `dt)` to delete until closing parethesis
`t` / `T` | jump up to next/previous character. Used same as `f` / `F`
`;` / `,` | jump to next/previous result
`x` | delete single character
`s` | delete single character and go into insert mode
`c` |delete enter insert mode
`D` | delete rest of the line
`C` | delete rest of the line and enter insert mode
`S` | delete entire line and enter insert mode

## 4. [Vertical Domination](https://youtu.be/4uPRlnTUlMY)

### Absolute moves

Command | Description
--- | ---
`gg` / `G` |go to top/bottom
`:<number>` / `<number>G` | jump to line number

### Relative moves

Command | Description
--- | ---
`<number>j` | move <number> lines down. Quantifiers can be used with other commands as well but are most useful with line jumps. Use `set relativenumber` in your editor to really make use of these.
`{` / `}` | jump to next/previous paragraph
`<ctrl>+u` / `<ctrl>+d` | jump half a page up/down
`%` | jump to the matching `(`, `{`, `[` whatever type of parenthesis you are on right now

### Relative editing

Command | Description
-------- | ---
`di<parenthesis>` | delete everything in surrounding `{([`. `di<number><parenthesis>` will delete everything in between the parenthesis number levels higher. Works the same with `v`, `y` and `c`. Use `a` instead of `i` to also delete the closing parenthesis.
`dip` | delete everything in current paragraph
`diw` | delete the current word

## 5. [Going Full Vim - File Movements, Buffers, Splits](https://youtu.be/N05REqmq0X4)

### Opening/Closing files

Command | Description
--- | ---
`:e <filename>` | search and open file
`:E` | open file tree with `netrw` to navigate to file

With fuzzy finder like fcf

Command | Description
--- | ---
`<ctrl>+p` | activate fcf
`<ctrl>+^` | move between last two opened files
`<ctrl>+o` / `<ctrl>+i` | jump to next/previous opened file
`m<character>` | set local mark at character
`m<capital character>` | set global mark at character
`'<character>` | jump to mark at character
`:q` | close buffer

### Window operations

Command | Description
--- | ---
`<ctrl>+w v` | vertical split
`<ctrl>+w s` | horizontal split
`<ctrl>+w o` | close all open buffers
`:resize <number>` | set number of rows
`:vertical resize <number>` | set number of columns
`<ctrl>+w =` | reset split sizes to default
`<ctrl>+w r` | rotate current buffers
`<ctrl>+w H` | horizontal instead of vertical split

## 6. [Vim Long and Prosper](https://www.youtube.com/watch?v=e1BFdY0NBLY)

Command | Description
--- | ---
`:h <command>` | show documentation on the command