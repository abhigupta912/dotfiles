#!/bin/sh
# vim:filetype=sh
# vim:syntax=sh
# vim:foldlevel=0
# vim:foldmethod=marker
# vim:formatoptions=crqn1j

# Fzf {{{
# Reference: https://github.com/junegunn/fzf
if [ -d ${XDG_CONFIG_HOME}/fzf ]; then
    rm -rf ${XDG_CONFIG_HOME}/fzf
fi
mkdir -pv "${XDG_CONFIG_HOME}/fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ${XDG_CONFIG_HOME}/fzf/fzf
${XDG_CONFIG_HOME}/fzf/fzf/install --xdg --64 --no-update-rc --key-bindings --completion
# }}}

# Forgit {{{
# Reference: https://github.com/wfxr/forgit
if [ -d ${XDG_CONFIG_HOME}/forgit ]; then
    rm -rf ${XDG_CONFIG_HOME}/forgit
fi
git clone --depth 1 https://github.com/wfxr/forgit ${XDG_CONFIG_HOME}/forgit
# }}}

# Lesspipe {{{
# Reference: https://github.com/wofr06/lesspipe.git
if [ -d /tmp/lesspipe ]; then
    rm -rf /tmp/lesspipe
fi
git clone --depth 1 https://github.com/wofr06/lesspipe.git /tmp/lesspipe
pushd ${PWD}
cd /tmp/lesspipe
./configure --default
sudo cp /tmp/lesspipe/lesspipe.sh /usr/local/bin
sudo cp /tmp/lesspipe/code2color /usr/local/bin
sudo cp /tmp/lesspipe/sxw2txt /usr/local/bin
sudo cp /tmp/lesspipe/tarcolor /usr/local/bin
popd
rm -rf /tmp/lesspipe
# }}}

# BashIt {{{
# Reference: https://github.com/Bash-it/bash-it
if [ -d ${XDG_CONFIG_HOME}/bash_it ]; then
    rm -rf ${XDG_CONFIG_HOME}/bash_it
fi
git clone --depth 1 https://github.com/Bash-it/bash-it.git ${XDG_CONFIG_HOME}/bash_it
${XDG_CONFIG_HOME}/bash_it/install.sh --silent --no-modify-config
# }}}

# Enhancd {{{
# Reference: https://github.com/b4b4r07/enhancd
if [ -d ${XDG_CONFIG_HOME}/enhancd ]; then
    rm -rf ${XDG_CONFIG_HOME}/enhancd
fi
git clone --depth 1 https://github.com/b4b4r07/enhancd ${XDG_CONFIG_HOME}/enhancd
# }}}

