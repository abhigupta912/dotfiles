# vim:syntax=zsh
# vim:filetype=zsh
# vim:foldlevel=0
# vim:foldmethod=marker
# vim:formatoptions=crqn1j

# Load configs before compinit
for file in $(find ${ZDOTDIR}/rc.d -maxdepth 1 -type f | sort)
do
    source ${file}
done

