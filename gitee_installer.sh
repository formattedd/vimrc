#!/bin/sh

JudgeNvimPath(){
    if [ -f ~/.config ]; then
        mkdir ~/.config
    fi

    if [ ! -d "~/.config/nvim" ]; then
        filename=`date '+%Y%m%d'`
        echo $filename
        mv -f ~/.config/nvim ~/.config/nvim_old$filename
    fi
}

ConfigNvim(){
    ln -s ~/.dotfiles/nvim/ ~/.config/

    mkdir -p ~/.local/share/nvim/site/autoload
    cp -r ~/.config/nvim/autoload ~/.local/share/nvim/site/

    nvim +PlugInstall +qall
    # nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"
    echo "vim plugins install success"

    # default python virtualenv
    pip install neovim pynvim black jedi -i https://pypi.tuna.tsinghua.edu.cn/simple
    echo "while copy Chinese , export LC_ALL="zh_CN.UTF-8" "
    echo "Installed the Vim configuration successfully, Enjoy it ! :-)"
}


JudgeNvimPath
ConfigNvim
