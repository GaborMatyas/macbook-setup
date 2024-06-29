# Tmux Keyboard Shortcuts

**Please be aware of the fact that these shortcuts work when on Macbook the...**
- Control key mapped to the Command key
- Command key mapped to the Control key

Each and every command starts with `Cmd + B` keyboard combination, then you have to release this combo and press the following keys for desired effects:

### Window commands

| Shortcut | Effect                                  |
|----------|-----------------------------------------|
| C        | Create a whole new window               |
| 0, 1, 2, 3... | Switch to a window with the specific number |
| L        | Toggle between the opened windows in order |
| ,        | Give the window a name                  |
| W        | Brings up the window tree to navigate in a list |
| &        | Close the current window                |

### Panes

We can split each window into panes, and each pane has its own terminal.

| Shortcut | Effect                                  |
|----------|-----------------------------------------|
| %        | Vertical split of the window            |
| "        | Horizontal split of the window          |
| Space    | Toggle between the built-in layouts     |
| Arrow keys | Switch between panes based on the direction you hit |
| o        | Switch between panes (automatically in circle) |
| z        | Set the current pane as full screen terminal, using again minifies it back to normal |
| x        | Close the current pane                  |

### Session management

| Shortcut   | Effect                                  |
|------------|-----------------------------------------|
| Cmd + B, d | Detach from Tmux, returning back to your normal terminal but keeping the tmux session open in the background |
