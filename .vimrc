" Configuração Vim para Computação@UFCG
" Valdemar Carvalho, UFCG

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'ghifarit53/tokyonight-vim'
call plug#end()

" Atalhos para Nerdtree split navigation
nmap <C-a> :NERDTreeToggle<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ALE
let g:ale_linters = {
\}
let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\}
let g:ale_fix_on_save = 1

" Coc
let g:coc_global_extensions = [ 'coc-snippets', 'coc-explorer', ]

" Coc Snippets """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
    \ pumvisible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Coc Explorer """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:nnoremap <space>e :CocCommand explorer<CR>

let g:coc_explorer_global_presets = {
    \   '.vim': {
    \     'root-uri': '~/.vim',
    \   },
    \   'cocConfig': {
    \      'root-uri': '~/.config/coc',
    \   },
    \   'tab': {
    \     'position': 'tab',
    \     'quit-on-open': v:true,
    \   },
    \   'tab:$': {
    \     'position': 'tab:$',
    \     'quit-on-open': v:true,
    \   },
    \   'floating': {
    \     'position': 'floating',
    \     'open-action-strategy': 'sourceWindow',
    \   },
    \   'floatingTop': {
    \     'position': 'floating',
    \     'floating-position': 'center-top',
    \     'open-action-strategy': 'sourceWindow',
    \   },
    \   'floatingLeftside': {
    \     'position': 'floating',
    \     'floating-position': 'left-center',
    \     'floating-width': 50,
    \     'open-action-strategy': 'sourceWindow',
    \   },
    \   'floatingRightside': {
    \     'position': 'floating',
    \     'floating-position': 'right-center',
    \     'floating-width': 50,
    \     'open-action-strategy': 'sourceWindow',
    \   },
    \   'simplify': {
    \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
    \   },
    \   'buffer': {
    \     'sources': [{'name': 'buffer', 'expand': v:true}]
    \   },
    \ }

" Use preset argument to open it
nnoremap <space>ed :CocCommand explorer --preset .vim<CR>
nnoremap <space>ef :CocCommand explorer --preset floating<CR>
nnoremap <space>ec :CocCommand explorer --preset cocConfig<CR>
nnoremap <space>eb :CocCommand explorer --preset buffer<CR>

" List all presets
nnoremap <space>el :CocList explPresets'

" configura a tecla leader
let mapleader = '='

" largura default de texto
set textwidth=65

" por default, usa numeração de linhas
set number

" trata o tab e a tabulação com espaços
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" toggle numeração de linhas
noremap <leader>m :set number!<Enter>

" faz backspace funcionar de forma mais intuituiva
set backspace=indent,eol,start

" habilita o uso do mouse
set mouse=a

" ativa o reconhecimento de sintaxe
syntax on

" configura auto indentação (e toggle)
set autoindent
nnoremap <leader>ai :set autoindent!<cr>
noremap <leader><Tab> :set autoindent!<Enter>
inoremap <leader><Tab> jk:set autoindent!<Enter>i

" formatação de parágrafo com <leader>-p
nnoremap <leader>p m9gqap`9
:inoremap <leader><leader>p :pdb:
setlocal formatoptions+=l " evita quebra de linhas longas


" configura o highlight do search
set hlsearch
hi Search ctermbg=226 ctermfg=black
nnoremap <leader>s :set hlsearch!<cr>

" macros/snippets estilo antigo (para debugging python)
let @c = 'Oimport code; code.interact(local=locals())'
let @i = 'Oimport pdb; pdb.set_trace()'
let @o = 'Oimport pudb; pu.db'
let @p = 'Ofrom remote_pdb import RemotePdb; RemotePdb("127.0.0.1", 4444).set_trace()jkddkP'

" suporte para clipboard do sistema (yank, paste, C-c C-v)
set clipboard=unnamedplus

" split de tela com keymaps similares aos do tmux
" (cuidado para não usar o mesmo prefixo que o tmux)
nmap <c-d>- :new<cr>
nmap <c-d>= :vnew<cr>

" desabilita relativenumber em buffers sem foco
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" função de apoio para abbrevs (ver :helpgrep Eatchar)
function! Eatchar(pat)
    let c = nr2char(getchar())
    return (c =~ a:pat) ? '' : c
endfunction


" caracteres especiais abreviados
"
" Usar Eatchar como abaixo, caso se deseje eliminar
" o espaço adicionado na expansão. Caso não se queira
" a expansão, ainda pode ser usado o <C-]>
" :iabbr <silent> :dsg: dalton<c-r>=Eatchar('\s')<cr>
abbreviate :<": “
abbreviate :">: ”
abbreviate :->: →
abbreviate :<-: ←
abbreviate :=>: ⇒
abbreviate :<=: ⇐
abbreviate :<->: ↔
abbreviate :<=>: ⇔
abbreviate :v: ✅
abbreviate :check: ✅
abbreviate :x: ×
abbreviate :X: ❌
abbreviate :sad: 😞
abbreviate :clap: 👏
abbreviate :think: 🤔
abbreviate :!=: ≠
abbreviate :ellipsis: …
abbreviate :...: …
abbreviate :---: —
abbreviate :dash: —
abbreviate :times: ×
abbreviate :<=: ≤
abbreviate :>=: ≥

" faz scroll do texto mantendo cursor na mesma posição
nnoremap <C-x> <C-e><Down>
nnoremap <C-Down> <C-y><Up>

" faz scroll quando o cursor chega a N linhas do limite
set scrolloff=3

" tratamento de linhas longas
" - usa soft breaks (não quebrar palavras no wrapping)
" - TODO: recolocar pra augroups: depende do tipo de texto
set nolist wrap linebreak
noremap <leader>w :set wrap!<Enter> <bar> :set linebreak<Enter> <bar> :set textwidth=0<Enter>
set breakindent
set showbreak=\ ❭\
set breakindent
set cpoptions+=n
set breakindentopt=shift:0,min:0,sbr " breakindentopt apropriado para texto

" faz setas funcionarem em insert mode com soft break/wrap
" (permite descer/subir em uma linha longa que é exibida em
" múltiplas linhas com wrap; se usar j ou k o cursor irá para
" a próxima linha real; esta configuração mantém os dois
" comportamentos: as setas movimentarão o cursor uma linha na
" tela, enquanto j e k movimentarão uma linha do buffer)
nnoremap <Down> gj
nnoremap <Up> gk

" configuração default de listas e bullets (list mode)
" (TODO: levar para augroups: depende do tipo de texto)
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set nolist
nnoremap <leader>l :set list!<cr>

" mostra parcialmente a última linha, caso não caiba
" (por default, se a última linha do buffer precisar ocupar
" mais linhas do que há disponível na tela, o vim exibirá
" um @ apenas no início da linha; esta configuração faz o
" vim exibir apenas as linhas que caibam)
set display+=lastline

" suporte a múltiplos buffers simultâneos
set hidden " permite mudar de buffers sem precisar gravar
set showtabline=2 " sempre mostra o tabline

" usar tab para mudar para o próximo tab
noremap <Tab> :bn<Enter>

" usar tab e Shift-Tab para alternar entre buffers abertos
noremap <S-Tab> :bp<Enter>


" configura statusline
set laststatus=2        " ativa o statusline
set statusline=%F       " path do arquivo
set statusline+=\       " separador
set statusline+=%y      " tipo de arquivo
set statusline+=\ %l    " linha atual
set statusline+=/       " separador
set statusline+=%L      " total de linhas
set statusline+=\ %c    " coluna atual

" ============================================
" Outros maps e abbrevs
" ============================================

" Para editar e ler rapidamente este arquivo
nnoremap <leader>[ :e $MYVIMRC<cr>
nnoremap <leader>] :source $MYVIMRC<cr>

" ============================================
" Autocommands
" ============================================

" markdown
augroup md
    " reinicia formatoptions ao valor default
    setlocal formatoptions=tcq

    " Permite formatar parágrafos automaticamente
"    setlocal formatoptions+=a

    " Permite formatar listas numeradas
    " (não usar com option '2'; pressupõe uso de autoindent)
    setlocal formatoptions+=n
augroup end

" clojure
augroup clj
    autocmd BufNewFile,BufRead *.clj setlocal nowrap
    autocmd BufNewFile,BufRead *.clj set textwidth=0
    autocmd BufNewFile,BufRead *.clj highlight clear OverLength
    autocmd BufNewFile,BufRead *.clj set tabstop=2
    autocmd BufNewFile,BufRead *.clj set softtabstop=2
    autocmd BufNewFile,BufRead *.clj set shiftwidth=2
augroup end

" html5
augroup html
    autocmd BufNewFile,BufRead *.html setlocal nowrap
    autocmd BufNewFile,BufRead *.html set textwidth=0
    autocmd BufNewFile,BufRead *.html highlight clear OverLength
    "autocmd FileType html,css EmmetInstall
    autocmd BufNewFile,BufRead *.html set tabstop=2
    autocmd BufNewFile,BufRead *.html set softtabstop=2
    autocmd BufNewFile,BufRead *.html set shiftwidth=2
"    autocmd BufNewFile,BufRead *.html inoreabbrev div <div></div><Esc>5hi<C-R>=Eatchar('\s')<CR>
"    autocmd BufNewFile,BufRead *.html inoreabbrev html <html></html><Esc>6hi<cr><cr>k<C-R>=Eatchar('\s')<CR>
"    autocmd BufNewFile,BufRead *.html inoreabbrev head <head></head><Esc>6hi<C-R>=Eatchar('\s')<CR>
"    autocmd BufNewFile,BufRead *.html inoreabbrev body <body></body><Esc>6hi<C-R>=Eatchar('\s')<CR>
"    autocmd BufNewFile,BufRead *.html inoreabbrev p <p></p><Esc>6hi<C-R>=Eatchar('\s')<CR>
augroup end

" javascript
augroup js
    autocmd BufNewFile,BufRead *.js setlocal nowrap
    autocmd BufNewFile,BufRead *.js set textwidth=0
    autocmd BufNewFile,BufRead *.js highlight clear OverLength
    autocmd BufNewFile,BufRead *.js set tabstop=4
    autocmd BufNewFile,BufRead *.js set softtabstop=4
    autocmd BufNewFile,BufRead *.js set shiftwidth=4
augroup end

" python
augroup py
    autocmd BufNewFile,BufRead *.py :highlight Comment ctermfg=Green
    autocmd BufNewFile,BufRead *.py setlocal nowrap
    autocmd BufNewFile,BufRead *.py set textwidth=0
    "autocmd BufNewFile,BufRead *.py highlight clear OverLength
    "autocmd BufNewFile,BufRead *.py match OverLength /\%120v.*/
    autocmd BufNewFile,BufRead *.py set tabstop=4
    autocmd BufNewFile,BufRead *.py set softtabstop=4
    autocmd BufNewFile,BufRead *.py set shiftwidth=4
    autocmd BufNewFile,BufRead *.py set wrap
    autocmd BufNewFile,BufRead *.py set linebreak
    autocmd BufNewFile,BufRead *.py set textwidth=0
    autocmd BufNewFile,BufRead *.py set breakindentopt=shift:6,min:40,sbr
    autocmd BufNewFile,BufRead *.py syntax match pyOperator "<=" conceal cchar=M
    autocmd BufNewFile,BufRead *.py set breakindentopt=shift:10,min:0,sbr
augroup end

function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()

" =====================
" Configurações Visuais
" =====================

" cores do texto e fundo principais
highlight Normal ctermfg=white ctermbg=233

" cores da numeração de linhas
highlight LineNr ctermfg=237 ctermbg=234

" cores do tabline e do statusline
hi TabLineSel   cterm=bold,reverse  ctermbg=255         ctermfg=DarkBlue
hi TabLine      cterm=reverse       ctermbg=255         ctermfg=DarkBlue
hi TabLineFill  cterm=reverse       ctermbg=None        ctermfg=DarkBlue
hi StatusLine   cterm=bold,reverse  ctermbg=255         ctermfg=DarkBlue

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
 inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" esquema geral de cores
set termguicolors
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight
