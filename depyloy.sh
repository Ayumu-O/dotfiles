#!/bin/bash
dotfiles=(
    .zshrc 
    .tmux.conf 
    .config/nvim/init.vim
    .dein
)

for file in "${dotfiles[@]}"; do
    rm -rf ~/$file
    ln -svf ~/dotfiles/$file ~/$file
done
