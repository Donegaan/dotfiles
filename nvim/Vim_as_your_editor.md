# Vim As Your Editor 1/6: Basic Movements
`h`: left
`j`: down
`k`: up
`l`: right

`w`: forward by a word
`b`: forward by a word

`shift+i`: beginning of line
`shift+a`: end of line

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
