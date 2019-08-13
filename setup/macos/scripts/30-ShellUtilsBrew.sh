#!/bin/sh
# vim:filetype=sh
# vim:syntax=sh
# vim:foldlevel=0
# vim:foldmethod=marker
# vim:formatoptions=crqn1j

# Git {{{
stow -v -d ${CONFIG_DIR} -t ${XDG_CONFIG_HOME} git
# brew install git
# }}}

# Bat {{{
# Reference: https://github.com/sharkdp/bat
stow -v -d ${CONFIG_DIR} -t ${XDG_CONFIG_HOME} bat
brew install bat
# }}}

# Diff So Fancy {{{
# Reference: https://github.com/so-fancy/diff-so-fancy
brew install diff-so-fancy
# }}}

# Git Extras {{{
# Reference: https://github.com/tj/git-extras
brew install git-extras
# }}}

# Exa {{{
# Reference: https://github.com/ogham/exa
brew install exa
# }}}

# Fd {{{
# Reference: https://github.com/sharkdp/fd
brew install fd
# }}}

# Ripgrep {{{
# Reference: https://github.com/BurntSushi/ripgrep
export RIPGREP_CONFIG_PATH=${XDG_CONFIG_HOME}/ripgrep/config
stow -v -d ${CONFIG_DIR} -t ${XDG_CONFIG_HOME} ripgrep
brew install ripgrep
# }}}

