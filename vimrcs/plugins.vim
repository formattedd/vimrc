let plug_dir='~/.config/nvim/plugged/'

call plug#begin(plug_dir)

Plug 'mhinz/vim-startify'

Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" nnoremap <S-f> <cmd>Telescope find_files<cr>

Plug 'Chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'voldikss/vim-floaterm'
nmap <Space>t :FloatermNew<CR>
Plug 'voldikss/vim-translator'

Plug 'airblade/vim-gitgutter'
Plug 'stevearc/aerial.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdcommenter' " 注释
Plug 'pechorin/any-jump.vim'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'github/copilot.vim'
" :Copilot setup

" for f in glob('~/.config/nvim/plugins/plugin_*.vim', 0, 1)
"     execute 'source' f
" endfor

" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'

call plug#end()


if !empty(glob(plug_dir . "vim-airline/"))
    " :bnext
    " :bprevious
    " :bfirst
    " :blast
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'jsformatter'
    " let g:airline#extensions#tabline#left_sep = ' '
    " let g:airline#extensions#tabline#left_alt_sep = '|'
    " let g:airline#extensions#tabline#enabled = 1
    " let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
    " let g:airline#extensions#tabline#show_tab_nr = 1
    " let g:airline#extensions#tabline#formatter = 'default'
    " let g:airline#extensions#tabline#buffer_nr_show = 0
    " let g:airline#extensions#tabline#fnametruncate = 16
    " let g:airline#extensions#tabline#fnamecollapse = 2
    " let g:airline#extensions#tabline#buffer_idx_mode = 1
    " let g:airline_theme='onedark'
    let g:airline_theme='monokai'
endif


if !empty(glob(plug_dir . "./onedark.vim/"))
    colorscheme onedark
endif

if !empty(glob(plug_dir . "any-jump.vim/"))
    " Normal mode: Jump to definition under cursor
    nnoremap <leader>aj :AnyJump<CR>
    " Visual mode: jump to selected text in visual mode
    xnoremap <leader>aj :AnyJumpVisual<CR>
    " Normal mode: open previous opened file (after jump)
    nnoremap <leader>ab :AnyJumpBack<CR>
    " Normal mode: open last closed search window again
    nnoremap <leader>al :AnyJumpLastResults<CR>
endif

if !empty(glob(plug_dir . "vim-translator/"))
    let g:translator_default_engines = ['haici', 'bing']
    """ Configuration example
    " Echo translation in the cmdline
    " nmap <silent> <Leader>t <Plug>Translate
    " vmap <silent> <Leader>t <Plug>TranslateV
    " Display translation in a window
    nmap <silent> <Leader>w <Plug>TranslateW
    vmap <silent> <Leader>w <Plug>TranslateWV
    " Replace the text with translation
    " nmap <silent> <Leader>r <Plug>TranslateR
    " vmap <silent> <Leader>r <Plug>TranslateRV
    " Translate the text in clipboard
    " nmap <silent> <Leader>x <Plug>TranslateX
endif

if !empty(glob(plug_dir . "vim-autoformat/"))
    " autocmd BufWrite * :Autoformat
    let g:autoformat_autoindent = 1
    let g:autoformat_retab = 1
    let g:autoformat_remove_trailing_spaces = 1
endif


if !empty(glob(plug_dir . "nerdcommenter/"))
    nmap <Space><Space> <plug>NERDCommenterToggle
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1
    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1
    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'
    " Set a language to use its alternate delimiters by default
    let g:NERDAltDelims_java = 1
    " Add your own custom formats or override the defaults
    " let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1
    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1
    " Enable NERDCommenterToggle to check all selected lines is commented or not
    let g:NERDToggleCheckAllLines = 1
endif

if !empty(glob(plug_dir . "vim-lsp/"))
    " prabirshrestha/asyncomplete.vim
    " inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

    inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"
    imap <c-space> <Plug>(asyncomplete_force_refresh)
    " let g:asyncomplete_auto_popup = 0
    let g:asyncomplete_auto_completeopt = 1
    let g:lsp_fold_enabled = 1
    set foldmethod=expr
                \ foldexpr=lsp#ui#vim#folding#foldexpr()
                \ foldtext=lsp#ui#vim#folding#foldtext()
    let g:lsp_diagnostics_enabled = 1
    let g:lsp_document_highlight_enabled = 1
    set completeopt=menuone,noinsert,noselect,preview
    autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

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

endif

