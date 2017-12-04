set nocompatible          " get rid of Vi compatibility mode. SET FIRST!

" Plugins via vim-plug
call plug#begin()
" Syntax
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'vim-scripts/gtk-vim-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'gorodinskiy/vim-coloresque'
Plug 'plasticboy/vim-markdown'

" Plugins
Plug 'tpope/vim-fugitive'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/Tabmerge'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'justinmk/vim-sneak'
Plug 'tomtom/tcomment_vim'
Plug 'ajh17/vimcompletesme'
Plug 'w0rp/ale'
Plug 'maxbane/vim-asm_ca65'

" Colorschemes
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'jnurmine/zenburn'
Plug 'altercation/vim-colors-solarized'
call plug#end()

filetype plugin on		  " filetype detection[ON] plugin[ON] indent[OFF]
syntax enable             " enable syntax highlighting (previously syntax on).

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

" Relative (hybrid) line numbers
set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ruler                 " Always show info along bottom.
" Tab / Indentation stuff (We want only Tabs)
set smartindent            " like auto-indent, but adds indentation level...
set tabstop=4             " tab spacing
set shiftwidth=4          " indent/outdent by 4 columns
set noexpandtab
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

set splitright
set splitbelow
 
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" ok, sometimes, it's just useful...
set mouse=a

" Run shell commands as interactive shell (Read .bashrc, use aliases etc.)
" set shellcmdflag=-ic
" Better (https://superuser.com/a/646268/111493):
let $BASH_ENV = "~/.bash_aliases"

" 'Bubble' lines/blocks up/down (like sublime text) // needs a better mapping
" though !!
nmap <PageUp> ddkP
nmap <PageDown> ddp
vmap <PageUp> xkP`[V`]
vmap <PageDown> xp`[V`]

" netrw
" https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0		" Disable banner of netrw

" Faster Schift+O, see https://github.com/vim/vim/issues/24
set timeout timeoutlen=5000 ttimeoutlen=100

" Allow project specific .vimrc config files
set exrc
set secure

" Buffer list navigation
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> [c :cprevious<CR>
nnoremap <silent> ]c :cnext<CR>
nnoremap <silent> [C :cfirst<CR>
nnoremap <silent> ]C :clast<CR>

" set errorformat^=%-G%f:%l:\ warning:%m
" set errorformat^=%f:%l.%c-%v.%n:\ warning:%m
set errorformat^=%f:%l.%c-%[%^:]%#:\ warning:\ %m

" Ignore files, also respected by ctrlp
set wildignore+=*/.git/*,*/node_modules/*,*/build/*,*/dist/*
" Allow more results in CtrlP
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'
" Make CtrlP open in new tab by default
" let g:ctrlp_prompt_mappin
" 	\'AcceptSelection("e")': ['<c-t>'],
" 	\'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>']
" 	\}



" Dont descend in submodules
let g:ctrlp_working_path_mode = 'rw'


au BufRead,BufNewFile *.scss set filetype=sass

" Open entries of quick fix list in new tab
" set switchbuf+=usetab,newtab

au BufRead,BufNewFile *.scss set filetype=sass shiftwidth=4 tabstop=4
nnoremap <Leader>g :Gstatus<CR>
nnoremap <Leader>e :Expl<CR>
nnoremap <leader>m :!make<CR>
nnoremap <Leader>l :ls<CR>

" fzf shortcuts
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>l :Lines<CR>

" (Re-)run gulp in right pane
nnoremap <Leader>p :!tmux send-keys -t 2 C-c C-m 'gulp' C-m<CR><CR>



iabbrev </ </<C-X><C-O>

let g:UltiSnipsExpandTrigger = '<f5>'
set autoindent
set previewheight=30

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

" ALE Options
let g:ale_linters = {	'javascript':['prettier'], 'sass': ['stylelint']}
let g:ale_fixers =  {	'javascript':['prettier'], 'sass': ['stylelint']}

