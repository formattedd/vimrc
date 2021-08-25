
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=25
let g:NERDTreeDirArrows = 1
"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
"" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <Space>n :NERDTreeToggle<CR>
nmap <Space>n <ESC> :NERDTreeToggle<CR>
