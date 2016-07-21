syntax enable
set number
set nobackup
set sw=2
set ts=2
set expandtab
set ai
set hls
set ic
set cursorline
set cursorcolumn
set nowrap
set vb t_vb=
set mouse=a

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

execute pathogen#infect()
filetype plugin indent on

let g:rehash256=1
let g:molokai_original=1
colorscheme molokai

noremap <silent> <Left> :bp<CR>
noremap <silent> <Right> :bn<CR>
noremap <silent> <F5> :NERDTreeTabsToggle<CR>
noremap <silent> <F6> :NERDTreeFocusToggle<CR>
map <C-l> :bn<CR>
map <C-h> :bp<CR>

" add file extension
au BufNewFile,BufRead *.ypp set filetype=yacc

" emmet
let g:user_emmet_mode='a'
let g:user_emmet_install_global=0
let g:user_emmet_leader_key='<C-M>'
autocmd FileType html,css,vue,php EmmetInstall

" nerdtree
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_autoclose=1
let g:nerdtree_tabs_smart_startup_focus=2
let g:nerdtree_tabs_startup_cd=1

" airline
let g:airline_section_b = '%{fugitive#statusline()}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1

" ctrlp
set wildignore+=*.so,*.swp,*.zip,*.class
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" gitgutter
let g:gitgutter_override_sign_column_highlight = 1

" Easy motion
map <Leader> <Plug>(easymotion-prefix)
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

