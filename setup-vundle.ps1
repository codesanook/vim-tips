#choco install curl --confirm
#New-Item -Type Directory -Path (Join-Path $env:USERPROFILE "vimfiles") -ErrorAction Ignore | Out-Null
#
#$vundlePath = Join-Path $env:USERPROFILE "vimfiles/bundle/Vundle.vim"
#Remove-Item -Path $vundlePath -Recurse -Force -ErrorAction Ignore
#git clone https://github.com/VundleVim/Vundle.vim.git $vundlePath

$vundleConfig =
@"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin('$HOME/vimfiles/bundle/')

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
" *********************************************************** 

Plugin 'tpope/vim-surround'
Plugin 'matchit.zip'
Plugin 'mattn/emmet-vim'
Plugin 'pprovost/vim-ps1'
Plugin 'scrooloose/nerdtree'
Plugin 'leafgarland/typescript-vim'

" ***********************************************************
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"@

$vimrcPath = Join-Path $env:USERPROFILE "_vimrc"
$vimConfig = Get-Content -Path $vimrcPath -Raw # Get content as full string not an array of string

# concat vundle config and existing vim config and then change to `n new line
$newContent = ($vundleConfig + $vimConfig) -replace "\r\n", "`n"  #replace \r\n to \n only

# write to existing vimrc
Set-Content -Path $vimrcPath -Value $newContent -NoNewline
"Done setup Vundle"
