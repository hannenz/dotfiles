" Don't set nocompatible! (https://www.reddit.com/r/vim/wiki/vimrctips)
" Had to re-enable it since today I got a load full of E10 errors on startup: https://stackoverflow.com/a/18371495/1490536
set nocompatible 

" Plugins via vim-plug
call plug#begin()

" Syntax
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'vim-scripts/gtk-vim-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'gorodinskiy/vim-coloresque'
Plug 'plasticboy/vim-markdown'
Plug 'arrufat/vala.vim'

" Plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-eunuch'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'vim-scripts/Tabmerge'
" UltiSnips and Snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
" Auto completion
Plug 'ajh17/vimcompletesme'
" Supertab allows use of tab for both autocomletion and snippets exapansion
Plug 'ervandew/supertab'
Plug 'tomtom/tcomment_vim'
Plug 'justinmk/vim-sneak'
Plug 'w0rp/ale'
Plug 'maxbane/vim-asm_ca65'
Plug 'majutsushi/tagbar'
Plug 'joonty/vdebug'
" Colorschemes
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'jnurmine/zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'fenetikm/falcon'

" Other
Plug 'hobbestigrou/vimtips-fortune'
call plug#end()


filetype plugin indent on 	" filetype detection[ON] plugin[ON] indent[OFF]
syntax enable 				" enable syntax highlighting (previously syntax on).



" theme configuration
"set t_Co=256             " enable 256-color mode.
set background=dark
"colorscheme zenburn
set termguicolors         
" Make true color work inside tmux
" (https://www.reddit.com/r/vim/comments/5416d0/true_colors_in_vim_under_tmux/)
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"let g:quantum_italics=1
let g:airline_theme='quantum'
colorscheme quantum        " set colorscheme


set number

" Relative (hybrid) line numbers
" set number relativenumber
" augroup numbertoggle
" 	autocmd!
" 	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" 	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
" augroup END



" SETTINGS

set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ruler                 " Always show info along bottom.
" Tab / Indentation stuff (We want only Tabs)
" set smartindent            " like auto-indent, but adds indentation level...
set autoindent
set previewheight=30

" From https://www.reddit.com/r/vim/wiki/tabstop
" set tabstop=8             " tab spacing
" set softtabstop=4
" set shiftwidth=4          " indent/outdent by 4 columns
" set expandtab

" To use tabs uncomment this
set tabstop=4
set noexpandtab
set shiftwidth=4

" set copyindent
" set preserveindent
"set softtabstop=4         " unify
" set shiftround            " always indent/outdent to the nearest tabstop
"set smarttab              " use tabs at the start of a line, spaces elsewhere

set ignorecase			  " ignorecase must be set for smartcase to work -- wtf?
set smartcase             " smartcase in search: case sensitive as soon as a capital letter is in the query
set nowrap                " don't wrap text
set wildmode=longest,list " Tab-completion like in bash
set cursorline            " highlight current line
"hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE

set lazyredraw 				" Don't redraw the screen when executing macros etc.

set splitright
set splitbelow
 
" from tpope's vim-sensible
set autoread 				" Re-read file if it has been edited outside vim and not inside
set scrolloff=1 			" Keep at least 1 line visible at top/bottom when scrolling
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

set mouse=a 	" ok, sometimes, it's just useful...

" Faster Schift+O, see https://github.com/vim/vim/issues/24
set timeout timeoutlen=5000 ttimeoutlen=100

" Allow project specific .vimrc config files
set exrc
set secure


let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"



" Run shell commands as interactive shell (Read .bashrc, use aliases etc.)
" set shellcmdflag=-ic
" Better (https://superuser.com/a/646268/111493):
let $BASH_ENV = "~/.bash_aliases"



" Key mappings

" map 'jj' to ESC (exit insert mode)
imap jj <Esc>
" Insert blank line in normal mode
map <C-k> O<ESC>
" Pair it with Ctrl-k to delete a line (convenience for dd)
map <C-j> "_dd
" Save with C-s
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

" Buffer list navigation
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> [c :cprevious<CR>
nnoremap <silent> ]c :cnext<CR>
nnoremap <silent> [C :cfirst<CR>
nnoremap <silent> ]C :clast<CR>

" 'Bubble' lines/blocks up/down (like sublime text) // needs a better mapping
" though !!
nmap <PageUp> ddkP
nmap <PageDown> ddp
vmap <PageUp> xkP`[V`]
vmap <PageDown> xp`[V`]

" Open entries of quick fix list in new tab
" set switchbuf+=usetab,newtab

au BufRead,BufNewFile *.scss set filetype=sass
au BufRead,BufNewFile *.s set filetype=asm_ca65


" Mappings
let mapleader=' '

nnoremap <Leader>g :Gstatus<CR>
nnoremap <Leader>e :Expl<CR>
nnoremap <leader>m :!make<CR>
nnoremap <Leader>l :ls<CR>
" Reload a current browser-sync'ed tab
nnoremap <Leader>r :!curl https://localhost:3000/__browser_sync__?method=reload<CR><CR>

" fzf shortcuts
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <silent> <C-p> :Files<CR>

" (Re-)run gulp in right pane
nnoremap <Leader>p :!tmux send-keys -t 2 C-c C-m 'gulp' C-m<CR><CR>

" List buffer and ready to select
nnoremap <Leader>b :Buffer<CR>

" Toggle Tagbar
nmap <F8> :TagbarToggle<CR>

nnoremap <Leader>a :ALENext<CR>





" netrw
" https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0		" Disable banner of netrw


set errorformat^=%f:%l.%c-%[%^:]%#:\ warning:\ %m

" Ignore files, also respected by ctrlp
" set wildignore+=*/.git/*,*/node_modules/*,*/build/*,*/dist/*

au BufRead,BufNewFile *.scss set filetype=sass

iabbrev </ </<C-X><C-O>

" Subdirectory names to look for snippets below any path defined
" in runtimepath
let g:UltiSnipsSnippetDirectories = [ "UltiSnips", "mysnippets"]

" ALE Options
let g:ale_linters = {	'javascript':['prettier'], 'sass': ['stylelint'], 'bash': ['shell -n']}
let g:ale_fixers =  {	'javascript':['prettier'], 'sass': ['stylelint']}
let g:ale_sign_column_always = 1
let g:ale_sign_error = '-x'
let g:ale_sign_warning = '-!'



function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
silent %</
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()


function! DoShrug()
	 return "<Esc>a¯\_(ツ)_/¯<Esc>"
endfunction
command! Shrug call DoShrug()

" Some stuff from https://kinbiko.com/vim/my-shiniest-vim-gems/

" Sane line joins
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

" highlight ugly code
match ErrorMsg '\%>120v.\+'
match ErrorMsg '\s\+$'


" Use ag over grep
if executable ('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif

" Vdebug options (remote debugging with xdebug)
let g:vdebug_options = { 
            \ "path_maps" : {"/var/www/html": "/home/hannenz/html"},
            \ "break_on_open": 0
\}

nnoremap <leader>m :!make<CR>
" Override any filetype settings concerning tabs
" https://www.reddit.com/r/vim/comments/7g4afp/using_tabs_only/
augroup my_indent_options
	autocmd!
	autocmd FileType * setlocal noexpandtab
	autocmd FileType * setlocal shiftwidth=4
augroup END

" Disable vim tips ("fortunes") fot the time being...
let g:fortune_vimtips_auto_display = 0


