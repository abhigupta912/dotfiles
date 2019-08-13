#!/bin/sh
# vim:filetype=sh
# vim:syntax=sh

# Command line tools {{{
xcode-select --install
# }}}

# Homebrew {{{
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# }}}

# Git {{{
brew install git
# }}}

