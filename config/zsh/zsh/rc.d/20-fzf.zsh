# vim:syntax=zsh
# vim:filetype=zsh
# vim:foldlevel=0
# vim:foldmethod=marker
# vim:formatoptions=crqn1j

# FZF {{{
# Installtion:
[[ -f ${HOME}/.config/fzf/fzf.zsh ]] && source ${HOME}/.config/fzf/fzf.zsh

# Usage:
# Ctrl + r - search through bash history with fzf
# mv dir/** - expand a directory with (**) and select from fzf
# Alt + c - change directory from fzf
# Ctrl + t - insert file from fzf into command

# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules}/*" 2> /dev/null'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Use fd (https://github.com/sharkdp/fd) instead of the default find command
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}
# }}}

