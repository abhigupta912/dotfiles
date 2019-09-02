" vim:syntax=vim
" vim:filetype=vim
" vim:foldlevel=0
" vim:foldmethod=marker
" vim:formatoptions=crqn1j

" Deoplete {{{
" Reference: https://github.com/Shougo/deoplete.nvim
if exists('g:loaded_deoplete')
    let g:deoplete#enable_at_startup = 1

    " Use smartcase.
    call deoplete#custom#option('smart_case', v:true)

    " <BS>: close popup and delete backword char.
    inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

    "call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])
    call deoplete#custom#source('_', 'min_pattern_length', 2)

    " Disable 'omni' because it's not async
    call deoplete#custom#option('ignore_sources', {'_': ['omni']})

    " Neosnippet {{{
    " Reference: https://github.com/Shougo/neosnippet.vim
    if exists('g:loaded_neosnippet')
        call deoplete#custom#source('neosnippet', 'filetypes', []) " Use Neosnippet for all filetypes
        call deoplete#custom#source('neosnippet', 'rank', 1000)    " Keep snippets on top
    endif
    " }}}

    " LanguageClient-Noevim {{{
    " Reference: https://github.com/autozimu/LanguageClient-neovim
    if exists('g:LanguageClient_loaded')
        call deoplete#custom#source('LanguageClient', 'min_pattern_length', 2)
        call deoplete#custom#source('LanguageClient', 'filetypes', ['rust'])
    endif
    " }}}

    call deoplete#custom#source('go', 'filetypes', ['go'])

    " Go settings
    let g:deoplete#sources                  = {}
    let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
    let g:deoplete#sources#go#sort_class    = ['package', 'func', 'type', 'var', 'const']
    let g:deoplete#sources#go#use_cache     = 0

    " Key bindings
    if exists('g:loaded_neosnippet')
        " Neosnippet {{{
        " Reference: https://github.com/Shougo/neosnippet.vim
        imap <silent> <expr> <cr> pumvisible() ?
                    \ (neosnippet#expandable() ? neosnippet#mappings#expand_impl() : deoplete#close_popup())
                    \ : "\<cr>"

        imap <silent> <expr> <tab> pumvisible() ? "\<Down>"
                    \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
                    \ : (<SID>IsWhitespace() ? "\<Tab>"
                    \ : deoplete#manual_complete()))

        smap <silent> <expr> <tab> pumvisible() ? "\<Down>"
                    \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
                    \ : (<SID>IsWhitespace() ? "\<Tab>"
                    \ : deoplete#manual_complete()))
        " }}}
    else
        inoremap <expr> <cr>  pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
    endif
endif
" }}}

" LanguageClient-Noevim {{{
" Reference: https://github.com/autozimu/LanguageClient-neovim
if exists('g:LanguageClient_loaded')
    let g:LanguageClient_autoStart = 1
    let g:LanguageClient_serverCommands = {
                \ 'rust': ['rustup', 'run', 'stable', 'rls'],
                \ }

    " Mappings
    nnoremap <leader>lm :call LanguageClient_contextMenu()<cr>
    nnoremap <leader>lh :call LanguageClient#textDocument_hover()<cr>
    nnoremap <leader>ld :call LanguageClient#textDocument_definition()<cr>
    nnoremap <leader>lc :call LanguageClient#textDocument_rename()<cr>
    nnoremap <leader>lr :call LanguageClient_textDocument_references()<cr>
    nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<cr>
endif
" }}}

" Ale {{{
" Reference: https://github.com/dense-analysis/ale
if exists('g:loaded_ale_dont_use_this_in_other_plugins_please')
    let g:ale_fixers = {
                \   'javascript': ['prettier', 'eslint'],
                \}

    let g:ale_linters = {
                \   'javascript': ['eslint'],
                \   'go': ['gometalinter', 'goimports'],
                \}

    let g:ale_fix_on_save              = 1
    let g:ale_lint_on_enter            = 0
    let g:ale_lint_on_filetype_changed = 1
    let g:ale_lint_on_save             = 1
    let g:ale_lint_on_text_changed     = 'never'
    let g:ale_set_loclist              = 0
    let g:ale_set_quickfix             = 1
    let g:ale_sign_column_always       = 1
    let g:ale_sign_error               = '✗'
    let g:ale_sign_warning             = '⚠'

    " Autocmds
    autocmd vimrc bufwritepost *.js silent !standard --fix %
endif
" }}}

" Go {{{
" Reference: https://github.com/fatih/vim-go
if exists("g:go_loaded_install")
    " Use :GoAddTags to autogenerate JSON tags for structs
    " Value one of camelcase or snakecase
    let g:go_addtags_transform           = "camelcase"

    let g:go_auto_sameids                = 1
    let g:go_auto_type_info              = 1
    let g:go_fmt_experimental            = 1

    let g:go_fmt_command                 = "goimports"

    let g:go_highlight_build_constraints = 1
    let g:go_highlight_extra_types       = 1
    let g:go_highlight_fields            = 1
    let g:go_highlight_functions         = 1
    let g:go_highlight_interfaces        = 1
    let g:go_highlight_methods           = 1
    let g:go_highlight_operators         = 1
    let g:go_highlight_structs           = 1
    let g:go_highlight_types             = 1

    let g:go_list_type                   = "quickfix"
endif
" }}}

" Rust {{{
" Reference: https://github.com/rust-lang/rust.vim
if exists('g:loaded_rust_vim')
    let g:autofmt_autosave = 1
endif
" }}}

