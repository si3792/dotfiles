" disable the highlight search
nnoremap <CR> :noh<CR><CR>

" increase the window size, usually used for windows terminals
" set lines=60 columns=220

hi LineNr guifg=#AAAAAA guibg=#111111
set guifont=Menlo\ for\ Powerline:h14
filetype off
set rtp=~/.vim/bundle/vundle/,~/.vim,$VIMRUNTIME
let g:snippets_dir='~/dotfiles/snippets/'
call vundle#rc()

" Plugins {
    Plugin 'gmarik/vundle'

    " themes
    "Plugin 'Railscasts-Theme-GUIand256color'
    Plugin 'flazz/vim-colorschemes'
    silent! colorscheme darkZ " vividchalk theme is good high contrast too
    Plugin 'sheerun/vim-polyglot'
    "Plugin 'bigfish/vim-js-context-coloring'
    Plugin 'elzr/vim-json'

    ""match tags and navigate through %
    Plugin 'tmhedberg/matchit'
    Plugin 'groenewege/vim-less'

    Plugin 'msanders/snipmate.vim'

    Plugin 'kchmck/vim-coffee-script'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/syntastic'
    "Plugin 'sekel/vim-vue-syntastic'
    Plugin 'airblade/vim-gitgutter'

    "plugin to create motions with simulteniosely pressed keys(altogether)
    Plugin 'kana/vim-arpeggio'

    "Plugin 'mxw/vim-jsx'
    "let g:jsx_ext_required = 0

    " handlebars and mustache support
    Plugin 'mustache/vim-mustache-handlebars'

    "typescript plugins for intellisense
    Plugin 'shougo/vimproc.vim'
    Plugin 'quramy/tsuquyomi'

    " yet another js syntax
    "Plugin 'othree/yajs.vim'
    " or other js syntax
    "Plugin 'pangloss/vim-javascript'

    Plugin 'underlog/vim-PairTools'
    Plugin 'mattn/emmet-vim'
    " Plugin 'cespare/vim-bclose'
    " Vim diff plugin
    "Plugin 'digitaltoad/vim-jade'
    Plugin 'duganchen/vim-soy'
    Plugin 'terryma/vim-multiple-cursors'

    " improved incrementalsearch
    Plugin 'haya14busa/incsearch.vim'
    " jump faster through the screen
    Plugin 'easymotion/vim-easymotion'
    let g:EasyMotion_smartcase = 1
    " move to single character
    "map  f <Plug>(easymotion-f2)
    nmap <silent> f <Plug>(easymotion-overwin-f2)

    "Plugin 'majutsushi/tagbar'
    "This addon does not work well with easymotion when jumping over win
    "nmap <F3> :TagbarToggle<CR>
    "let g:tagbar_compact = 1
    "let g:tagbar_autofocus = 1
    "let g:tagbar_foldlevel = 1

    "Plugin 'rking/ag.vim'
    Plugin 'mileszs/ack.vim'
    Plugin 'dyng/ctrlsf.vim'
    let g:ctrlsf_mapping = {
      \ "next": "n",
      \ "prev": "N",
      \ }

    "git tools blame, log, view files in other branches
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-rhubarb'
    " change surrounding brancjes
    Plugin 'tpope/vim-surround'

    let g:ragtag_global_maps = 1

    Plugin 'kien/ctrlp.vim'
    let g:ctrlp_max_files=0

    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    set laststatus=2

    Plugin 'vim-airline/vim-airline'
    let g:airline_powerline_fonts = 1
    let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

    Plugin 'jlanzarotta/bufexplorer'
    nnoremap ,b :BufExplorer<CR>
    Plugin 'junegunn/vim-easy-align'
" }

  " The Silver Searcher
  if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ackprg = 'ag --vimgrep'

     " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0

  endif

  " Syntastic checkers
  let g:syntastic_error_symbol = "✗"
  let g:syntastic_warning_symbol = "⚠"
  " make sure  you have eslint/jshint installed globally from npm
  let g:syntastic_javascript_checkers = ["eslint"]
  let g:syntastic_scss_checkers=["scss_lint", "stylelint"]
  let g:syntastic_vue_checkers=["eslint"]

  let g:tsuquyomi_disable_quickfix = 1
  let g:syntastic_typescript_checkers = ['tsuquyomi']

  " make use of local eslint !! wohoo
  let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
  if matchstr(local_eslint, "^\/\\w") == ''
      let local_eslint = getcwd() . "/" . local_eslint
  endif
  if executable(local_eslint)
      let g:syntastic_javascript_eslint_exec = local_eslint
      let g:syntastic_vue_eslint_exec = local_eslint
  endif


  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  "BufExplorer show relative paths by default
  let g:bufExplorerShowRelativePath=1  " Show relative paths.

" General {
    set hidden

    if $TMUX == ''
      set clipboard+=unnamed
    endif
    set encoding=utf-8

    " do not show folded
    set foldlevel=20

    set colorcolumn=100

    " searching
    set ignorecase
    set smartcase
    set incsearch
    set showmatch
    set hlsearch

    "disable hit enter to contine spam msg when redrawing
    "


    set shortmess=aoOtI

    " avoid swap, temp and backup files
    set nobackup
    set nowritebackup
    set noswapfile

    " show the cursor position all the time
    set ruler

    " display incomplete commands
    set showcmd
    set wildmenu

    " terminal settings
    set t_Co=256
    set mouse=a
    set ttymouse=xterm2
" }

" Keybindings {
    noremap <C-S> :w<CR>
    inoremap <C-S> <C-O>:w<CR><Esc>

    noremap <S-CR> <Esc>

    "sudo overwrite protect file
    cmap w!! w !sudo tee > /dev/null %

    set backspace=indent,eol,start " make backspace behave consistently with other apps

    " delete trailing whitespace
    nnoremap <silent> <leader>q :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

    " toggle NerdTree
    noremap <silent> <leader>] :NERDTreeToggle<CR>

    " search with ag via the Ack frontend plugin
    noremap <leader>s :Ack! 
    "use leader-r to navigate to current file in nerdtree
    noremap <leader>r :NERDTreeFind<CR>zz

    " quick-paste last yanked text
    noremap <C-p> "0p
    noremap <C-P> "0P

    "search with YankRing (Ditto like plugin)
    "nnoremap <leader><Space> :YRShow<CR>
    "inoremap <leader><Space> :YRShow<CR>
    nnoremap <C-b> :CtrlPMRU<CR>

    " bind R to search and replace word under the cursor or visual selection
    nnoremap R :CtrlSF <C-R><C-W><CR>
    vnoremap R y:CtrlSF "<C-R>""<CR>

    " bind K to search grep word under the cursor
    nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>
    vnoremap K y:Ack! "<C-R>""<CR>
    "search for the visually selected text
    vnoremap // y/<C-R>"<CR>

    "replace word under cursor
    nnoremap ,r :%s/\<<C-r><C-w>\>//g<Left><Left>

    "typescript tools by tsuquyomi
    nnoremap ,tqf :TsuQuickFix<CR>
    nnoremap ,ti :TsuImport<CR>
    nnoremap ,td :TsuDefinition<CR>
    nnoremap ,tr :TsuRenameSymbol<CR>

    "use incsearch plugin
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)

    nnoremap ,o :only<CR>

    " center screen
    noremap <Space><Space> zz
    " add space after
    noremap <Space>a a<Space><ESC>h
    " add space before
    noremap <Space>i i<Space><ESC>l

    "jump to the closest opening bracket of type {
    nnoremap { [{

    " indent!
    nnoremap <Tab> >>
    nnoremap <S-Tab> <<
    vnoremap <Tab> >gv
    vnoremap <S-Tab> <gv

    nnoremap <C-e> 3<C-e>
    nnoremap <C-y> 3<C-y>
    nnoremap <D-j> 3<C-e>
    nnoremap <D-k> 3<C-y>

    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

    "free the mapping <C-i> taken by snipmate
    "unmap <C-i>

    " tag auto-close with c-space
    imap <C-Space> <C-X><C-O>

    " close buffer
    nnoremap <C-W>! <Plug>Kwbd

    noremap <leader>ve :vsplit $MYVIMRC<CR>
    noremap <leader>vu :source %<CR>

    vnoremap H ^
    nnoremap H ^

    " Settings for VimDiff as MergeTool
    if &diff
      noremap <leader>1 :diffget LOCAL<CR>
      noremap <leader>2 :diffget BASE<CR>
      noremap <leader>3 :diffget REMOTE<CR>
      colorscheme darkBlue
    endif
" }

" Coding {
    set iskeyword+=_,$,@,%,#
    " hide the toolbar and the menu of GVIM
    set guioptions-=m
    set guioptions-=T

    " show line numbers
    set number
    " highlight lineNr ctermfg=grey
    syntax on

    "set cursorline
    hi CursorLine guibg=NONE


    set completeopt=longest,menuone
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " show trailing whitespace
    set list listchars=tab:>-,trail:.

    " ignore binaries and artifacts
    set wildignore=*.o,*.obj,*.bin,*.dll,*.zip
    " exclude version control directories
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
    set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*

    set completeopt=menuone

    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
    set expandtab

    "switch paste behavior to avoid added tabs
    set pastetoggle=<F10>

    set autoindent
    set smartindent
    set smarttab

    filetype plugin indent on

    au FileType gitcommit           setlocal spell
    "au BufRead,BufNewFile *.vue    setlocal syntax=javascript
    "au BufReadPost *.json set filetype=javascript
    "au BufReadPost *.es6,*.ts set filetype=javascript
    "disable continuous comments vim
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" }

" auto reload the vimrc when it is saved

augroup reload_vimrc " {
    au!
    au BufWritePost $MYVIMRC source $MYVIMRC
    au BufWritePost $MYVIMRC source $MYGVIMRC
augroup END " }


" workspace specific options

function! WorkSpaceSettings()
  let l:path = expand('%:p')
  if l:path =~ '/Leanplum/'
    "let b:syntastic_checkers = ["jshint"]

    iabbrev @@@ // All rights reserved. Leanplum. 2016.
          \<CR>// Author: Petur Subev (petur@leanplum.com)
          \<CR>// 

    if l:path =~ '.*\.py$'
      setlocal tabstop=2
      setlocal shiftwidth=2
      setlocal softtabstop=2
    endif

  endif
endfunction

au! BufReadPost,BufNewFile * call WorkSpaceSettings()
