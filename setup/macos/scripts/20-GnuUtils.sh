#!/bin/sh
# vim:filetype=sh
# vim:syntax=sh
# vim:foldlevel=0
# vim:foldmethod=marker
# vim:formatoptions=crqn1j

brew install findutils
brew install gnu-sed
brew install gnu-tar
brew install gnu-which
brew install gnu-indent
brew install gnutls
brew install grep
brew install ed

brew install watch
brew install wdiff
brew install diffutils

# Coreutils {{{
brew install coreutils
dircolors --print-database > ${XDG_CONFIG_HOME}/dircolors
# }}}

brew install binutils

# Less {{{
mkdir -pv ${XDG_CACHE_HOME}/less
export LESSKEY=${XDG_CONFIG_HOME}/less/lesskey
export LESSHISTFILE=${XDG_CACHE_HOME}/less/history
brew install less
# }}}

brew install tree
brew install gzip
brew install unzip
brew install wget
brew install nmap
brew install gpg
brew install htop
brew install openssh
brew install gawk

brew install make
brew install autoconf
brew install automake

brew install util-linux

brew install stow

