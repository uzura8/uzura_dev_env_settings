"-----------------------------------------------------------------------------
"基本設定

syntax on
"set nocompatible
"set number

set enc=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,euc-jp,cp932

set backspace=2

set noswapfile
"set shiftwidth=4
"set tabstop=4
set shiftwidth=2
set tabstop=2
"set expandtab

set hlsearch

set grepprg=ack
highlight EBISpace cterm=underline ctermfg=blue
match EBISpace /[ 　]/
set ambiwidth=double
let php_folding=1
highlight Folded ctermfg=green
highlight FoldColumn ctermfg=green
"set ai
set backspace=indent,eol,start " バックスペースでなんでも消せるように

" マウスモード有効
"set mouse=a
" screen対応
set ttymouse=xterm2

"-----------------------------------------------------------------------------
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
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
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif

" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"-----------------------------------------------------------------------------
" マップ定義
"
"バッファ移動用キーマップ
" F2: 前のバッファ
" F3: 次のバッファ
" F4: バッファ削除
map <F5> <ESC>:bp<CR>
map <F6> <ESC>:bn<CR>
"map <F10> <ESC>:bw<CR>
" Ctrl+Nで次のバッファを表示
map <C-N>   :bnext<CR>
" Ctrl+Pで前のバッファを表示
map <C-P>   :bprevious<CR>
"表示行単位で行移動する
"nnoremap j gj
"nnoremap k gk
"フレームサイズを怠惰に変更する
noremap + <C-W>+
noremap - <C-W>-


"-----------------------------------------------------------------------------
"その他 
"シンタックスハイライトを有効にする
syntax on

"ステータスラインを常に表示
set laststatus=2

"編集中の内容を保ったまま別の画面に切替えられるようにする
set hid

"入力中のコマンドをステータスに表示する
set showcmd

"スペースキーにページ送りを割り当て
"nmap <Space> <PageDown>

"ビジュアルモードでバックスペースキーを<Delete>と同じ動きにしたい
vmap <BS> x


" PHPのファイルを開くときに辞書を設定
autocmd FileType php :set dictionary+=~/.vim/dict/php_functions.dict
" キーワード補完を有効に
set complete+=k
" デフォだと補完の色がキモイので変更
hi Pmenu ctermfg=Black ctermbg=Grey
hi PmenuSel ctermbg=Blue
hi PmenuSbar ctermbg=Cyan

"括弧を自動補完
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap ' ''<LEFT>
"vnoremap { "zdi^V{<C-R>z}<ESC>
"vnoremap [ "zdi^V[<C-R>z]<ESC>
"vnoremap ( "zdi^V(<C-R>z)<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>

" -------------------
" 検索
" -------------------
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する(noignorecase)
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する(nosmartcase)
set smartcase
"検索語が画面の真ん中に来るようにする
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" -------------------
" 移動
" -------------------
" 表示行単位で移動できるようにする
"nmap j g<Down>
"nmap k g<Up>
"vmap j g<Down>
"vmap k g<Up>
"nnoremap j gj
"nnoremap k gk
"nmap h <Insert>
"nmap i <Up>
"nmap k <Down>
"nmap j <Left>
"vmap i <Up>
"vmap k <Down>
"vmap j <Left>

"insert mode keymap
"inoremap <C-j> <Left>
"inoremap <C-k> <Down>
"inoremap <C-i> <Up>
"inoremap <C-l> <Right>

"日本語入力中にカーソルの色を変更する
if has('multi_byte_ime') || has('xim')
    " 日本語入力ON時のカーソルの色を設定
    highlight CursorIM guibg=Purple guifg=NONE
endif

"file yanktmp.vimrc
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR> 

"PHPマニュアル表示
map m :call EBI_PHP_MAN()<CR>

function! EBI_PHP_MAN()
  let str  = expand("<cword>")
  let word = substitute(str, '(*\(\k\+\).*', '\1', '')

  exec "!phpman " . word

  return
endfunction

"phpの文法チェック
nmap ,l :call PHPLint()<CR>

function PHPLint()
  let result = system(&ft . ' -l ' . bufname(""))
  echo result
endfunction

"phpの実行
nmap ,@ :call PHPExec()<CR>

function PHPExec()
  let result = system(&ft . ' ' . bufname(""))
  echo result
endfunction

"phpの実行
"nmap ,e :call ShebangExecute()
"function! ShebangExecute()
"  let m = matchlist(getline(1), '#!\(.*\)')
"  if(len(m) > 2)
"    execute '!'.m[1] . ' %'
"  else
"    execute '!' &ft ' %'
"endfunction

" 保存ファイル名にに日時を利用
:let $DATE = strftime('%Y%m%d')

" for MacVIm
if has('gui_macvim')
    set transparency=20
    set guifont=Menlo:h12
"    set lines=35 columns=150
    set guioptions-=T

    set showtabline=2 " タブを常に表示
    set imdisable " IMを無効化
    set antialias
    colorscheme macvim
endif
