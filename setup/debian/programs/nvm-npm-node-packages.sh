#!/bin/bash

echo "📦 Installing nvm"
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

# source ~/.bashrc

nvm install node
nvm install-latest-npm

npm install -g autoprefixer postcss-cli
npm install -g markdown-link-check
npm install -g standard
npm install -g typescript
npm install -g cli-typer
npm install -g commitizen
npm install -g create-react-app
npm install -g cz-conventional-changelog
npm install -g cz-emoji
npm install -g eslint
npm install -g git-stats
npm install -g lighthouse
npm install -g npm
npm install -g npm-check-updates
npm install -g react-native-cli
npm install -g semantic-release-cli
npm install -g source-map-explorer
npm install -g standard-version
npm install -g typescript
npm install -g yarn

echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc