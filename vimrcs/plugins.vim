let plug_dir='~/.config/nvim/plugged/'

call plug#begin(plug_dir)

Plug 'mhinz/vim-startify'
" Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'joshdick/onedark.vim'
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

Plug 'stevearc/aerial.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdcommenter' " 注释
Plug 'pechorin/any-jump.vim'

" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'github/copilot.vim'
" :Copilot setup

" for f in glob('~/.config/nvim/plugins/plugin_*.vim', 0, 1)
"     execute 'source' f
" endfor

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

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
    let g:airline_theme='onedark'
endif


if !empty(glob(plug_dir . "./onedark.vim/"))
    colorscheme onedark
endif


if !empty(glob(plug_dir . "./nvim-tree.lua/"))
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
    nnoremap <Space>n :NvimTreeToggle<CR>

lua << EOF
-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
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
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
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
    cmd = "",
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
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
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
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
} -- END_DEFAULT_OPTS
EOF
endif


if !empty(glob(plug_dir . "aerial.nvim/"))
lua << EOF
require("aerial").setup(
    {
        min_width = 30,
        -- backends = {"lsp", "treesitter", "markdown"}
        backends = {"lsp", "treesitter"},
        -- false 是显示所有的图标
        filter_kind = false,
        -- 将从 lspkind 和 nvim-web-devicons 中获得图标
        nerd_font = "auto",
        -- 何时更新
        update_events = "TextChanged,InsertLeave",
        -- 按键映射
        on_attach = function(bufnr)
            -- 打开、关闭大纲预览
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialToggle!<CR>', {})
            -- 移动到上一个/下一个子项目，同 <C-k> 和 <C-j>
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
            -- 移动到上一个/下一个大项目
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
            vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
        end
    }
)
EOF
endif


if !empty(glob(plug_dir . "nvim-treesitter/"))
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

if !empty(glob(plug_dir . "telescope.nvim/"))
    nnoremap <S-f> <cmd>Telescope find_files<cr>
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


" Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
" if filereadable(expand("$HOME/.config/nvim/plugged/wilder.nvim/autoload/wilder.vim"))
" if !empty(glob(plug_dir . "wilder.nvim/"))
"     call wilder#setup({'modes': [':', '/', '?']})
"
"     call wilder#set_option('pipeline', [
"                 \   wilder#branch(
"                 \     wilder#cmdline_pipeline(),
"                 \     wilder#search_pipeline(),
"                 \   ),
"                 \ ])
"
"     call wilder#set_option('renderer', wilder#wildmenu_renderer({
"                 \ 'highlighter': wilder#basic_highlighter(),
"                 \ }))
" endif


" if !empty(glob(plug_dir . "vim-lsp/"))
"     " prabirshrestha/asyncomplete.vim
"     " inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"     " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"     " inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
"
"     inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"
"     imap <c-space> <Plug>(asyncomplete_force_refresh)
"     " let g:asyncomplete_auto_popup = 0
"     let g:asyncomplete_auto_completeopt = 1
"     let g:lsp_fold_enabled = 1
"     set foldmethod=expr
"                 \ foldexpr=lsp#ui#vim#folding#foldexpr()
"                 \ foldtext=lsp#ui#vim#folding#foldtext()
"     let g:lsp_diagnostics_enabled = 1
"     let g:lsp_document_highlight_enabled = 1
"     set completeopt=menuone,noinsert,noselect,preview
"     autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
"
"     function! s:on_lsp_buffer_enabled() abort
"         setlocal omnifunc=lsp#complete
"         setlocal signcolumn=yes
"         if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"         nmap <buffer> gd <plug>(lsp-definition)
"         nmap <buffer> gs <plug>(lsp-document-symbol-search)
"         nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
"         nmap <buffer> gr <plug>(lsp-references)
"         nmap <buffer> gi <plug>(lsp-implementation)
"         nmap <buffer> gt <plug>(lsp-type-definition)
"         nmap <buffer> <leader>rn <plug>(lsp-rename)
"         nmap <buffer> [g <plug>(lsp-previous-diagnostic)
"         nmap <buffer> ]g <plug>(lsp-next-diagnostic)
"         nmap <buffer> K <plug>(lsp-hover)
"         inoremap <buffer> <expr><c-f> lsp#scroll(+4)
"         inoremap <buffer> <expr><c-d> lsp#scroll(-4)
"         nmap <Space>f <plug>(lsp-document-format)
"
"         let g:lsp_document_highlight_enabled = 1
"         let g:lsp_diagnostics_enabled = 1
"         let g:lsp_format_sync_timeout = 1000
"         let g:asyncomplete_auto_popup = 1
"         " autocmd! BufWritePre *.go,*.py call execute('LspDocumentFormatSync')
"         " autocmd BufWritePre <buffer> LspDocumentFormatSync
"
"         " refer to doc to add more commands
"     endfunction
"
"     augroup lsp_install
"         au!
"         " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"         autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"     augroup END
"
" endif


if !empty(glob(plug_dir . "cmp-nvim-lsp/"))
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --   capabilities = capabilities
  -- }
EOF
endif
