#!/bin/sh
# vim:filetype=sh
# vim:syntax=sh
# vim:foldlevel=0
# vim:foldmethod=marker
# vim:formatoptions=crqn1j

# Initialization {{{
TempFontsDir=/tmp/fonts
if [ -d ${TempFontsDir} ]; then
    rm -rf ${TempFontsDir}
fi
mkdir -pv ${TempFontsDir}
# }}}

# Powerline {{{
# Reference: https://github.com/powerline/fonts
git clone --depth 1 https://github.com/powerline/fonts.git ${TempFontsDir}/powerline
${TempFontsDir}/powerline/install.sh
rm -rf ${TempFontsDir}/powerline
# }}}

# NerdFonts {{{
# Reference: https://github.com/ryanoasis/nerd-fonts
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git ${TempFontsDir}/nerdfonts
${TempFontsDir}/nerdfonts/install.sh -C -c -U -A
rm -rf ${TempFontsDir}/nerdfonts
# }}}

# Cleanup {{{
rm -rf ${TempFontsDir}
# }}}

