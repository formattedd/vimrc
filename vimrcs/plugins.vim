let plugin_path='~/.config/nvim/plugged/'

call plug#begin(plugin_path)

Plug 'mhinz/vim-startify'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'Chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'voldikss/vim-floaterm'
nmap <Space>t :FloatermNew<CR>

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
call plug#end()


if !empty(glob(plugin_path . "vim-airline/"))
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


if !empty(glob(plugin_path . "./nvim-tree.lua/"))
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
    nnoremap <Space>n :NvimTreeToggle<CR>

    lua << EOF
    require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
    auto_reload_on_write = true,
    disable_netrw = false,
    hide_root_folder = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = true,
      -- open_on_setup_file = true,
    open_on_tab = true,
    sort_by = "name",
    update_cwd = false,
    view = {
        width = 30,
        height = 30,
        side = "right",
        preserve_window_proportions = false,
        number = true,
        relativenumber = true,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {
                -- user mappings go here
                },
            },
        },
    renderer = {
        indent_markers = {
        enable = true,
        icons = {
            corner = "└ ",
            edge = "│ ",
            none = "  ",
            },
        },
    },
hijack_directories = {
enable = true,
auto_open = true,
},
      update_focused_file = {
      enable = false,
      update_cwd = false,
      ignore_list = {},
      },
  ignore_ft_on_setup = {},
  system_open = {
      cmd = nil,
      args = {},
      },
  diagnostics = {
  enable = false,
  show_on_dirs = false,
  icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
      },
  },
      filters = {
          dotfiles = false,
          custom = {},
          exclude = {},
          },
      git = {
      enable = true,
      ignore = true,
      timeout = 400,
      },
  actions = {
      use_system_clipboard = true,
      change_dir = {
      enable = true,
      global = false,
      },
  open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
      enable = true,
      chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
      exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
          },
      },
  },
      },
  trash = {
      cmd = "trash",
      require_confirm = true,
      },
  log = {
  enable = false,
  truncate = false,
  types = {
      all = false,
      config = false,
      copy_paste = false,
      git = false,
      profile = false,
      },
  },
    }
EOF
endif

if !empty(glob(plugin_path . "nvim-treesitter/"))
    lua << EOF
    require'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
    ensure_installed = { "python" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- List of parsers to ignore installing (for "all")
    -- ignore_install = { "javascript" },

    highlight = {
        -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
    },
}
EOF
endif

if !empty(glob(plugin_path . "telescope.nvim/"))
    nnoremap <S-f> <cmd>Telescope find_files<cr>
endif

if !empty(glob(plugin_path . "any-jump.vim/"))
    " Normal mode: Jump to definition under cursor
    nnoremap <leader>j :AnyJump<CR>
    " Visual mode: jump to selected text in visual mode
    xnoremap <leader>j :AnyJumpVisual<CR>
    " Normal mode: open previous opened file (after jump)
    nnoremap <leader>ab :AnyJumpBack<CR>
    " Normal mode: open last closed search window again
    nnoremap <leader>al :AnyJumpLastResults<CR>
endif

if !empty(glob(plugin_path . "vim-autoformat/"))
    " autocmd BufWrite * :Autoformat
    let g:autoformat_autoindent = 1
    let g:autoformat_retab = 1
    let g:autoformat_remove_trailing_spaces = 1
endif


if !empty(glob(plugin_path . "nerdcommenter/"))
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
if !empty(glob(plugin_path . "wilder.nvim/"))
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


if !empty(glob(plugin_path . "vim-lsp/"))
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
        " autocmd! BufWritePre *.go,*.py call execute('LspDocumentFormatSync')
        " autocmd BufWritePre <buffer> LspDocumentFormatSync

        " refer to doc to add more commands
    endfunction

    augroup lsp_install
        au!
        " call s:on_lsp_buffer_enabled only for languages that has the server registered.
        autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    augroup END

endif
