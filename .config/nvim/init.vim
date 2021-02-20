set number
set ignorecase

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set shiftround

" Enable mouse (use shift to disable)
set mouse=a

" Spell checking
set spelllang=en_au
set spell

set pastetoggle=<F2>

" Clear highlights with "\"
nnoremap <silent> <leader><cr> :noh<cr>

" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'

call plug#end()

" Check for Tango light colour scheme
if $COLORFGBG == '0;default;15'
    set background=light
endif

" Remove spelling highlight
hi SpellBad ctermfg=None ctermbg=None cterm=underline
hi SpellCap ctermfg=None ctermbg=None cterm=underline
hi SpellLocal ctermFg=None ctermbg=None cterm=underline
hi SpellRare ctermfg=None ctermbg=None cterm=underline
 
" Git Gutter colours
hi SignColumn ctermbg=None
hi GitGutterAdd ctermfg=Green
hi GitGutterChange ctermfg=Blue
hi GitGutterDelete ctermfg=Red

