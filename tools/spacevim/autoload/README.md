# spacevim/autoload/

spacevim custom configs.

Used for adding configs that spacevim is too limited to use for.

## File/Directory structure

<!--
loaded tree structure with
tree -a -C -H "." tools/spacevim/autoload -L 1
-->

<pre>
<a href="../../../../../">dotfiles/</a>tools/vim/spacevim/autoload/
├── <a href="./README.md">README.md</a>
├── <a href="./configs/">configs/</a>
├── <a href="./editor.vim">editor.vim</a>
├── <a href="./keymaps.vim">keymaps.vim</a>
├── <a href="./myspacevim.vim">myspacevim.vim</a>
└── <a href="./plugins.vim">plugins.vim</a>
</pre>

### configs/

Contains all vim plugin configs.

Loaded by `plugins.vim`

### editor.vim

Contains all editor configs

### keymaps.vim

Custom keymaps for vim

### myspacevim.vim

Used for bootstrapping custom vim configs with spacevim

check https://spacevim.org/documentation/#bootstrap-functions

### plugins.vim

Load vim plugin configs in `configs/` folder
