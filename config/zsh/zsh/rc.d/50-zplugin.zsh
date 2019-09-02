# vim:syntax=zsh
# vim:filetype=zsh
# vim:foldlevel=0
# vim:foldmethod=marker
# vim:formatoptions=crqn1j

# ZPlugin {{{
# Set paths
declare -A ZPLGM
ZPLGM[HOME_DIR]=${XDG_CONFIG_HOME}/zplugin

ZPLGM[BIN_DIR]=${ZPLGM[HOME_DIR]}/bin
ZPLGM[PLUGINS_DIR]=${ZPLGM[HOME_DIR]}/plugins
ZPLGM[COMPLETIONS_DIR]=${ZPLGM[HOME_DIR]}/completions
ZPLGM[SNIPPETS_DIR]=${ZPLGM[HOME_DIR]}/snippets
ZPLGM[SERVICES_DIR]=${ZPLGM[HOME_DIR]}/services

ZPFX=${ZPLGM[HOME_DIR]}/polaris

ZPLGM[ZCOMPDUMP_PATH]=${ZSH_CACHE_DIR}/zcompdump

ZPLGM[COMPINIT_OPTS]="-C"
ZPLGM[MUTE_WARNINGS]=0

export ZPLGM

# Install
if [[ ! -d ${ZPLGM[HOME_DIR]} ]]; then
    mkdir -p ${ZPLGM[HOME_DIR]}
    git clone https://github.com/zdharma/zplugin.git ${ZPLGM[HOME_DIR]}/bin
fi

# Create cache directory
if [[ ! -d ${ZSH_CACHE_DIR}/zcompdump ]]; then
    mkdir -p ${ZSH_CACHE_DIR}/zcompdump
fi

# Enable completion
autoload -Uz compinit
compinit -d ${ZPLGM[ZCOMPDUMP_PATH]}

# Load
source ${ZPLGM[BIN_DIR]}/zplugin.zsh

autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

zplugin cdreplay -q
# }}}

# Plugins {{{
# Reference: https://github.com/zsh-users/zsh-completions
zplugin ice wait"0" lucid blockf
zplugin light zsh-users/zsh-completions

# Reference: https://github.com/hlissner/zsh-autopair
zplugin ice wait"0" lucid
zplugin load hlissner/zsh-autopair

# Reference: https://github.com/zsh-users/zsh-autosuggestions
zplugin ice wait"0" lucid atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

# Reference: https://github.com/zdharma/history-search-multi-word
zplugin ice wait"1" lucid
zplugin load zdharma/history-search-multi-word

# Reference: https://github.com/supercrabtree/k
zplugin ice wait"1" lucid
zplugin light supercrabtree/k

# Reference: https://github.com/laggardkernel/zsh-thefuck
zplugin ice wait"1" lucid
zplugin light laggardkernel/zsh-thefuck

# Reference: https://github.com/trapd00r/LS_COLORS
zplugin ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zplugin light trapd00r/LS_COLORS

# Reference: https://github.com/romkatv/powerlevel10k
zplugin light romkatv/powerlevel10k

# Reference: https://github.com/zdharma/fast-syntax-highlighting
zplugin ice wait"0" lucid atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

# Reference: https://github.com/knu/zsh-manydots-magic
zplugin ice pick"manydots-magic" atload"autoload -Uz manydots-magic;manydots-magic"
zplugin light knu/zsh-manydots-magic
# }}}

