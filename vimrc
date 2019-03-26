set wildmode=longest:full,full
set autoindent          "改行時に前の行のインデントを計測
set smartindent         "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set cindent             "Cプログラムファイルの自動インデントを始める
set smarttab            "新しい行を作った時に高度な自動インデントを行う
set expandtab           "タブ入力を複数の空白に置き換える

set tabstop=4           "タブを含むファイルを開いた際, タブを何文字の空白に変換するか
set shiftwidth=4        "自動インデントで入る空白数
set softtabstop=0       "キーボードから入るタブの数

" 画面上でタブ文字が占める幅
" set tabstop=2
""" set shiftwidth=4
"set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
""" set autoindent " 改行時に前の行のインデントを継続する
set columns=149
set lines=42
nnoremap s <Nop>
inoremap <C-l> <Right>
inoremap <C-h> <Left>
inoremap { {}<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  unlet s:enc_euc
  unlet s:enc_jis
endif
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif

nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
" nnoremap sr <C-w>r
nnoremap s= <C-w>=
""nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q!<CR>
nnoremap sw :<C-u>w<CR>
nnoremap sz :<C-u>wq<CR>
" nnoremap sQ :<C-u>bd<CR>
" nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
" nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
" nnoremap <C-e> :w


nnoremap <C-u> <C-b>
nnoremap <C-d> <C-f>
set laststatus=2
set mouse=a
vmap <C-C> "+y
"set cursorline
"set expandtab " タブ入力を複数の空白入力に置き換える
"set softtabstop=4

set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決 ただし透明にするためカラースキムの形式を変えると機能しない


if &compatible
set nocompatible               " Be iMproved
endif
" Required:
set runtimepath+=/home/keito/.cache/dein/repos/github.com/Shougo/dein.vim
" Required:
if dein#load_state('/home/keito/.cache/dein')
  call dein#begin('/home/keito/.cache/dein')
" Let dein manage dein
" Required:
call dein#add('/home/keito/.cache/dein/repos/github.com/Shougo/dein.vim')
 " Add or remove your plugins here:

  " ...
"  if has('python3')
"     call dein#add('Shougo/deoplete.nvim')
"        " endif
  " elseif has('lua')
call dein#add('Shougo/neocomplete.vim')
  " endif

" call dein#add('roxma/nvim-yarp')
" call dein#add('roxma/vim-hug-neovim-rpc')

" ...
call dein#add('itchyny/lightline.vim')
"call dein#add('bling/vim-airline')
call dein#add('maximbaz/lightline-ale')
call dein#add('w0rp/ale')
call dein#add('scrooloose/nerdtree')

call dein#add('jistr/vim-nerdtree-tabs')
let g:NERDTreeShowBookmarks=1

"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

call dein#add('junegunn/vim-plug')
call dein#add('Yggdroot/indentLine')
"call dein#add('ryanoasis/vim-devicons')
"call dein#add('Townk/vim-autoclose')
call dein#add('airblade/vim-gitgutter')
call dein#add('Shougo/deoplete.nvim')
" let g:deoplete#enable_at_startup = 1

call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('tpope/vim-fugitive')
call dein#add('jmcantrell/vim-virtualenv')
call dein#add('hynek/vim-python-pep8-indent')
call dein#add('tomasr/molokai')
call dein#add('romainl/Apprentice')
call dein#add('sjl/badwolf')
call dein#add('jacoborus/tender.vim')
call dein#add('Shougo/unite.vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('kien/ctrlp.vim')
" call dein#add('cohama/lexima.vim')
" call lexima#init()
" inoremap <expr> <CR> someCondition() ? yourMapping() : lexima#expand('<CR>', 'i')
" inoremap <expr> <CR> someCondition() ? yourMapping() : lexima#expand('<LT>CR>', 'i')
" call dein#add('Shougo/neocomplete.vim')
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-surround')
call dein#add('thinca/vim-prettyprint')
call dein#add('hokaccha/vim-html5validator')
"call dein#add('vim-syntastic/syntastic')
call dein#add('godlygeek/csapprox')
call dein#add('osyo-manga/vim-watchdogs')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('osyo-manga/shabadou.vim')
" call dein#add('dannyob/quickfixstatus')
call dein#add('tyru/open-browser.vim')
"push gx open http
call dein#add('LeafCage/yankround.vim')
call dein#add('gosukiwi/vim-atom-dark')
call dein#add('thinca/vim-quickrun')
call dein#add('reireias/vim-cheatsheet')
call dein#add('jdkanani/vim-material-theme')
call dein#add('miyakogi/seiya.vim')
"call dein#add('gorodinskiy/vim-coloresque')
"vim japanese help
call dein#add('vim-jp/vimdoc-ja')
call dein#add('cocopon/iceberg.vim')
call dein#add('joshdick/onedark.vim')
call dein#add('rhysd/clever-f.vim')
call dein#add('t9md/vim-quickhl')
call dein#add('Crapworks/python_fn.vim')
call dein#add('glidenote/memolist.vim')
call dein#add('kana/vim-submode')
call dein#add('lambdalisue/vim-pyenv')
" call dein#add('taketwo/vim-ros')
call dein#add('davidhalter/jedi-vim')
call dein#add('tell-k/vim-autopep8')
" call dein#add('Shougo/unite-help')
call dein#add('majutsushi/tagbar')
call dein#end()
call dein#save_state()
endif
"set g:quickrun_config={'*': {'split': 'vertical'}}
"
"quickrun
set splitright
"set clipboard=unnamed,autoselect

" Highlighting
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=white guibg=White
" カレント行ハイライトON
"set cursorline
" アンダーラインを引く(color terminal)
"highlight CursorLine cterm=NONE ctermfg=white ctermbg=black
" アンダーラインを引く(gui)
"highlight CursorLine gui=NONE guifg=white guibg=black

let g:lightline = {
    \ 'colorscheme': 'powerline',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified' ],
    \             [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ],
    \ },
    \ }
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

 let b:ale_linters = {
     \   'javascript': ['eslint', 'eslint-plugin-vue'],
     \   'python': ['flake8'],
     \   'ruby': ['rubocop'],
     \   'tex': ['textlint'],
     \   'markdown': ['textlint'],
     \   'css': ['stylelint'],
     \}
    " let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
    let g:ale_set_loclist = 1
    " let g:ale_set_quickfix = 0
    nmap <silent> <C-n> <Plug>(ale_next_wrap)

"if s:dein_enabled && dein#tap('lightline.vim')
"  let g:lightline = {
"        \'active': {
"        \'component_function': {
"              \'ale': 'LLAle',
"              \},
"        \}
"  if dein#tap('ale')
"    function! LLAle()
"      let l:count = ale#statusline#Count(bufnr(''))
"      let l:errors = l:count.error + l:count.style_error
"      let l:warnings = l:count.warning + l:count.style_warning
"      return l:count.total == 0 ? 'OK' : 'E:' . l:errors . ' W:' . l:warnings
"    endfunction
"  else
"    function! LLAle()
"      return ''
"    endfunction
"  endif
"endif

" Using the mouse on a terminal.
"if has('mouse')
" if has('mouse_sgr')
"  set ttymouse=sgr
"elseif v:version > 703 || v:version is 703 && has('patch632') " I couldn't use has('mouse_sgr') :-(
"  set ttymouse=sgr
"else
"  set ttymouse=xterm2
" endif

let g:seiya_auto_enable=1

" let g:neocomplete#enable_at_startup = 1
" Recommended key-mappings.
" <CR>: close popup and save indent.
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"22222222222222222222222inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"おそらく下のpuluginは働かないvimはsyntastic _ ではなく#なので 上を参照 設定を全て入れないと動かない
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"You can specify revision/branch/tag.
" call dein#add('Shougo/deol.nvim')
" Required:
"endif
" Required:
filetype plugin indent on
filetype plugin on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"---End dein Scripts-------------------------
"set completeopt=menuone
"for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
" exec"imap".k."".k."<C-N><C-P>"
"endfor
"imap<expr><TAB>pumvisible()?"\<Down>":"\<Tab>"
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap " . k . " " . k . "<C-N><C-P>"
endfor
imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"
execute pathogen#infect()


nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <C-e> :w
nnoremap <C-q> :q!
nmap <C-f> :NERDTreeToggle<CR>

if exists("syntax_on")
  syntax reset
endif

hi clear
" or
highlight clear

" 全角スペースの背景を白に変更
autocmd Colorscheme * highlight FullWidthSpace ctermbg=red
autocmd VimEnter * match FullWidthSpace /　/
" カラースキームの設定
"set termguicolors
"set background=light
colorscheme atom-dark

"highlight string ctermfg=77
""highlight Character ctermfg=214
"
"highlight statement ctermfg=97
"""highlight operator ctermfg=214
"highlight Special ctermfg=227
"""ex)set number
"highlight PreProc ctermfg=97
""
"""highlight Identifier ctermfg=214
"highlight Function ctermfg=33
""
""highlight Directory ctermfg=92
"
"highlight type ctermfg=97
"
"highlight Conditional ctermfg=75
"highlight Comment ctermfg=255
"highlight Keyword ctermfg=193
"highlight Visual ctermfg=42

"set clipboard=unnamed,autoselect

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

augroup TransparentBG
 	autocmd!
	autocmd Colorscheme * highlight Normal ctermbg=none
	autocmd Colorscheme * highlight NonText ctermbg=none
	autocmd Colorscheme * highlight LineNr ctermbg=none
	autocmd Colorscheme * highlight Folded ctermbg=none
	autocmd Colorscheme * highlight EndOfBuffer ctermbg=none
	autocmd Colorscheme * highlight SignColumn ctermfg=none
	autocmd Colorscheme * highlight VertSplit ctermfg=none
	autocmd Colorscheme * highlight CursorLineNr ctermfg=none
augroup END

set incsearch


nnoremap sr :belowright :terminal<CR>
tnoremap <C-Q> <C-W>N

function! s:open(args) abort
    if empty(term_list())
        execute "terminal" a:args
    else
        let bufnr = term_list()[0]
        execute term_getsize(bufnr)[0] . "new"
        execute "buffer + " bufnr
    endif
endfunction


" 先ほど作った関数に追記する
function! s:filetype()
   " これも <A-w> の部分は自分の環境に合わせて直してね
    call timer_start(0, { -> feedkeys("\<A-w>\<S-n>") })
endfunction

" すでに :terminal が存在していればその :terminal を使用する
command! -nargs=*
\   Terminal call s:open(<q-args>)

set noswapfile
set number
" Edit vimrc
nmap ,v :edit $MYVIMRC<CR>
"非同期実行
let g:quickrun_config = {
\   '*': {'runmode': 'async:remote:vimproc'},
\ }
"終了コマンド
nnoremap <Space>o :only<CR>

" autocmd Vimenter * NERDTree
"autocmd VimEnter * wincmd w
autocmd StdinReadPre * let s:std_in=0
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"過去のコピーをペースト
"nmap p <Plug>(yankround-p)
"nmap P <Plug>(yankround-P)
"nmap gp <Plug>(yankround-gp)
"nmap gP <Plug>(yankround-gP)
"nmap <C-p> <Plug>(yankround-prev)
"nmap <C-n> <Plug>(yankround-next)
"let g:yankround_dir = '~/.cache/yankround'
"" translate-shellを使う
let s:trans_cmd = 'trans'
let s:trans_opt = '-b --no-ansi -e google'
exec 'command! -nargs=0 -range Trans <line1>,<line2>!' . s:trans_cmd . ' ' . s:trans_opt
"和訳
nnoremap <F2> :'<,'>w !trans -b -sl=en -tl=ja
"英訳
nnoremap <silent> <F3> :Trans<CR>
"help日本語切り替え
set helplang=ja,en
"lightline設定
set noshowmode

" Fixer(コード整形ツール)の設定
let b:ale_fixers = {
\   'python': ['autopep8', 'isort'],
\}
" 余分な空白があるときは警告表示
let b:ale_warn_about_trailing_whitespace = 0


nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"実行時間表示 不安定
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}

" deusのパレットを選択 "
"let s:palette = g:lightline#colorscheme#wombat#palette
"let s:blue = 14
"let s:green = 119
"let s:base03 = [ '#242424', 235 ]
"let s:base023 = [ '#353535 ', 236 ]
"let s:base02 = [ '#444444 ', 238 ]
"let s:base01 = [ '#585858', 240 ]
"let s:base00 = [ '#666666', 242  ]
"let s:base0 = [ '#808080', 244 ]
"let s:base1 = [ '#969696', 247 ]
"let s:base2 = [ '#a8a8a8', 248 ]
"let s:base3 = [ '#d0d0d0', 252 ]
""let s:black = 235
""let s:white = 145
""let s:gray = 236
"
"let s:p.normal.left = [ [ s:base02, s:green ], [ s:base3, s:base01 ] ]
""let s:p.normal.right = [ [ '#292c33', '#8eb2f7', s:black, s:blue, 'bold' ], [ '#abb2bf', '#3e4452', s:white, s:black ], [ '#8eb2f7', '292c33', s:blue, s:black ] ]
"let s:p.insert.left  =[ [ s:base02, s:blue ], [ s:base3, s:base01 ] ]
"let s:palette.insert.right = [ [ '#292c33', '#98c379', s:black, s:green ], [ '#abb2bf', '#3e4452', s:white, s:gray ], [ '#98c379', '#292c33', s:green, s:black ] ]
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" set statusline+=%{ALEGetStatusLine()}

" let g:lightline = {
"   \'active': {
"   \  'left': [
"   \    ['mode', 'paste'],
"   \    ['readonly', 'filename', 'modified', 'ale'],
"   \  ]
"   \},
"   \'component_function': {
"   \  'ale': 'ALEGetStatusLine'
"   \}
" \ }
" " let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" let g:lightline.statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

autocmd BufWritePre * call s:remove_unnecessary_space()

function! s:remove_unnecessary_space()
    " delete last spaces
    %s/\s\+$//ge

    " delete last blank lines
    while getline('$') == ""
            $delete _
    endwhile
endfunction

nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)

nmap <Space>w <Plug>(quickhl-manual-this-whole-word)
xmap <Space>w <Plug>(quickhl-manual-this-whole-word)

nmap <Space>c <Plug>(quickhl-manual-clear)
vmap <Space>c <Plug>(quickhl-manual-clear)

nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)

" yankround.vim {{{
"" キーマップ
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-b> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
"" 履歴取得数
let g:yankround_max_history = 10
""履歴一覧(kien/ctrlp.vim)
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>
" }}}

let g:cheatsheet#cheat_file = '/path/to/your/cheetsheet'
map <Leader>mc  :Cheat<CR>
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>
" use unite (default 0)
let g:memolist_unite = 1

"neosnippet Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"set snippet file dir
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/snippets'

call submode#enter_with('bufmove', 'n', '', 's,', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's.', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's;', '<C-w>-')
call submode#map('bufmove', 'n', '', ',', '<C-w>>')
call submode#map('bufmove', 'n', '', '.', '<C-w><')
call submode#map('bufmove', 'n', '', '-', '<C-w>+')
call submode#map('bufmove', 'n', '', ';', '<C-w>-')

" if dein#tap('deoplete.nvim')
"   let g:deoplete#enable_at_startup = 1
" elseif dein#tap('neocomplete.vim')
   let g:neocomplete#enable_at_startup = 1
" endif
" 複数指定する場合はカンマ区切り
" let g:flake8_ignore = 'E501,W293'
let g:flake8_ignore = 'E501,E225,E302,E41,E265,E114,E261,E115,E231,E111,E501,E262'
" 複数指定する場合はカンマ区切り
" let g:syntastic_python_flake8_args = '--ignore="E501,E302"'
let g:ale_python_flake8_args = '--ignore="E501,E114"'

" autopep8
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 -')
endfunction

autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>

" filetype=cpp で include 補完を無効にする
call neocomplete#custom#source('include',
\ 'disabled_filetypes', {'python3' : 1})

"Shougo/unite-help
" nnoremap g :UniteWithCursorWord help

 autocmd FileType clang call s:clang_filetype_settings()
 function! s:clang_filetype_settings()
   setlocal tabstop=2 shiftround shiftwidth=2
   setlocal completeopt-=preview
   setlocal keywordprg=clang
 endfunction

" tagbar
nmap <F8> :TagbarToggle<CR>

" command! -nargs=*
" \   Debug
" \   try
" \|      echom <q-args> ":" string(<args>)
" \|  catch
" \|      echom <q-args>
" \|  endtry

"'Cか'Hで前のファイルに飛ぶ
autocmd BufLeave *.h       mark H
autocmd BufLeave *.{c,cpp} mark C
autocmd BufLeave *.h       mark H
