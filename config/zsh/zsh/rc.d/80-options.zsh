# vim:syntax=zsh
# vim:filetype=zsh
# vim:foldlevel=0
# vim:foldmethod=marker
# vim:formatoptions=crqn1j

# History {{{
# Size on RAM
export HISTSIZE=10000
# Count in $HISTFILE
export SAVEHIST=50000

# Append history incrementally
setopt inc_append_history
# No duplications in history
setopt hist_ignore_all_dups
# Remove blanks when command-line being added to history
# Remove command-line starting from space in history
setopt hist_reduce_blanks
# Do not record `history` command
setopt hist_no_store
# Record start time and end time
setopt extended_history
# Compatible with bash
setopt hist_expand
# Share history between all windows
setopt share_history
setopt hist_verify
# }}}

# Change Directory {{{
# cd by entering it as command
setopt auto_cd
setopt cd_able_vars
# Make cd push old dir in dir stack
setopt auto_pushd
# No duplicates in dir stack
setopt pushd_ignore_dups
# No dir stack after pushd or popd
setopt pushd_silent
# `pushd` = `pushd $HOME`
setopt pushd_to_home
# }}}

# Beep {{{
setopt no_beep
setopt no_list_beep
setopt no_hist_beep
# }}}

# Others {{{
# Activate complex pattern globbing
setopt extended_glob
# Enable multi redirection
setopt multios
# Correct the spelling of commands
setopt correct
# List choices on ambiguous completion
setopt auto_list
setopt auto_param_slash
setopt auto_param_keys
setopt complete_in_word
# Move cursor to end on completion
setopt always_to_end
# Prevent redirection from truncating file if it already exists
#setopt no_clobber
# Search for commands in $PATH
setopt path_dirs
# }}}

