" vim:syntax=vim
" vim:filetype=vim
" vim:foldlevel=0
" vim:foldmethod=marker
" vim:formatoptions=crqn1j

" Git Gutter {{{
" Reference: https://github.com/airblade/vim-gitgutter
if exists('g:loaded_gitgutter')
    " Use ripgrep instead of grep
    let g:gitgutter_grep = 'rg'

    " Ignore whitespace
    let g:gitgutter_diff_args = '-w'

    " Ignore default keybindings
    let g:gitgutter_map_keys = 0

    nmap <leader>hn <Plug>GitGutterNextHunk
    nmap <leader>hp <Plug>GitGutterPrevHunk
    nmap <leader>hs <Plug>GitGutterStageHunk
    nmap <leader>hu <Plug>GitGutterUndoHunk
    nmap <leader>hv <Plug>GitGutterPreviewHunk

    omap ih <Plug>GitGutterTextObjectInnerPending
    omap ah <Plug>GitGutterTextObjectOuterPending
    xmap ih <Plug>GitGutterTextObjectInnerVisual
    xmap ah <Plug>GitGutterTextObjectOuterVisual
endif
" }}}

