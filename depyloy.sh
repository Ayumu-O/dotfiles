#!/bin/bash
dotfiles=(.zshrc .tmux.conf .config/nvim/init.vim)

for file in "${dotfiles[@]}"; do
    ln -svf ~/dotfiles/$file ~/$file
done
