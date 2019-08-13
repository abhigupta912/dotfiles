# vim:syntax=zsh
# vim:filetype=zsh
# vim:foldlevel=0
# vim:foldmethod=marker
# vim:formatoptions=crqn1j

export SYSTEM=$(uname -s)

# Path {{{
typeset -gU cdpath fpath path

path=(
    /usr/local/{bin,sbin}
    $path
)
# }}}

# Completions {{{
fpath+=(
    $ZDOTDIR/functions
    "${fpath[@]}"
)

case "${SYSTEM}" in
    Linux*)
        ;;
    Darwin*)
        if type brew &>/dev/null; then
            FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
        fi
        ;;
esac
# }}}

