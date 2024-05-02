# Interesting tricks about bash

Created 20-04-2024, last change 20-04-2024

## Key bindings

This displays the bound keys:

    bind -p | fgrep -v '(not bound)' | fgrep -v 'self-insert'

Key bindings I needed to learn:
C-a , C-e goto start / end of line

### Bind Meta Cursor left / right

.inputrc:
"\e\e[D": backward-word
"\e\e[C": forward-word

bind -f ~/.inputrc

## iTerm2

Profiles / Keys / General: remapping left option key to Esc+ makes it Meta, which is good for readline
(e.g. M-f / M-b for forward/backward word)
