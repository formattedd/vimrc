
call plug#begin('~/.config/nvim/plugged')

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate' }
    " Plug 'tanvirtin/monokai.nvim'
    Plug 'navarasu/onedark.nvim'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    let g:airline#extensions#tabline#formatter = 'default'
    let g:airline#extensions#tabline#enabled = 1
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
    let g:airline_theme='molokai'


    " Plug 'Chiel92/vim-autoformat'
    Plug 'sbdchd/neoformat'


    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    if has("nvim")
        " Escape inside a FZF terminal window should exit the terminal window
        " rather than going into the terminal's normal mode.
        autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
    endif
    nmap <S-f> :Files<CR>


    Plug 'preservim/nerdcommenter' " 注释
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


    Plug 'preservim/nerdtree'
    let g:NERDTreeWinPos = "right"
    let NERDTreeShowHidden=1
    let NERDTreeShowLineNumbers=1
    let NERDTreeIgnore = ['\.pyc$', '__pycache__']
    let g:NERDTreeWinSize=35
    let g:NERDTreeDirArrows = 1
    "当打开vim且没有文件时自动打开NERDTree
    " autocmd vimenter * if !argc() | NERDTree | endif
    "" 只剩 NERDTree时自动关闭
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    nmap <Space>n :NERDTreeToggle<CR>
    nmap <Space>n <ESC> :NERDTreeToggle<CR>



    Plug 'ryanoasis/vim-devicons'
    Plug 'sheerun/vim-polyglot'
    Plug 'mhinz/vim-startify'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'pechorin/any-jump.vim'
    " Normal mode: Jump to definition under cursor
    nnoremap <leader>j :AnyJump<CR>
    " Visual mode: jump to selected text in visual mode
    xnoremap <leader>j :AnyJumpVisual<CR>
    " Normal mode: open previous opened file (after jump)
    nnoremap <leader>ab :AnyJumpBack<CR>
    " Normal mode: open last closed search window again
    nnoremap <leader>al :AnyJumpLastResults<CR>


    Plug 'voldikss/vim-floaterm'
    nmap <Space>t :FloatermNew<CR>

    Plug 'dense-analysis/ale'
    let b:ale_linters = ['mypy']
    " let b:ale_linters = ['flake8', 'pylint']

    for f in glob('~/.config/nvim/plugins/plugin_*.vim', 0, 1)
        execute 'source' f
    endfor

    Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }

" Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
" Plug 'leafgarland/typescript-vim'
" Plug 'terryma/vim-multiple-cursors'
"   let g:multi_cursor_next_key="\<C-s>"
" Plug 'suan/vim-instant-markdown'
" Plug 'pangloss/vim-javascript'
" Plug 'tpope/vim-surround'
" Plug 'mattn/emmet-vim' " html
" Plug 'peitalin/vim-jsx-typescript'
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

call plug#end()



" 'navarasu/onedark.nvim'
let g:onedark_italic_comment = v:true
let g:onedark_style = 'darker'
let g:onedark_transparent_background = 'true'
let g:onedark_italic_comment = 'true'


if !empty(glob("~/.config/nvim/plugged/onedark.nvim/"))
    colorscheme onedark
endif

if !empty(glob("~/.config/nvim/plugged/neoformat/"))
    let g:neoformat_enabled_python = ['black']
    augroup fmt
      autocmd!
      autocmd BufWritePre * undojoin | Neoformat
    augroup END
    nmap fn :Neoformat <CR> :w! <CR>
endif

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
