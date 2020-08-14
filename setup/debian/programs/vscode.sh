#!/bin/bash

# credit: https://github.com/victoriadrake/dotfiles/blob/master/scripts/programs/vsc.sh

# https://code.visualstudio.com/docs/setup/linux
echo "⌨️  Installing VSCode"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code
rm microsoft.gpg
function install {
  name="${1}"
  code --install-extension ${name} --force
}

install byi8220.indented-block-highlighting
install cliffordfajardo.highlight-line-vscode
install eg2.vscode-npm-script
# install foxundermoon.shell-format
# install joaompinto.vscode-graphviz
install liviuschera.noctis
# install ms-python.python
# install ms-vscode-remote.remote-containers
# install simonsiefke.svg-preview
install AlanWalk.markdown-toc
install alexdima.copy-relative-path
install christian-kohler.npm-intellisense
install christian-kohler.path-intellisense
install CoenraadS.bracket-pair-colorizer
install cssho.vscode-svgviewer
install DavidAnson.vscode-markdownlint
install dbaeumer.vscode-eslint
install deerawan.vscode-faker
install donjayamanne.githistory
install dsznajder.es7-react-js-snippets
install dunstontc.viml
install dzannotti.vscode-babel-coloring
install eamodio.gitlens
install EditorConfig.EditorConfig
install EQuimper.react-native-react-redux
install ericadamski.carbon-now-sh
install esbenp.prettier-vscode
install formulahendry.auto-close-tag
install formulahendry.auto-complete-tag
install formulahendry.auto-rename-tag
install gamunu.vscode-yarn
install GitHub.vscode-codeql
install hbenl.vscode-test-explorer
install heyimfuzz.banner-comments
install jdinhlife.gruvbox
install joelday.docthis
install jpoissonnier.vscode-styled-components
install lamartire.git-indicators
install leizongmin.node-module-intellisense
install lunarlimbo.banner-comments-plus
install malmaud.tmux
install mgmcdermott.vscode-language-babel
install mhutchie.git-graph
install mikestead.dotenv
install monokai.theme-monokai-pro-vscode
install mrmlnc.vscode-json5
install ms-azuretools.vscode-docker
install ms-vscode.node-debug2
install msjsdiag.vscode-react-native
install naco-siren.gradle-language
install naumovs.color-highlight
install oderwat.indent-rainbow
install Orta.vscode-jest
install PKief.material-icon-theme
install Prisma.vscode-graphql
install rebornix.ruby
install redhat.vscode-yaml
install ritwickdey.LiveServer
install softwaredotcom.swdc-vscode
install spywhere.guides
install streetsidesoftware.code-spell-checker
install VladimirMikulic.shell-banner-comments
install waderyan.gitblame
install wayou.vscode-todo-highlight
install william-voyek.vscode-nginx
install wingrunr21.vscode-ruby
install wix.vscode-import-cost
install wmaurer.change-case
install yzhang.markdown-all-in-one
install ziyasal.vscode-open-in-github

