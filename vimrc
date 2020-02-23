""ESCはいらない子 →ctrl-[
""BSはいらない子 → ctrl-h
""Tabキーはいらない子 → ctrl-i
""Enterはいらない子 → ctrl-m
""3zfj 3行折りたたむ
nmap ,v :edit $MYVIMRC<CR>   "自分のvimrcへ
"set paste
set clipboard+=unnamed
set wildmode=longest:full,full
""set noautoindent          "改行時に前の行のインデントを計測
set autoindent          "改行時に前の行のインデントを計測
""set smartindent         "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
""set cindent             "Cプログラムファイルの自動インデントを始める
""set smarttab            "新しい行を作った時に高度な自動インデントを行う
""set expandtab           "タブ入力を複数の空白に置き換える
""""set clipboard=unnamed,autoselect
""
set tabstop=4           "タブを含むファイルを開いた際, タブを何文字の空白に変換するか
set shiftwidth=4        "自動インデントで入る空白数
""set softtabstop=0       "キーボードから入るタブの数

autocmd InsertCharPre FileType * <C-p><CR>

"画面のチラツキ（警告音の代わり）防止
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif


" 画面上でタブ文字が占める幅
" set tabstop=2
""" set shiftwidth=4
"set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
"set columns=150
"set lines=90
inoremap <C-c> <Esc>
""クリップボード連携
""nnoremap <C-^V> "*p
nnoremap p "*p
vnoremap <C-C> <C-insert>
nnoremap s <Nop>
tnoremap <C-d> <C-W>w
""if exists(":tmap")
""    tnoremap <Esc> <A-w><S-n>
""endif
inoremap <C-f> <Right>
inoremap <C-b> <Left>
""imap <C-P> <Up>
""imap <C-N> <Down>
""inoremap ^[OA <Up>
""inoremap ^[OB <Down>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
set nocompatible
set wildmenu
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
"nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q!<CR>
nnoremap ZZ :<C-u>w<CR>
""nnoremap sz :<C-u>wq<CR>
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

set noswapfile
set number
" Edit vimrc
nmap ,v :edit $MYVIMRC<CR>

nnoremap <C-T> :tab ter<CR> 
nnoremap sr :belowright :vertical terminal<CR>
set termkey=<A-w>
if exists(":tmap")
    tnoremap <C-d> <A-w>N
endif
""tmap <C-w> <Nop>

function! s:open(args) abort
    if empty(term_list())
        execute "terminal" a:args
    else
        let bufnr = term_list()[0]
        execute term_getsize(bufnr)[0] . "new"
        execute "buffer + " bufnr
    endif
endfunction
" すでに :terminal が存在していればその :terminal を使用する
command! -nargs=*
\   Terminal call s:open(<q-args>)

if exists("+omnifunc")
 augroup omnifunc
   autocmd!
   autocmd Filetype *
           \	if &omnifunc == "" |
           \		setlocal omnifunc=syntaxcomplete#Complete |
           \	endif
 augroup END
endif

"vimのみの補完
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap " . k . " " . k . "<C-N><C-P>"
endfor

imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"

