# コンテナ環境での最低限の Linux 設定

Tags: Linux, Vim

1. 自ユーザーの .vimrc を編集する
    
    ```bash
    sudo chown username:username ~/.vimrc
    chmod u+w ~/.vimrc
    vim ~/.vimrc
    ```
    
    - .vimrc の中身
        
        ```bash
        set number
        set cursorline
        set title
        
        " 全角スペースを赤で表示する
        autocmd Colorscheme * highlight FullWidthSpace ctermbg=red
        autocmd VimEnter * match FullWidthSpace /　/
        colorscheme desert
        
        "タブを半角スペースと認識する
        set expandtab
        "タブを２つの半角スペースとみなす
        set tabstop=2
        
        " シンタックス
        syntax enable
        filetype plugin indent on
        
        "ファイル検索時の諸々設定
        "大文字小文字を区別しないで検索
        set ignorecase
        "大文字入力時は区別する
        set smartcase
        "インクリメンタルサーチを有効にする
        "参考:https://kaworu.jpn.org/kaworu/2010-11-21-1.php
        set incsearch
        "一番下まで検索したら一番上に戻る
        set wrapscan
        "ヒットした語句を強調表示する
        set hlsearch
        
        "Plugin Managerの有効化
        call plug#begin('~/.vim/plugged')
        
        Plug 'alvan/vim-closetag'
        
        call plug#end()
        ```
        
2. plugin 用に vim-plug をインストール
    
    [https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug)
    
    ```bash
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
    
3. vim でプラグインをインストール
    
    `:PlugInstall`
    
4. root user へ設定を反映させる
    
    [https://qiita.com/Catalyst3104/items/bf750cce9d3970c9058f](https://qiita.com/Catalyst3104/items/bf750cce9d3970c9058f)
    
    ```bash
    sudo rm ~/.vimrc
    sudo rm -r ~/.vim
    sudo ln -s ~/.vimrc /root/.vimrc
    sudo ln -s ~/.vim /root/.vim
    ```
    
5. これで `sudo vim` でも `~/.vimrc` が効く