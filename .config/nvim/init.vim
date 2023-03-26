" plugin manager (dein) ---------------------------------------------------------
" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set Dein base path (required)
let s:dein_base = expand('~/.config/nvim/dein')

" Set Dein source path (required)
let s:dein_src = s:dein_base . '/repos/github.com/Shougo/dein.vim'

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

" tomlセット
let s:toml_dir=expand('~/.dein/')
let s:toml=s:toml_dir . 'dein.toml'
let s:toml_lazy=s:toml_dir . 'dein-lazy.toml'

" Call Dein initialization (required)
" プラグインのロード
if dein#load_state(s:dein_base)
  call dein#begin(s:dein_base)

  call dein#load_toml(s:toml)
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Uncomment if you want to install not-installed plugins on startup.
if dein#check_install()
 call dein#install()
endif
"-----------------------------------------------------------------------

""" キーマップ
inoremap <silent> jj <ESC>

""" その他の設定
syntax on

" line numbers
set number
set nowrap

" tabs & indent
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
filetype plugin indent on

" search
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
set iskeyword+=-

set noswapfile
set belloff=all

""" vim スクリプト
" TODO: 外部ファイル化
command! OpenVimrc vs ~/.config/nvim/init.vim
command! ReadVimrc source ~/.config/nvim/init.vim

