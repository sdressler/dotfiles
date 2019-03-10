
let mapleader=","

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
Plug 'w0ng/vim-hybrid'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'tweekmonster/deoplete-clang2'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'

Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'airblade/vim-gitgutter'
Plug 'zchee/deoplete-go', { 'do': 'make'}

" Plug 'vim-scripts/dbext.vim'
Plug 'fourjay/dbext'

Plug 'mhinz/vim-grepper'
Plug 'vim-scripts/SQLUtilities'
Plug 'vim-scripts/Align'
Plug 'janko-m/vim-test'
Plug 'alfredodeza/pytest.vim'
Plug 'pearofducks/ansible-vim'
Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'vimwiki/vimwiki'
Plug 'shime/vim-livedown'

Plug 'tarekbecker/vim-yaml-formatter'

Plug 'mtth/scratch.vim'
Plug 'SirVer/ultisnips'
Plug 'shougo/junkfile.vim'

Plug 'morhetz/gruvbox'

Plug '/Users/sebastian/Developer/vim-db'

" Initialize plugin system
call plug#end()

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"colorscheme wombat256dave
"set background=dark
"let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
colorscheme gruvbox

set number
set nocompatible
set expandtab tabstop=4 shiftwidth=4

let &colorcolumn=join(range(120,999),",")
autocmd BufNewFile,BufRead *.py,*.md let &colorcolumn=join(range(100,999),",")
autocmd BufNewFile,BufRead *.md let &colorcolumn=join(range(80,999),",")
autocmd BufNewFile,BufRead *.js,*.yaml,*.sql,*.vue set tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile */playbooks/*.yaml set filetype=ansible tabstop=2 shiftwidth=2

" Add fzf
set rtp+=/usr/local/opt/fzf
" let $FZF_DEFAULT_COMMAND = 'seq 100'
let $FZF_DEFAULT_COMMAND = 'ag --follow -l -g ""'
nnoremap <leader>t :FZF<CR>

nnoremap <leader>be :CtrlPBuffer<CR>

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_python_checkers = []
" 
" let g:syntastic_cpp_checkers = ['gcc']
" let g:syntastic_cpp_compiler = 'gcc'
" let g:syntastic_cpp_compiler_options = '-std=c++14 -Wall -Wextra'
" 
" let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
highlight LineNr ctermfg=grey

set so=999

"let g:python_host_prog = '/home/nethomes/sebastian/.local/bin/python2'
"let g:python3_host_prog = '/home/nethomes/sebastian/.local/bin/python3'
let g:python3_host_prog = '/Users/sebastian/ENV/bin/python3'

"let g:jedi#force_py_version = 3

set list

" Deoplete
let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#clang#libclang_path = '/home/nethomes/sebastian/.local/llvm/4.0.0/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/home/nethomes/sebastian/.local/llvm/4.0.0/include/clang'
let g:deoplete#sources#clang#std = { 'cpp': 'c++14' }

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'
let g:tern#filetypes = [ 'jsx' ]

"let g:neomake_python_pylint_maker = {
"    \ 'args': ['--score=n']
"    \ }
"let g:neomake_python_enabled_makers = ['pylint']
"autocmd BufWrite *.py Neomake

" Coveragepy mappings
nnoremap <leader>cr :Coveragepy refresh<CR>

let g:deoplete#sources#go#gocode_binary = '/Users/sebastian/go/bin/gocode'

let g:deoplete#sources#jedi#show_docstring = 1
" let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'

let g:ultisnips_python_style = 'numpy'
let g:ultisnips_python_quoting_style = 'single'

" vim-test
let test#strategy = 'neovim'
nmap <leader>tf <Esc>:TestFile<CR>
nmap <leader>ta <Esc>:Pytest project<CR>

autocmd BufEnter * :syntax sync fromstart
" let g:vim_markdown_folding_disabled = 1

function SetMarkdownOptions()
    set filetype=markdown
    set conceallevel=0
endfunction

autocmd BufEnter,BufRead,BufNewFile *.md call SetMarkdownOptions()

"autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
"let g:markdown_syntax_conceal = 0

let g:deoplete#sources#rust#racer_binary='/Users/sebastian/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/sebastian/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'

let g:vimwiki_list = [{
    \ 'path': '~/Nextcloud2/wiki/src/',
    \ 'path_html': '~/Nextcloud2/wiki/public_html/',
    \ 'syntax': 'markdown',
    \ 'ext': '.md'
\ }]

let g:dbext_default_window_use_horiz = 0
let g:dbext_default_window_width = 80

let g:UltiSnipsSnippetsDir='/Users/sebastian/.local/vim-snippets'
let g:UltiSnipsSnippetDirectories=['/Users/sebastian/.local/vim-snippets']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
let g:UltiSnipsEditSplit="vertical"

" Window split settings
set splitright

" Terminal settings
tnoremap <ESC> <C-\><C-n>

" Move around with Ctrl + Arrow
tnoremap <C-Left>  <C-\><C-N><C-w>h
tnoremap <C-Right> <C-\><C-N><C-w>l
tnoremap <C-Up>    <C-\><C-N><C-w>k
tnoremap <C-Down>  <C-\><C-N><C-w>j
inoremap <C-Left>  <C-\><C-N><C-w>h
inoremap <C-Right> <C-\><C-N><C-w>l
inoremap <C-Up>    <C-\><C-N><C-w>k
inoremap <C-Down>  <C-\><C-N><C-w>j
nnoremap <C-Left>  <C-w>h
nnoremap <C-Right> <C-w>l
nnoremap <C-Up>    <C-w>k
nnoremap <C-Down>  <C-w>j

" Go straight to insert mode when entering a terminal
" autocmd BufWinEnter,WinEnter term://* startinsert
