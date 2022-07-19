" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

     " For Powerline on Vim
     Plug 'powerline/powerline'
	 Plug 'powerline/powerline-fonts'
     
	 " Black Code Formater
	 Plug 'ambv/black'
     Plug 'elzr/vim-json'

	 Plug 'frazrepo/vim-rainbow'

	"Anfular 
	 Plug 'iamcco/coc-angular'

	"Coc CSS
	 Plug 'neoclide/coc-css'
 
	 Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
	  
	 " VimStatus  Line
     Plug 'vim-airline/vim-airline'
     Plug 'vim-airline/vim-airline-themes'
     
     " Monokai Theme && ColorSchemes
	 Plug 'sickill/vim-monokai'
	 Plug 'ful1e5/onedark.nvim'
     Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme

     " File and folder management
     Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
     Plug 'junegunn/fzf.vim'
     Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
     Plug 'preservim/nerdtree'
     Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	 Plug 'jistr/vim-nerdtree-tabs'
	 Plug 'majutsushi/tagbar'

	 " Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons

     " Snippets
     Plug 'SirVer/ultisnips'
     Plug 'honza/vim-snippets'
     Plug 'natebosch/dartlang-snippets'

     " Language support
     Plug 'tpope/vim-projectionist'
     Plug 'neoclide/coc.nvim', {'branch': 'release'}
     Plug 'jiangmiao/auto-pairs'

     " Dart
     Plug 'dart-lang/dart-vim-plugin'

     " Typescript
     Plug 'ianks/vim-tsx'
     Plug 'leafgarland/typescript-vim'


     Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
     Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview


     " Git
     Plug 'tpope/vim-fugitive'
     Plug 'vim-airline/vim-airline'
     Plug 'airblade/vim-gitgutter'
     Plug 'Xuyuanp/nerdtree-git-plugin'
	 Plug 'tveskag/nvim-blame-line'

    " Example Plug Syntax
     Plug 'https://github.com/junegunn/vim-github-dashboard.git'
	 " For GitHub repositories, you can just mention the username and repository
     Plug 'junegunn/vim-easy-align'

     " Theme
     Plug 'morhetz/gruvbox'

call plug#end()

" Don't add sounds for errors
set noerrorbells 
set number
set nowrap
set nohlsearch
set smartcase
set noswapfile
set nobackup

set mouse=a

set undofile
set incsearch
set tabstop=4
set smarttab
set softtabstop=4 "noexpandtab
set shiftwidth=2
set colorcolumn=120
set clipboard=unnamedplus
set backspace=indent,eol,start
highlight ColorColumn ctermbg=0 guibg=lightgrey

set relativenumber
set number
set laststatus=2
set fileformat=unix
syntax enable
colorscheme onedark

" RainBow Brackets global 
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']


let mapleader=" "
nnoremap <leader>fe :CocCommand flutter.emulators <CR>
nnoremap <leader>fd :below new output:///flutter-dev <CR>

map <leader>h :wincmd h <CR>
map <leader>j :wincmd j <CR>
map <leader>k :wincmd k <CR>
map <leader>l :wincmd l <CR>


nnoremap <C-b> :NERDTreeToggle<CR>
" nnoremap <C-S-b> :NERDTreeFind<CR>

let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 120']

" Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <C-P> :FZF<CR>

nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>

imap <tab> <Plug>(coc-snippets-expand)
let g:UltiSnipsExpandTrigger = '<Nop>'
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-flutter',
  \ 'coc-snippets',
  \ 'coc-yaml',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ ]

let g:NERDTreeGitStatusWithFlags = 1

" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================

" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark' "change airline_theme
let g:onedark_termcolors=256

" lightline
set noshowmode
let g:lightline = { 'colorscheme': 'onedark' }


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀ '
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'



" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'


" wrap toggle
setlocal nowrap
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
        silent! nunmap <buffer> <Up>
        silent! nunmap <buffer> <Down>
        silent! nunmap <buffer> <Home>
        silent! nunmap <buffer> <End>
        silent! iunmap <buffer> <Up>
        silent! iunmap <buffer> <Down>
        silent! iunmap <buffer> <Home>
        silent! iunmap <buffer> <End>
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        setlocal display+=lastline
        noremap  <buffer> <silent> <Up>   gk
        noremap  <buffer> <silent> <Down> gj
        noremap  <buffer> <silent> <Home> g<Home>
        noremap  <buffer> <silent> <End>  g<End>
        inoremap <buffer> <silent> <Up>   <C-o>gk
        inoremap <buffer> <silent> <Down> <C-o>gj
        inoremap <buffer> <silent> <Home> <C-o>g<Home>
        inoremap <buffer> <silent> <End>  <C-o>g<End>
    endif
endfunction

" move through split windows
nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>

" move through buffers
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bp<bar>bd#<CR>

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" file browser
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
map <leader>n :call NERDTreeToggle()<CR>
function NERDTreeToggle()
    NERDTreeTabsToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
    endif
endfunction

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()


" ale
map <C-e> <Plug>(ale_next_wrap)
map <C-r> <Plug>(ale_previous_wrap)

" tags
map <leader>t :TagbarToggle<CR>

" copy, cut and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa


autocmd BufEnter * EnableBlameLine

