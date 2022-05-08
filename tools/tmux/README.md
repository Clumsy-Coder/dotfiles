# tmux/

## dotbot config

Used by [dotfiles/meta/configs/tmux.yaml](https://github.com/Clumsy-Coder/dotfiles/blob/master/meta/configs/tmux.yaml)

## File/Directory structure

<pre>
<a href="../../../../">dotfiles/</a>tools/tmux/
├── <a href="./README.md">README.md</a>
├── <a href="./hotkeys.tmux.conf">hotkeys.tmux.conf</a>
├── <a href="./plugins.tmux.conf">plugins.tmux.conf</a>
├── <a href="./theme.tmux.conf">theme.tmux.conf</a>
└── <a href="./tmux.conf">tmux.conf</a>
</pre>

### tmux.conf

main tmux config file. Imports tmux settings from other files.

- Set tmux config.
- Load tmux config
  - [`./hotkeys.tmux.conf`](./hotkeys.tmux.conf)
  - [`./plugins.tmux.conf`](./plugins.tmux.conf)
  - [`./theme.tmux.conf`](./theme.tmux.conf)
- Load tmux plugin manager
  - Download tmux plugin manager **IF** not installed
- Load tmux plugins

### hotkeys.tmux.conf

Contains all the hotkeys used to operate tmux.

NOTE: this was made for **iterm2**. At the time this was being developed on **MacOS**. So in order for the hotkeys to work on a debian based terminal, some extra work needs to be done. Such as send extra commands when a specific hotkey is pressed (the terminal catches it and sends out it corresponding hotkeys to the shell).

Summary:

- **Prefix** is changed to `Ctrl + a`
- **Meta** is changed to `Alt`
- **S** is changed to `Shift`
- Create a vertical pane: `prefix + |`
- Create a horizontal pane: `prefix + -`
- Reload tmux config: `prefix + r`
- Switch active pane
  - Go to up pane: `Meta + ↑`
  - Go to down pane: `Meta + ↓`
  - Go to left pane: `Meta + ←`
  - Go to right pane: `Meta + →`
- Resizing active pane
  - Resize pane up: `prefix + ↑`
  - Resize pane down: `prefix + ↓`
  - Resize pane left: `prefix + ←`
  - Resize pane right: `prefix + →`
- Switch window of current tmux session
  - Switch window left: `shift + meta + ←`
  - Switch window right: `shift + meta + →`

### plugins.tmux.conf

Plugins for tmux.
Tmux plugin manager is installed automatically in [`./tmux.conf`](./tmux.conf)

### theme.tmux.conf

Some custom config for tmux theme.
