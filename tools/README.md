# All the tools settings and configs
All the tools used have their own settings and config. 

You can define each settings and config in this directory

Ex: settings/config for vim terminal text editor
Ex: settings/config for tmux terminal multiplexer

Each tool used must have it's own folder
Each tool's folder must have a go to shell script file to setup the settings/config

The default file name will be **index**

Ex: an **index** shellscript file for vim will contain a command to create a symbolic link to the .vimrc file

Import the shellscript file for each tool folder in the unix-terminal-config/tools/index file

# Adding tools settings and config
1. Make a folder for the corresponding tool
2. Add your settings and config in the folder
3. Create a **index** file for the folder
4. Write a script to setup the index file in the folder
5. Add the folder index file to the tools/index file

Ex:
1. Make a folder called **vim**
2. Create a vimrc file and add your own config
3. Create a index file and place it in the vim folder
4. Add script for the vim/index file to setup the vimrc file. In this case create a hard link to the vimrc file at ~
5. Import the vim/index file in tools/index file

# Why hard link
Hard links are used for files only.
Symbolic link are used for folders only

So the changes to the .vimrc for example file are made in one place, and since the hard link will automatically make those changes apparent

Go to [**link**](https://www.nixtutor.com/freebsd/understanding-symbolic-links/) for more details about hard and symbolic link