set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

syntax enable
set number
set nobackup
set noundofile
set sw=4
set ts=4
set expandtab
set ai
set hls
set ic
set cursorline
set cursorcolumn
set nowrap
set vb t_vb=
set mouse=a
set novb

" 全屏，去掉工具栏
set guioptions-=m
set guioptions-=T
autocmd GUIEnter * simalt ~x

" 文字乱码
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
" 菜单栏乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" Console输出乱码
language messages zh_CN.utf-8

" add file extension
au BufNewFile,BufRead *.ypp set filetype=yacc

execute pathogen#infect()
filetype plugin indent on

" Molokai
let g:rehash256=1
let g:molokai_original=1
colorscheme molokai

" NerdTree
noremap <silent> <Left> :bp<CR>
noremap <silent> <Right> :bn<CR>
noremap <silent> <F5> :NERDTreeTabsToggle<CR>
noremap <silent> <F6> :NERDTreeFocusToggle<CR>
map <C-l> :bn<CR>
map <C-h> :bp<CR>

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
let g:airline_powerline_fonts = 1
" 设置consolas字体"
set guifont=Consolas\ for\ Powerline\ FixedD:h12
" 设置状态栏符号显示，下面编码用双引号"
let g:Powerline_symbols="fancy"
let g:airline_symbols = {}
let g:airline_left_sep = "\u2b80" 
let g:airline_left_alt_sep = "\u2b81"
let g:airline_right_sep = "\u2b82"
let g:airline_right_alt_sep = "\u2b83"
let g:airline_symbols.branch = "\u2b60"
let g:airline_symbols.readonly = "\u2b64"
let g:airline_symbols.linenr = "\u2b61"
"设置顶部tabline栏符号显示"
let g:airline#extensions#tabline#left_sep = "\u2b80"
let g:airline#extensions#tabline#left_alt_sep = "\u2b81"

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*.so,*.swp,*.zip,*.class,*\\tmp\\*,*.exe
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" gitgutter
let g:gitgutter_override_sign_column_highlight = 1

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

