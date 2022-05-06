for f in split(glob('~/.dotfiles/nvim/vimrcs/*.vim'), '\n')
    exe 'source' f
endfor

for f in split(glob('~/.dotfiles/nvim/vimrcs/config/*.vim'), '\n')
    exe 'source' f
endfor
