# Vim As Your Editor 1/6: Basic Movements

`h`: left
`j`: down
`k`: up
`l`: right

`w`: forward by a word
`b`: forward by a word

`shift+i`: beginning of line
`shift+a`: end of line

## Horizontal Speed

`f` jumps to character
`t` jumps to behind character
`F` and `T` jump backwards through results
`;` to jump forward and `,` to jump backwards through results
`x` to delete a character, `s` to delete character and enter insert mode
`cw` (or `ce`) to delete word and enter insert mode
combos: `dt)`, `vf)`, `vt)`, `yt)`, `ct)`, etc.
`D` delete rest of line, `C` delete rest of line and enter insert mode
`S` delete entire line and enter insert mode

## Editing commands

`yy`: yank
`p`: paste
`shift+p`: paste above current line
`dd`: delete line
`u`: undo last command

## Visual

`shift+v`: visual line mode
`v`: visual mode

## Insert

`i`: Go into insert mode
`a`: Go into insert mode and move cursor to right of character
`Esc`: Leave
`Ctrl+c`: Works but doesn't run abbreviations
`Ctrl+[`: Leave
`o`: insert line below current line
`shift+o`: insert line above current line

## Combos

`dw`: delete word
`dj`: delete line + 1 down
`yw`: yank ...
`yj`: yank ...

## Write

`:w`

## Search

`/`: Search (puts you in command mode)
`n`: hop through results
`shift+n`: hop through results backwards
`*`: jump to next occurence of what's underneath your cursor
`#`: ^ but backwards
