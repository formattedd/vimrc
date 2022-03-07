
" Plug 'sbdchd/neoformat'
" if !empty(glob("~/.config/nvim/plugged/neoformat/"))
"     let g:neoformat_enabled_python = ['black']
"     augroup fmt
"         autocmd!
"         autocmd BufWritePre * undojoin | Neoformat
"     augroup END
"     nmap fn :Neoformat <CR> :w! <CR>
" endif

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate' }
" Plug 'dense-analysis/ale'
" let b:ale_linters = ['mypy']
" let b:ale_linters = ['flake8', 'pylint']

" Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
" Plug 'terryma/vim-multiple-cursors'
"   let g:multi_cursor_next_key="\<C-s>"
" Plug 'suan/vim-instant-markdown'
" Plug 'tpope/vim-surround'
" Plug 'Yggdroot/indentLine' " displaying thin vertical lines
"   支持任意ASCII码，也可以使用特殊字符：¦, ┆, or │ ，但只在utf-8编码下有效
"   let g:indentLine_char='�'
"   let g:indentLine_char_list = ['┆']
"   使indentline生效
"   let g:indentLine_enabled = 1
"   let g:indentLine_setColors = 0
"   Vim
"   let g:indentLine_color_term = 239
"   autocmd Filetype json let g:indentLine_enabled = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neoclide/coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " Use release branch (recommend)

" let g:coc_disable_startup_warning=1
" let g:coc_global_extensions = [
"             \ 'coc-translator',
"             \ 'coc-html',
"             \ 'coc-css',
"             \ 'coc-cssmodules',
"             \ 'coc-pairs',
"             \ 'coc-git',
"             \ 'coc-gitignore',
"             \ 'coc-highlight',
"             \ 'coc-marketplace',
"             \ 'coc-explorer']
"
"             " \ 'coc-fzf-preview',
"             " \ 'coc-python',
"             " \ 'coc-go',
"             " \ 'coc-snippets',
"             " \ 'coc-vimlsp',
"             " \ 'coc-tsserver',
"             " \ 'coc-json',
"
" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " let g:coc_snippet_next = '<tab>'
" nmap <Space>t :CocCommand translator.popup <CR>
" " nmap gd <Plug>(coc-definition)
" " nmap <silent> gr <Plug>(coc-references)
" " nmap <Space>f :call CocAction('format')<CR>
"
" " Use K to show documentation in preview window.
" " nnoremap <silent> K :call <SID>show_documentation()<CR>
" " nnoremap <Space>k :call <SID>show_documentation()<CR>
"
" " function! s:show_documentation()
" "     if (index(['vim','help'], &filetype) >= 0)
" "         execute 'h '.expand('<cword>')
" "     else
" "         call CocAction('doHover')
" "     endif
" " endfunction
"
" nmap <Space>n :CocCommand explorer<CR>
" autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fatih/vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"
" let g:go_version_warning = 0


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
