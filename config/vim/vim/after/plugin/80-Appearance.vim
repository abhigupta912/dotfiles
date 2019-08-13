" vim:syntax=vim
" vim:filetype=vim
" vim:foldlevel=0
" vim:foldmethod=marker
" vim:formatoptions=crqn1j

" Light Line {{{
" Reference: https://github.com/itchyny/lightline.vim
if exists('g:loaded_lightline')
    " Global settings
    let g:lightline = {}

    " Colorscheme
    let g:lightline.colorscheme = 'neodark'

    " Active window
    let g:lightline.active = {
                \ 'left': [ [ 'mode', 'paste' ],
                \           [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
                \ 'right': [ [ 'lineinfo' ],
                \            [ 'percent' ],
                \            [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ] }

    " Inactive window
    let g:lightline.inactive = {
                \ 'left': [ [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
                \ 'right': [ [ 'lineinfo' ],
                \            [ 'percent' ],
                \            [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ] }

    " Components
    let g:lightline.component = {'charvaluehex': '0x%B'}

    " LightlineModified {{{
    function! LightlineModified()
        return &filetype =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
    endfunction
    " }}}

    " LightlineReadonly {{{
    function! LightlineReadonly()
        return &filetype !~? 'help' && &readonly ? '🔒' : ''
    endfunction
    " }}}

    " Component Functions
    let g:lightline.component_function = {
                \   'modified': 'LightlineModified',
                \   'readonly': 'LightlineReadonly',
                \ }

    if exists('g:loaded_fugitive')
        let g:lightline.component_function.gitbranch = 'fugitive#head'
    endif

endif
" }}}

" IndentLine {{{
" Reference: https://github.com/Yggdroot/indentLine
if exists('g:vim_loaded_indentline')
    let g:indentLine_enabled        = 1
    let g:indentLine_char           = '▏'
    let g:indentLine_faster         = 1
    let g:vim_json_syntax_conceal   = 0
    let g:indentLine_setColors      = 0
    let g:indentLine_color_tty_dark = 1
endif
" }}}

" Rainbow {{{
" Reference: https://github.com/luochen1990/rainbow
if exists('g:vim_loaded_rainbow')
    let g:rainbow_active = 1

    let g:rainbow_conf = {
                \    'operators': '_,\|+\|-\|*\|\/\|=\|==\|===\|!=\|!==_',
                \    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
                \    'separately': {
                \        '*': {},
                \        'vim': {
                \            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
                \        },
                \        'html': {
                \            'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
                \        },
                \    }
                \}
endif
" }}}

" Colorizer {{{
" Reference: https://github.com/chrisbra/Colorizer
if exists('g:loaded_colorizer')
    let g:colorizer_auto_color    = 0
    let g:colorizer_skip_comments = 1
    let g:colorizer_auto_filetype = 'css,html'
    let g:colorizer_syntax        = 1
endif
" }}}

