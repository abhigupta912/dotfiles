" vim:syntax=vim
" vim:filetype=vim
" vim:foldlevel=0
" vim:foldmethod=marker
" vim:formatoptions=crqn1j

" FZF {{{
" Reference: https://github.com/junegunn/fzf.vim
if exists('g:vim_loaded_fzf')
    " Use the correct file source, based on context
    function! ContextualFZF() abort
        " Determine if inside a git repo
        silent exec "!git rev-parse --show-toplevel"
        redraw!

        if v:shell_error
            " Search in current directory
            call fzf#run({'sink': 'tabedit'})
        else
            " Search in entire git repo
            call fzf#run({'sink': 'tabedit','source': 'git ls-tree --full-tree --name-only -r HEAD'})
        endif
    endfunction

    nnoremap <C-p> :call ContextualFZF()<cr>
    imap <C-x><C-l> <Plug>(fzf-complete-line)

    let g:fzf_action = {
                \ 'ctrl-t': 'tab split',
                \ 'ctrl-i': 'split',
                \ 'ctrl-s': 'vsplit' }

    let g:fzf_colors = {
                \ 'fg'      : ['fg', 'Normal'],
                \ 'bg'      : ['bg', 'Normal'],
                \ 'hl'      : ['fg', 'Comment'],
                \ 'fg+'     : ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                \ 'bg+'     : ['bg', 'CursorLine', 'CursorColumn'],
                \ 'hl+'     : ['fg', 'Statement'],
                \ 'info'    : ['fg', 'PreProc'],
                \ 'border'  : ['fg', 'Ignore'],
                \ 'prompt'  : ['fg', 'Conditional'],
                \ 'pointer' : ['fg', 'Exception'],
                \ 'marker'  : ['fg', 'Keyword'],
                \ 'spinner' : ['fg', 'Label'],
                \ 'header'  : ['fg', 'Comment'] }

    let g:fzf_layout = { 'down': '~40%' }
    let g:rg_command = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" -g "!{.git,}/*" '

    command! -bang -nargs=* Find call fzf#vim#grep(g:rg_command.shellescape(<q-args>), 1, <bang>0)
    command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
endif
" }}}

