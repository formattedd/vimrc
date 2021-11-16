for f in split(glob('~/.dotfiles/nvim/vimrcs/*.vim'), '\n')
    exe 'source' f
endfor

" Key bindings can be changed, see below
" Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
call wilder#setup({'modes': [':', '/', '?']})
