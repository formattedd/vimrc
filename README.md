### 配合 https://github.com/formattedd/dotfiles 食用

### example
![alt ](./img/tty.gif width=100)


### 不能连接GitHub时
```sh
vi vimrcs/plugins.vim
vi plugins/plugin_lsp.vim
%s/Plug\ \'/Plug \ \'https\:\/\/hub\.fastgit\.org\//g
```

<!-- #### my vim/macvim/neovim config -->
<!--  -->
<!-- > install vim/macvim/neovim, git, pip -->
<!--  -->
<!-- > run it -->
<!-- ```sh -->
<!-- sh  <(wget -qO- https://raw.githubusercontent.com/formateddd/vimrc/master/install.sh) nvim # or vim -->
<!--  -->
<!-- or -->
<!--  -->
<!-- bash  <(wget -qO- https://gitee.com/formateddd/vimrc/raw/master/gitee_installer.sh) nvim # or vim -->
<!-- ``` -->
<!--  -->
<!-- > in arch/manjaro use cliopboard -->
<!-- ``` -->
<!-- [> sudo pacman -Sy xclip xorg-xclipboard <] -->
<!-- sudo pacman -Sy xsel -->
<!-- ``` -->
<!--  -->
<!-- > reference from [ma6174](https://github.com/ma6174/vim-deprecated) and [Coc-extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions) -->
