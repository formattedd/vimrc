#!/bin/sh

JudgeNvimPath(){
    if [ ! -f ~/.config ]; then
        mkdir ~/.config
    fi

    # 语法检查
    cp ./pycodestyle ~/.config/pycodestyle

    if [ ! -d "~/.config/nvim" ]; then
        filename=`date '+%Y%m%d'`
        echo $filename
        mv -f ~/.config/nvim ~/.config/nvim_old$filename
    fi
}

ConfigNvim(){
    ln -s ~/.dotfiles/nvim/ ~/.config/

    mkdir -p ~/.local/share/nvim/site/autoload
    ln -s ~/.config/nvim/autoload ~/.local/share/nvim/site/

    nvim +PlugInstall +qall
    # nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"
    echo "vim plugins install success"

    # default python virtualenv
    pip install better_exceptions neovim black -i https://pypi.tuna.tsinghua.edu.cn/simple
    echo "while copy Chinese , export LC_ALL="zh_CN.UTF-8" "
    echo "Installed the Vim configuration successfully, Enjoy it ! :-)"
}


JudgeNvimPath
ConfigNvim
