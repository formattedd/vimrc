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
