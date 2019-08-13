# vim:syntax=zsh
# vim:filetype=zsh
# vim:foldlevel=0
# vim:foldmethod=marker
# vim:formatoptions=crqn1j

# Completions {{{
# completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on

# Ignore case
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Show menu if number of items > 2
zstyle ':completion:*' menu select=2

# List of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

zstyle ':completion:*' verbose yes

zstyle ':completion:*:descriptions' format '%d'
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:descriptions' format $'\e[00;34m%d'

zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:messages' format $'\e[00;31m%d'

zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"

zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'

# Don't group completions
zstyle ':completion:*' group-name ''

zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*:processes' command 'ps -au$USER'

# Show PIDs as menu selection with kill command
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"

# Show PIDs as menu selection with killall command
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always

zstyle ':completion:*:values' verbose yes

zstyle ':completion:*:options' verbose yes
zstyle ':completion:*:options' prefix-needed yes
# }}}

