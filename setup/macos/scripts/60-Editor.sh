#!/bin/sh
# vim:filetype=sh
# vim:syntax=sh
# vim:foldlevel=0
# vim:foldmethod=marker
# vim:formatoptions=crqn1j

# Vim {{{
export VIMDOTDIR=${XDG_CONFIG_HOME}/vim
stow -v -d ${CONFIG_DIR} -t ${XDG_CONFIG_HOME} vim
brew install vim
vim +PlugInstall +qall
# }}}

# Neovim {{{
stow -v -d ${CONFIG_DIR} -t ${XDG_CONFIG_HOME} nvim
brew install neovim
# }}}

