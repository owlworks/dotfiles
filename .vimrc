set wrapscan
set incsearch
set hlsearch
set title
set cmdheight=2
set laststatus=2
set mouse=a
set showcmd
set visualbell t_vb=
set noerrorbells
set autoread
set cursorline
set ignorecase
set smartindent
set backspace=2
set number
set clipboard+=unnamed
set clipboard=unnamed
set showmatch
set history=10000
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
set showmatch
set wildmenu
set laststatus=2
set showmode
set showcmd
set ruler

nnoremap x "_x
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap <C-n> gt
nnoremap <C-p> gT

if &term =~ "xterm"
  let &t_ti .= "\e[?2004h"
  let &t_te .= "\e[?2004l"
  let &pastetoggle = "\e[201~"
  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction
  noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
  cnoremap <special> <Esc>[200~ <nop>
  cnoremap <special> <Esc>[201~ <nop>
endif

autocmd BufNewFile,BufRead Gemfile set filetype=ruby
colorscheme desert
syntax on

hi Pmenu ctermfg=15 ctermbg=18 guibg=#666666
hi PmenuSel ctermbg=39 ctermfg=0 guibg=#8cd0d3 guifg=#666666
hi PmenuSbar guibg=#333333

if has('vim_starting')
  set nocompatible
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\    },
\ }
NeoBundleLazy 'tpope/vim-endwise', {
\ 'autoload' : { 'insert' : 1,}}
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Shougo/neomru.vim', {
  \ 'depends' : 'Shougo/unite.vim'
  \ }
NeoBundle 'tpope/vim-rails'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundleLazy 'vim-ruby/vim-ruby', {
\ 'autoload' : {'filetypes' : ['ruby', 'eruby']}}
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'
NeoBundle 'derekwyatt/vim-scala'

NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'grep.vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle "Shougo/neosnippet"
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle "honza/vim-snippets"
NeoBundle 'scrooloose/syntastic'
NeoBundle 'marcus/rsense'
NeoBundleLazy 'junegunn/vim-easy-align', {
  \ 'autoload': {
  \   'commands' : ['EasyAlign'],
  \   'mappings' : ['<Plug>(EasyAlign)'],
  \ 'filetypes': 'ruby',
  \ }}
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'itchyny/lightline.vim'

let g:quickrun_config = {'*': {'hook/time/enable': '1'},}
NeoBundleCheck

" vim-indent-guides
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=110
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=99
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

" rsense
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['ruby'] }
let g:neobundle_default_git_protocol='https'

vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

nnoremap <silent><C-e> :NERDTreeToggle<CR>

inoremap <expr><C-c>  neocomplete#cancel_popup()
inoremap <expr><C-u>  neocomplete#undo_completion()
inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

call neobundle#end()

filetype plugin on
filetype indent off
set t_Co=2561
