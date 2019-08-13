#!/bin/sh
# vim:filetype=sh
# vim:syntax=sh
# vim:foldlevel=0
# vim:foldmethod=marker
# vim:formatoptions=crqn1j

# Shell {{{
stow -v -d ${CONFIG_DIR} -t ${XDG_CONFIG_HOME} shell
# Configure ~/.profile
echo 'source ${HOME}/.config/shell/profile' >> ${HOME}/.profile
# }}}

# Bash {{{
stow -v -d ${CONFIG_DIR} -t ${XDG_CONFIG_HOME} bash
# Configure ~/.bash_profile
echo 'source ${HOME}/.config/bash/profile' >> ${HOME}/.bash_profile
# Configure ~/.bashrc
echo 'source ${HOME}/.config/bash/bashrc' >> ${HOME}/.bashrc
brew install bash
grep -q -f $(which bash) /etc/shells || echo $(which bash) | sudo tee -a /etc/shells
chsh -s $(which bash)
# }}}

# Zsh {{{
stow -v -d ${CONFIG_DIR} -t ${XDG_CONFIG_HOME} zsh
# Configure ~/.zshenv
echo 'source ${HOME}/.config/zsh/zshenv' >> ${HOME}/.zshenv
brew install zsh
grep -q -f $(which zsh) /etc/shells || echo $(which zsh) | sudo tee -a /etc/shells
chsh -s $(which zsh)
# }}}

# Tmux {{{
export TMUX_PLUGIN_MANAGER_PATH=${XDG_CACHE_HOME}/tmux/plugins

if [ -d ${TMUX_PLUGIN_MANAGER_PATH} ]; then
    rm -rf ${TMUX_PLUGIN_MANAGER_PATH}
fi
mkdir -pv ${TMUX_PLUGIN_MANAGER_PATH}
git clone --depth 1 https://github.com/tmux-plugins/tpm ${TMUX_PLUGIN_MANAGER_PATH}/tpm

stow -v -d ${CONFIG_DIR} -t ${XDG_CONFIG_HOME} tmux

brew install tmux
brew install reattach-to-user-namespace
# }}}

