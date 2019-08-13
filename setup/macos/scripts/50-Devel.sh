#!/bin/sh
# vim:filetype=sh
# vim:syntax=sh
# vim:foldlevel=0
# vim:foldmethod=marker
# vim:formatoptions=crqn1j

# Ruby {{{
brew install ruby
gem install neovim
# }}}

# Python {{{
brew install python
pip install --user pipenv
pip install --user pynvim
# }}}

# Node {{{
# NVM
export NVM_DIR=${XDG_CONFIG_HOME}/nvm

# NPM
export NPM_CONFIG_USERCONFIG=${XDG_CONFIG_HOME}/npm/npmrc
stow -v -d ${CONFIG_DIR} -t ${XDG_CONFIG_HOME} npm

# Create Directory
if [ -d ${XDG_CONFIG_HOME}/nvm ]; then
    rm -rf ${XDG_CONFIG_HOME}/nvm
fi
mkdir -pv "${XDG_CONFIG_HOME}/nvm"

# Install NVM
(export PROCESS=/dev/null && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash)

# Install Yarn
# Reference: https://github.com/yarnpkg/yarn
brew install yarn
yarn global add neovim
# }}}

# Go {{{
export GOPATH="$HOME/go"
mkdir -pv $GOPATH
brew install go
# }}}

# Rust {{{
export CARGO_HOME=${XDG_CACHE_HOME}/cargo
export RUSTUP_HOME=${XDG_CACHE_HOME}/rustup
curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
# }}}

