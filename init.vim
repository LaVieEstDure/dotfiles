set encoding=utf-8
set signcolumn=yes
"All plugins
set number
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'wagnerf42/vim-clippy'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'vim-syntastic/syntastic'j

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }


" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" (Completion plugin option 1)
Plug 'roxma/nvim-completion-manager'


Plug 'bling/vim-bufferline'
Plug 'tmhedberg/SimpylFold'
Plug 'rust-lang/rust.vim'


"if executable('rls')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'rls',
"        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
"        \ 'whitelist': ['rust'],
"        \ })
"endif

call plug#end()
set runtimepath+=~/.vim-plugins/LanguageClient-neovim

set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'] }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>


"Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_rust_checkers = ['cargo']

" Colours
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

map <F6> :NERDTreeToggle<CR>

"Settings for autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"


"imap <c-space> <Plug>(asyncomplete_force_refresh)
"let g:asyncomplete_remove_duplicates = 1

" Enable folding with the spacebar
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

nnoremap <C-Tab> :bn<CR>
nnoremap <C-S-Tab> :bp<CR>

syntax on
colorscheme onedark
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

 let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
    \}

let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '' 
set updatetime=500
