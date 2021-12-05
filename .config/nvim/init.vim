let mapleader =" "

set mouse=a
set tabstop=3
set shiftwidth=3
set expandtab
set nu

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

noremap y "+y
noremap yy "+yy
noremap Y "+y$
noremap x "+x
noremap dd "+dd
noremap D "+D
noremap p "+p
noremap P "+P

map <leader>s :!clear && shellcheck %<CR>
map <leader>c :w! \| !autocompiler.sh <c-r>%<CR><CR>
map <leader>m :!make && sudo make install <CR>
map <leader>v :w! \| !viewdoc.sh <c-r>%<CR><CR>
map <silent> <leader><leader> :nohlsearch<CR>
map <leader>j a<c-r>%<ESC>


command W         :w
command Writer    set colorcolumn=80 tw=80 wrap spell spelllang=de
command SpellDE   set spell spelllang=de
command SpellEN   set spell spelllang=en

let g:tex_indent_brace=0
let g:tex_indent_items=0

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
