" Don't set nocompatible! (https://www.reddit.com/r/vim/wiki/vimrctips)
" Had to re-enable it since today I got a load full of E10 errors on startup: https://stackoverflow.com/a/18371495/1490536
set nocompatible 

let g:ale_completion_enabled = 1

" Plugins via vim-plug
call plug#begin()

" Syntax
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'vim-scripts/gtk-vim-syntax'
Plug 'RRethy/vim-hexokinase'
Plug 'plasticboy/vim-markdown'
Plug 'arrufat/vala.vim'
Plug 'maxbane/vim-asm_ca65'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'


" Plugins
Plug 'tpope/vim-fugitive' 		" git
Plug 'tpope/vim-obsession' 		" Sessions
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-capslock' 		" Use <C-l> to toggle software capslock mode
Plug 'tpope/vim-jdaddy'  		" JSON as text object (aj)
Plug 'tpope/vim-eunuch' 		" Move, Cfind, Clocate …
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dadbod'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'andymass/vim-matchup'
" Plug 'noahfrederick/vim-skeleton'


" Auto completion
Plug 'ajh17/vimcompletesme'
" Supertab allows use of tab for both autocomletion and snippets exapansion
Plug 'ervandew/supertab'
Plug 'tomtom/tcomment_vim'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'vim-php/tagbar-phpctags.vim'
Plug 'joonty/vdebug'
"Plug 'Yilin-Yang/vim-markbar'
Plug 'vim-scripts/PDV--phpDocumentor-for-Vim'


" Documentation, Help and Manuals
"Plug 'dbeniamine/cheat.sh-vim' 		" <Leader>KK to search for an answer to the question under the cursor
Plug 'rhysd/devdocs.vim'
Plug 'hobbestigrou/vimtips-fortune'
Plug 'sjb/devhelp.vim'


" Colorschemes
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'jnurmine/zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'fenetikm/falcon'
Plug 'nightsense/carbonized'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/wombat'
Plug 'cocopon/iceberg.vim'

call plug#end()


filetype plugin indent on 	" filetype detection[ON] plugin[ON] indent[OFF]
syntax enable 				" enable syntax highlighting (previously syntax on).



" theme configuration
set t_Co=256             " enable 256-color mode.
set background=dark
set termguicolors
"colorscheme zenburn

let s:uname = system("uname")
if s:uname != "Darwin\n"
	" set termguicolors
	" Make true color work inside tmux
	" (https://www.reddit.com/r/vim/comments/5416d0/true_colors_in_vim_under_tmux/)
	" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	" let g:quantum_italics=1
	" let g:airline_theme='quantum'
endif
colorscheme iceberg

" Search down into subfolders
set path+=**
" Display all mtching files when we tab complete
set wildmenu

set nofoldenable 			" disable folding
set number

" Sane font for GVim / MacVim
" set guifont=SourceCodePro-Regular:h14

" Relative (hybrid) line numbers
" set number relativenumber
" augroup numbertoggle
" 	autocmd!
" 	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" 	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
" augroup END


" SETTINGS

set hidden 				  " allows to change bufferfs even if there are unsaved changes
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ruler                 " Always show info along bottom.
" Tab / Indentation stuff (We want only Tabs)
" set smartindent            " like auto-indent, but adds indentation level...
set autoindent
set previewheight=30
set textwidth=80 			" text width to hard-fold (gq)

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

" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start

" Allow project specific .vimrc config files
set exrc
set secure

set backspace=indent,eol,start


" Run shell commands as interactive shell (Read .bashrc, use aliases etc.)
" set shellcmdflag=-ic
" Better (https://superuser.com/a/646268/111493):
let $BASH_ENV = "~/.bash_aliases"

set foldmethod=manual


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


" Open entries of quick fix list in new tab
" set switchbuf+=usetab,newtab

au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.s set filetype=asm_ca65


" Mappings
let mapleader=' '

nnoremap <Leader>g :Gstatus<CR>
nnoremap <Leader>e :Lexplore<CR>
nnoremap <leader>m :!make<CR>
nnoremap <Leader>l :ls<CR>
" Reload a current browser-sync'ed tab
nnoremap <Leader>r :!curl -Lks https://localhost:3000/__browser_sync__?method=reload<CR><CR>

" fzf shortcuts
nnoremap <Leader>f :GFiles<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <C-P> :Files<CR>

" (Re-)run gulp in right pane
nnoremap <Leader>p :!tmux send-keys -t 2 C-c C-m 'gulp' C-m<CR><CR>

" List buffer and ready to select
nnoremap <Leader>b :Buffer<CR>
map <Leader>w <Plug>ToggleMarkbar

" Toggle Tagbar
nmap <F8> :TagbarToggle<CR>

" vim-unimpaired handles this with ]l, [l already!!
" nnoremap <Leader>a :ALENext<CR>
" nnoremap <Leader>A :ALEPrev<CR>


set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P


" netrw
" https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0			" Disable banner of netrw
let g:netrw_liststyle = 3 		" Tree view
let g:netrw_winsize = -40 		" Window size

set errorformat^=%f:%l.%c-%[%^:]%#:\ warning:\ %m

set diffopt=vertical " Always vertical diffs

iabbrev </ </<C-X><C-O>

" Subdirectory names to look for snippets below any path defined
" in runtimepath
let g:UltiSnipsSnippetDirectories = [ 'UltiSnips', 'mysnippets' ]


" ALE Options
let g:ale_linters = {	'javascript':['prettier'], 'sass': ['stylelint'], 'css': ['stylelint'], 'sh': ['shellcheck']}
let g:ale_fixers =  {	'javascript':['prettier'], 'sass': ['stylelint'], 'scss': ['stylelint']}
let g:ale_sign_column_always = 1
let g:ale_sign_error = '-x'
let g:ale_sign_warning = '-!'
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
nnoremap <Leader>f :ALEFix<CR>
" set omnifunc=ale#completion#OmniFunc


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
\}


nnoremap <leader>m :!make<CR>
" Override any filetype settings concerning tabs
" https://www.reddit.com/r/vim/comments/7g4afp/using_tabs_only/
augroup my_indent_options
	autocmd!
	autocmd FileType * setlocal noexpandtab
	autocmd FileType * setlocal shiftwidth=4
augroup END

" Map K to devdocs for certain file types
augroup plugin=devdocs
	autocmd!
	autocmd FileType php,scss,css,html,tpl,ctp,js nmap <buffer>K <Plug>(devdocs-under-cursor)
augroup END
" Disable vim tips ("fortunes") fot the time being...
let g:fortune_vimtips_auto_display = 0

" Set a positive text width on text-based file types (txt, markdown...)
" and enable auto wrap
set formatoptions-=t
augroup text_wrap
	autocmd!
	autocmd FileType txt,markdown, setlocal textwidth=70
	autocmd FileType txt,markdown, setlocal formatoptions+=t
augroup END


nnoremap <leader>d ^i[✓] <Esc>df]
nnoremap <leader>D ^i[ ] <Esc>df]

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

let g:easytags_cmd = '~/.vim/plugged/tagbar-phpctags.vim/build/phpctags-0.5.1/phpctags'
let g:easytags_autorecures = 1
let g:easytags_async = 1

" Helper for diff via FTP / Filezilla
nnoremap <Leader>v :vertical diffsplit ~/Sites/

nnoremap ,doc :-1read $HOME/.vim/snippets/doc<CR>j$"%p3jA
nnoremap ,html :-1read $HOME/.vim/snippets/html<CR>5jcit
nnoremap ,ctl :new<CR>:-1read /home/hannenz/.vim/snippets/cmt_controller.php<CR>
nnoremap ,mdl :new<CR>:-1read /home/hannenz/.vim/snippets/cmt_model.php<CR>
nnoremap <Leader>v :vsplit<CR>

nnoremap <Leader><Leader> :Buffer<CR>
