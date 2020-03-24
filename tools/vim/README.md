# Settings and config for vim

All the settings regarding vim are done in .vimrc file

After the changes have been made, the vim tool needs to see these changes.

Instead of copying the file to the designated place, a hard/soft link will be created instead.

---

# NOTE: make sure VimPlug is installed

Go to **[link](https://github.com/junegunn/vim-plug#installation)** to install VimPlug

## Install Vim plugins

You can install the plugins by opening Vim

1. Open **~/.vimrc** using **vim**
2. Type `:PlugInstall`
3. When plugin installation has finished type `:q`

or install the plugins without opening Vim

1. `vim +PlugInstall +qall`

## Update Vim plugins

You can update the plugins by opening Vim

1. Open **~/.vimrc** using **vim**
2. Type `:PlugUpdate`
3. When plugin updates has finished type `:q`

or update the plugins without opening Vim

1. `vim +PlugUpdate +qall`
