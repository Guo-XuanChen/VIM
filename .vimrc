" general configuration 
syntax on
set nocompatible
set background=dark
set cursorline
set laststatus=2
set paste
set nocf
"set autowrite

" codinfstyle configuration
filetype indent on
set number
set autoindent
set smartindent 
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

" autocommnd configuration
autocmd bufread,bufnewfile *.php 
    \ set autoindent |
    \ set smartindent

" header template
autocmd bufnewfile *.php 0r /root/.vim/header/.php_temp.temp
autocmd bufnewfile *.pl 0r /root/.vim/header/.perl_temp.temp
autocmd bufnewfile *.sh 0r /root/.vim/header/.shell_temp.temp

" map configuration
map <F4> : set nu!<BAR>set nonu?<CR> 

" color configuration
set t_Co=256
hi Comment ctermfg=lightcyan
hi LineNr cterm=bold ctermfg=darkgray
hi CursorLineNr cterm=bold ctermfg=white
hi Error cterm=bold ctermfg=magenta ctermbg=black

" statusline
function IsBinary()
    if (&binary == 0)
        return ""
    else
        return "[Binary]"
    endif
endfunction

function FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return "[Empty]"
    endif
    if bytes < 1024
        return "[" . bytes . "B]"
    elseif bytes < 1048576
        return "[" . (bytes / 1024) . "KB]"
    else
        return "[" . (bytes / 1048576) . "MB]"
    endif
endfunction

set statusline=%#filepath#[%{expand('%:p')}]%#filetype#[%{strlen(&fenc)?&fenc:&enc},\ %{&ff},\ %{strlen(&filetype)?&filetype:'plain'}]%#filesize#%{FileSize()}%{IsBinary()}%=%#position#%c,%l/%L\ [%3p%%]

hi filepath cterm=none ctermbg=238 ctermfg=40
hi filetype cterm=none ctermbg=238 ctermfg=45
hi filesize cterm=none ctermbg=238 ctermfg=225
hi position cterm=none ctermbg=238 ctermfg=228
