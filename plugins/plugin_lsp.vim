""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lsp pls
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plug 'autozimu/LanguageClient-neovim', {
"             \ 'branch': 'next',
"             \ 'do': 'bash install.sh',
"             \ }
" " (Optional) Multi-entry selection UI.
" Plug 'junegunn/fzf'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Plug 'davidhalter/jedi-vim'
" Plug 'Valloric/YouCompleteMe', { 'do': 'git submodule update --init --recursive && python install.py' }

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'lighttiger2505/deoplete-vim-lsp'

" " Required for operations modifying multiple buffers like rename.
" set hidden
"
" let g:LanguageClient_serverCommands = {
"             \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"             \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"             \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"             \ 'python': ['~/.pyenv/py3/bin/pyls'],
"             \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"             \ 'go': {
"             \   'name': 'gopls',
"             \   'command': ['gopls'],
"             \   'initializationOptions': {
"             \     'usePlaceholders': v:true,
"             \     'codelens': {
"             \       'generate': v:true,
"             \       'test': v:true,
"             \     },
"             \   },
"             \ },
"             \ }
"
"
" function LC_maps()
"     if has_key(g:LanguageClient_serverCommands, &filetype)
"         nmap <buffer> <silent> K <Plug>(lcn-hover)
"         nmap <buffer> <silent> gd <Plug>(lcn-definition)
"         nmap <space>f call LanguageClient_textDocument_formatting()
"         " nmap <buffer> <silent> <F2> <Plug>(lcn-rename)
"         " nmap <F5> <Plug>(lcn-menu)
"     endif
" endfunction
" autocmd FileType * call LC_maps()
"
" set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
"
" " 补全结束或离开插入模式时，关闭预览窗口
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif



Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)
    nmap <Space>f <plug>(lsp-document-format)

    let g:lsp_document_highlight_enabled = 1
    let g:lsp_diagnostics_enabled = 1
    let g:lsp_format_sync_timeout = 1000
    let g:asyncomplete_auto_popup = 1
    autocmd! BufWritePre *.go,*.py call execute('LspDocumentFormatSync')
    " autocmd BufWritePre <buffer> LspDocumentFormatSync

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
