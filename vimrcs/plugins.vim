
call plug#begin('~/.config/nvim/plugged')

Plug 'mhinz/vim-startify'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }

" Plug 'tanvirtin/monokai.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'Chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'voldikss/vim-floaterm'
nmap <Space>t :FloatermNew<CR>

Plug 'sheerun/vim-polyglot'
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
call plug#end()


" 'navarasu/onedark.nvim'
if !empty(glob("~/.config/nvim/plugged/onedark.nvim/"))
    let g:onedark_config = {
                \ 'style': 'darker',
                \ 'toggle_style_key': '<leader>s',
                \ 'ending_tildes': v:true,
                \ 'diagnostics': {
                    \ 'darker': v:true,
                    \ 'background': v:true,
                    \ },
                    \ }
    colorscheme onedark
endif

if !empty(glob("~/.config/nvim/plugged/vim-airline/"))
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
    let g:airline_theme='onedark'
endif


if !empty(glob("~/.config/nvim/plugged/nerdtree/"))
    Plug 'preservim/nerdtree'
    let g:NERDTreeWinPos = "right"
    let NERDTreeShowHidden=1
    let NERDTreeShowLineNumbers=1
    let NERDTreeIgnore = ['\.pyc$', '__pycache__']
    let g:NERDTreeWinSize=35
    let g:NERDTreeDirArrows = 1
    "当打开vim且没有文件时自动打开NERDTree
    " autocmd vimenter * if !argc() | NERDTree | endif
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
    "" 只剩 NERDTree时自动关闭
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    autocmd VimEnter * NERDTree | wincmd p

    nmap <Space>n :NERDTreeToggle<CR>
endif

if !empty(glob("~/.config/nvim/plugged/fzf.vim/"))
    if has("nvim")
        " Escape inside a FZF terminal window should exit the terminal window
        " rather than going into the terminal's normal mode.
        autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
    endif
    nmap <S-f> :Files<CR>
endif

if !empty(glob("~/.config/nvim/plugged/any-jump.vim/"))
    " Normal mode: Jump to definition under cursor
    nnoremap <leader>j :AnyJump<CR>
    " Visual mode: jump to selected text in visual mode
    xnoremap <leader>j :AnyJumpVisual<CR>
    " Normal mode: open previous opened file (after jump)
    nnoremap <leader>ab :AnyJumpBack<CR>
    " Normal mode: open last closed search window again
    nnoremap <leader>al :AnyJumpLastResults<CR>
endif

if !empty(glob("~/.config/nvim/plugged/vim-autoformat/"))
    autocmd BufWrite * :Autoformat
    let g:autoformat_autoindent = 1
    let g:autoformat_retab = 1
    let g:autoformat_remove_trailing_spaces = 1
endif


if !empty(glob("~/.config/nvim/plugged/nerdcommenter/"))
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


" Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
" if filereadable(expand("$HOME/.config/nvim/plugged/wilder.nvim/autoload/wilder.vim"))
if !empty(glob("~/.config/nvim/plugged/wilder.nvim/"))
    call wilder#setup({'modes': [':', '/', '?']})

    call wilder#set_option('pipeline', [
                \   wilder#branch(
                \     wilder#cmdline_pipeline(),
                \     wilder#search_pipeline(),
                \   ),
                \ ])

    call wilder#set_option('renderer', wilder#wildmenu_renderer({
                \ 'highlighter': wilder#basic_highlighter(),
                \ }))
endif


if !empty(glob("~/.config/nvim/plugged/vim-lsp/"))
    " prabirshrestha/asyncomplete.vim
    " inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

    inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"
    imap <c-space> <Plug>(asyncomplete_force_refresh)
    " let g:asyncomplete_auto_popup = 0
    let g:asyncomplete_auto_completeopt = 0
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

    set foldmethod=expr
                \ foldexpr=lsp#ui#vim#folding#foldexpr()
                \ foldtext=lsp#ui#vim#folding#foldtext()
    let g:lsp_diagnostics_enabled = 1
    let g:lsp_document_highlight_enabled = 1
endif
