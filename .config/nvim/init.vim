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

""" gitgutter 用
let g:gitgutter_highlight_lines = 1
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

""" その他の設定
syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set noswapfile

""" vim スクリプト
" TODO: 外部ファイル化
command! OpenVimrc vs ~/.config/nvim/init.vim
command! ReadVimrc source ~/.config/nvim/init.vim

