" vim:syntax=vim
" vim:filetype=vim
" vim:foldlevel=0
" vim:foldmethod=marker
" vim:formatoptions=crqn1j

" Search {{{
" Reference: https://github.com/haya14busa/incsearch.vim
if exists('g:loaded_incsearch')
    let g:incsearch#auto_nohlsearch = 1
    let g:incsearch#magic = '\v'

    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)

    map n  <Plug>(incsearch-nohl-n)
    map N  <Plug>(incsearch-nohl-N)
    map *  <Plug>(incsearch-nohl-*)
    map #  <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#)
endif

" Both incsearch.vim and incsearch-fuzzy.vim
" Reference: https://github.com/haya14busa/incsearch.vim
" Reference: https://github.com/haya14busa/incsearch-fuzzy.vim
if exists('g:loaded_incsearch') && exists('g:loaded_incsearch_fuzzy')
    function! s:config_fuzzyall(...) abort
        return extend(copy({
                    \   'converters': [
                    \     incsearch#config#fuzzy#converter(),
                    \     incsearch#config#fuzzyspell#converter()
                    \   ],
                    \ }), get(a:, 1, {}))
    endfunction

    noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
    noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
    noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))
endif

" Reference: https://github.com/haya14busa/vim-asterisk
if exists('g:loaded_asterisk')
    map *   <Plug>(asterisk-*)
    map #   <Plug>(asterisk-#)
    map g*  <Plug>(asterisk-g*)
    map g#  <Plug>(asterisk-g#)

    map z*  <Plug>(asterisk-z*)
    map gz* <Plug>(asterisk-gz*)
    map z#  <Plug>(asterisk-z#)
    map gz# <Plug>(asterisk-gz#)
endif

" Both incsearch.vim and vim-asterisk
" Reference: https://github.com/haya14busa/incsearch.vim
" Reference: https://github.com/haya14busa/vim-asterisk
if exists('g:loaded_incsearch') && exists('g:loaded_asterisk')
    map *   <Plug>(incsearch-nohl)<Plug>(asterisk-*)
    map g*  <Plug>(incsearch-nohl)<Plug>(asterisk-g*)
    map #   <Plug>(incsearch-nohl)<Plug>(asterisk-#)
    map g#  <Plug>(incsearch-nohl)<Plug>(asterisk-g#)

    map z*  <Plug>(incsearch-nohl0)<Plug>(asterisk-z*)
    map gz* <Plug>(incsearch-nohl0)<Plug>(asterisk-gz*)
    map z#  <Plug>(incsearch-nohl0)<Plug>(asterisk-z#)
    map gz# <Plug>(incsearch-nohl0)<Plug>(asterisk-gz#)
endif
" }}}

" Highlight {{{
" Reference: https://github.com/unblevable/quick-scope
if exists('g:loaded_quick_scope')
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
endif
" }}}

" Motion {{{
" Easymotion {{{
" Reference: https://github.com/easymotion/vim-easymotion
if exists('g:EasyMotion_loaded')
    let g:EasyMotion_smartcase = 1

    map  / <Plug>(easymotion-sn)
    omap / <Plug>(easymotion-tn)

    map  n <Plug>(easymotion-next)
    map  N <Plug>(easymotion-prev)

    map  <leader>f <Plug>(easymotion-bd-f)
    nmap <leader>f <Plug>(easymotion-overwin-f)

    nmap s <Plug>(easymotion-s2)
    nmap t <Plug>(easymotion-t2)

    nmap s <Plug>(easymotion-overwin-f2)

    nmap s <Plug>(easymotion-s)
    omap t <Plug>(easymotion-bd-tl)

    map <leader>L <Plug>(easymotion-bd-jk)
    nmap <leader>L <Plug>(easymotion-overwin-line)

    map  <leader>w <Plug>(easymotion-bd-w)
    nmap <leader>w <Plug>(easymotion-overwin-w)

    map <Leader>l <Plug>(easymotion-lineforward)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>h <Plug>(easymotion-linebackward)
endif

" Easymotion with incsearch
" Reference: https://github.com/easymotion/vim-easymotion
" Reference: https://github.com/haya14busa/incsearch.vim
" Reference: https://github.com/haya14busa/incsearch-easymotion.vim
if exists('g:EasyMotion_loaded') && exists('g:loaded_incsearch') && exists('g:loaded_incsearch_easymotion')
    function! s:incsearch_config(...) abort
        return incsearch#util#deepextend(deepcopy({
                    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                    \   'keymap': {
                    \     "\<CR>": '<Over>(easymotion)'
                    \   },
                    \   'is_expr': 0
                    \ }), get(a:, 1, {}))
    endfunction

    noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
    noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
    noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
endif

" Easymotion with incsearch.vim and incsearch-fuzzy.vim
" Reference: https://github.com/easymotion/vim-easymotion
" Reference: https://github.com/haya14busa/incsearch.vim
" Reference: https://github.com/haya14busa/incsearch-easymotion.vim
if exists('g:EasyMotion_loaded') && exists('g:loaded_incsearch') && exists('g:loaded_incsearch_easymotion') && exists('g:loaded_incsearch_fuzzy')
    function! s:config_easyfuzzymotion(...) abort
        return extend(copy({
                    \   'converters': [incsearch#config#fuzzyword#converter()],
                    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                    \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                    \   'is_expr': 0,
                    \   'is_stay': 1
                    \ }), get(a:, 1, {}))
    endfunction

    noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
endif
" }}}

" Reference: https://github.com/justinmk/vim-sneak
if exists('g:loaded_sneak_plugin')
    let g:sneak#label = 1
    let g:sneak#use_ic_scs = 1

    map f <Plug>Sneak_f
    map F <Plug>Sneak_F
    map t <Plug>Sneak_t
    map T <Plug>Sneak_T

    map <leader>s <Plug>Sneak_s
    map <leader>S <Plug>Sneak_S
endif
" }}}

