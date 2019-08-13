" vim:syntax=vim
" vim:filetype=vim
" vim:foldlevel=0
" vim:foldmethod=marker
" vim:formatoptions=crqn1j

" Easy Align {{{
" Reference: https://github.com/junegunn/vim-easy-align
if exists("g:loaded_easy_align_plugin")
    xmap <Enter> <Plug>(EasyAlign)
    nmap ga      <Plug>(EasyAlign)
endif
" }}}

" Better Whitespace {{{
" Reference: https://github.com/ntpeters/vim-better-whitespace
if exists('g:loaded_better_whitespace_plugin')
    let g:strip_whitespace_on_save              = 1
    let g:show_spaces_that_precede_tabs         = 1
    let g:strip_whitelines_at_eof               = 1
    let g:better_whitespace_filetypes_blacklist = ['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']

    " Mappings
    nnoremap <leader>ws :StripWhitespace<cr>
endif
" }}}

" Auto Pairs {{{
" Reference: https://github.com/jiangmiao/auto-pairs
if exists('g:AutoPairsLoaded')
    " let g:AutoPairsMapCR              = 0
    let g:AutoPairsFlyMode            = 1
    let g:AutoPairsShortcutBackInsert = '<C-b>'
endif
" }}}

" Vim Surround {{{
" Reference: https://github.com/tpope/vim-surround
if exists("g:loaded_surround")
    " Add a custom 'S' mapping to surround with square brackets.
    let g:surround_{char2nr("S")} = "[\r]"
endif
" }}}

" Vim Exchange {{{
" Reference: https://github.com/tommcdo/vim-exchange
let g:exchange_indent = '=='
" }}}

" Vim Mark {{{
" Reference: https://github.com/inkarkat/vim-mark
if exists('g:loaded_mark')
    let g:mwAutoLoadMarks = 1
    let g:mwDefaultHighlightingPalette = 'maximum'

    nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext
    nmap <Plug>IgnoreMarkSearchPrev <Plug>MarkSearchPrev

    nmap <leader>ma <Plug>MarkSet
    vmap <leader>ma <Plug>MarkSet

    nmap <leader>mt <Plug>MarkToggle
    nmap <leader>mc <Plug>MarkAllClear

    nmap <leader>mn <Plug>MarkSearchOrCurNext
    nmap <leader>mp <Plug>MarkSearchOrCurPrev
endif
" }}}

