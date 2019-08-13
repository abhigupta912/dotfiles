" vim:syntax=vim
" vim:filetype=vim
" vim:foldlevel=0
" vim:foldmethod=marker
" vim:formatoptions=crqn1j

" Nerdtree {{{
" Reference: https://github.com/scrooloose/nerdtree
if exists("loaded_nerd_tree")
    let g:NERDTreeChDirMode           = 2
    let g:NERDTreeAutoCenter          = 1
    let g:NERDTreeHighlightCursorline = 1
    let g:NERDTreeRespectWildIgnore   = 1
    let g:NERDTreeShowHidden          = 1

    " Mappings
    nmap <leader>nt :NERDTreeToggle %<cr>

    " Autocmds
    "autocmd vimrc VimEnter * NERDTree
endif
" }}}

" Nerdtree Git Plugin {{{
" Reference: https://github.com/Xuyuanp/nerdtree-git-plugin
if exists("loaded_nerd_tree") && exists('g:loaded_nerdtree_git_status')
    let g:NERDTreeIndicatorMapCustom = {
                \ "Modified"  : "*",
                \ "Staged"    : "+",
                \ "Untracked" : "-",
                \ "Renamed"   : "»",
                \ "Unmerged"  : "=",
                \ "Deleted"   : "⨯",
                \ "Dirty"     : "⨯",
                \ "Clean"     : "✓",
                \ "Ignored"   : "¡",
                \ "Unknown"   : "?"
                \ }
endif
" }}}

