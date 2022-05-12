" Don't set nocompatible! (https://www.reddit.com/r/vim/wiki/vimrctips)
" Had to re-enable it since today I got a load full of E10 errors on startup: https://stackoverflow.com/a/18371495/1490536
" set nocompatible 

function! WhichOS() abort
	return toupper(substitute(system('uname'), '\n', '', ''))
endfunction


" Plugins via vim-plug
call plug#begin()

" Syntax
Plug 'othree/html5.vim', { 'for': ['html', 'tpl']}
Plug 'cakebaker/scss-syntax.vim', { 'for': ['css', 'scss']}
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss']}
Plug 'vim-scripts/gtk-vim-syntax', { 'for': ['c']}
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase', 'for': ['css', 'scss'] }
Plug 'plasticboy/vim-markdown', { 'for': ['markdown']}
Plug 'arrufat/vala.vim', {'for': ['vala']}
Plug 'maxbane/vim-asm_ca65'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript', {'for': ['javascript']}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'posva/vim-vue'

" Plugins
Plug 'tpope/vim-fugitive' 		" git
Plug 'mhinz/vim-signify'
Plug 'rhysd/git-messenger.vim' 	" git message history for given line

Plug 'tpope/vim-obsession' 		" Sessions

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'tpope/vim-capslock' 		" Use <C-l> to toggle software capslock mode
Plug 'tpope/vim-eunuch' 		" Move, Cfind, Clocate …

Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'vimwiki/vimwiki'

Plug 'ptzz/lf.vim' 				" lf file manager integration
Plug 'voldikss/vim-floaterm'	" Dependency for lf file manager

" Plug 'tpope/vim-vinegar' 		" netrc enhancement (do I really need it??)

Plug 'tpope/vim-abolish' 		" Coerce cases (e.g. transform snake_case to camelCase etc; the plugin has other functions too)

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'junegunn/vim-peekaboo' 	" Preview for registers when pasting

Plug 'xolox/vim-misc'

Plug 'sirver/ultisnips' 		" Snippets
Plug 'honza/vim-snippets'

Plug 'andymass/vim-matchup'
Plug 'joonty/vdebug'
Plug 'vim-scripts/CSSMinister'
Plug 'h3xx/vim-expand-region'

Plug 'qpkorr/vim-bufkill'
let g:BufKillCreateMappings = 0

" Plug 'ajh17/vimcompletesme'
" Plug 'ervandew/supertab' 		" Supertab allows use of tab for both autocomletion and snippets exapansion
Plug 'tomtom/tcomment_vim'
" Plug 'w0rp/ale'
Plug 'inkarkat/vim-ingo-library'
Plug 'vim-scripts/html_FileCompletion'

" Documentation, Help and Manuals
Plug 'rhysd/devdocs.vim'
Plug 'sjb/devhelp.vim'
Plug 'vim-scripts/PDV--phpDocumentor-for-Vim', {'for': ['php']}

" Damian Conway plugins
Plug 'nixon/vim-vmath'
vmap <expr> ++ VMATH_YankAndAnalyse()
nmap ++ vip++
" Plug 'atweiden/vim-hudigraphs'
" inoremap <expr>  <C-K>   HUDG_GetDigraph()


" Vista
function NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_default_executive = 'coc'
nnoremap <Leader>t :Vista finder<CR>
nnoremap <Leader>T :Vista!!<CR>
set tabpagemax=100

Plug 'itchyny/lightline.vim'
" Lightline configuration
let g:lightline = {
		\ 'colorscheme': 'ThemerVimLightline',
		\ 'active': {
		\ 	'left': [ 	[ 'mode', 'paste' ],
		\ 				['gitbranch', 'readonly', 'filename', 'modified', 'method' ]	],
		\ 	},
		\ 	'component_function': {
		\ 		'gitbranch': 'FugitiveHead',
		\ 		'filename': 'LightlineFilename',
		\ 		'method': 'NearestMethodOrFunction'
		\ 	}
		\}

" Colorschemes
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'rakr/vim-one'
Plug 'Siphalor/vim-atomified'
Plug 'jnurmine/zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'fenetikm/falcon'
Plug 'nightsense/carbonized'
Plug 'arcticicestudio/nord-vim'
" Plug 'vim-scripts/wombat'
Plug 'cocopon/iceberg.vim'
Plug 'morhetz/gruvbox'

" Disabled
" Plug 'psliwka/vim-smoothie'
Plug 'majutsushi/tagbar'
" Plug 'vim-php/tagbar-phpctags.vim' Not maintained anymore 2020-11-02
" Plug 'dbeniamine/cheat.sh-vim' 		" <Leader>KK to search for an answer to the question under the cursor
call plug#end()

" Coc extensions to install
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-clangd', 'coc-phpls', 'coc-tsserver', 'coc-rls', 'coc-html', 'coc-sh']

filetype plugin indent on 	" filetype detection[ON] plugin[ON] indent[OFF]
syntax enable 				" enable syntax highlighting (previously syntax on).


" Theme Configuration
" set t_Co=256             " enable 256-color mode.
set termguicolors

" Colorscheme One
" colorscheme gruvbox


set background=dark 		" must come after colorscheme!
let darkstyle=system('gsettings get io.elementary.terminal.settings prefer-dark-style')
if trim(darkstyle) == 'false'
	set background=light
endif	
colorscheme one

let g:one_allow_italics = 1
highlight Comment cterm=italic
set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum
" End colorscheme One


" Search down into subfolders
set path+=**
" Display all mtching files when we tab complete
set wildmenu

set nofoldenable 			" disable folding
set number


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

" To use tabs uncomment this
set tabstop=4
set noexpandtab
set shiftwidth=4

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

" Don't add a newline at end of file (PHP!!)
set nofixendofline

" Faster Schift+O, see https://github.com/vim/vim/issues/24
set timeout timeoutlen=5000 ttimeoutlen=100

" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start

" Allow project specific .vimrc config files
set exrc
set secure

set foldmethod=manual

set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

" Make ctrl-u and ctrl-w in insert mode undu-able (when invoked accidentally)
" from: https://vim.fandom.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Autocommands / Filetypes ...

au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.s set filetype=asm_ca65
au BufRead,BufNewFile *.tpl set filetype=html
au BufRead,BufNewFile *.mjml set filetype=html

" Override any filetype settings concerning tabs
" https://www.reddit.com/r/vim/comments/7g4afp/using_tabs_only/
augroup my_indent_options
	autocmd!
	autocmd FileType * setlocal noexpandtab
	autocmd FileType * setlocal shiftwidth=4
augroup END


" Set a positive text width on text-based file types (txt, markdown...)
" and enable auto wrap
set formatoptions-=t
augroup text_wrap
	autocmd!
	autocmd FileType txt,markdown, setlocal textwidth=70
	autocmd FileType txt,markdown, setlocal formatoptions+=tn
	" Recognise [ ] and friends as list (for formatting with gqq etc)
	autocmd FileType txt,markdown setlocal formatlistpat+=\\\|^\\s*\\[.\\]\\s\\+
augroup END

augroup my_markdown
    autocmd!
    autocmd FileType markdown nnoremap <F9> :<c-u>silent call system('pandoc -f markdown -t html -s -c '.expand('%:p:r:S').'.css -o '.expand('%:p:r:S').'.html '.expand('%:p:S'))<cr>
augroup END

" Compile MJML
augroup mjml
	autocmd!
	autocmd BufWritePost *.mjml !mjml --config.validationLevel=strict -o %:r.html %
	autocmd BufRead,BufNewFile *.mjml nnoremap <F9> :!mjml --config.validationLevel=strict % -s \| neomutt -e "set content_type=text/html" -s "TEST E-Mail" j.braun@agentur-halma.de
augroup END

" Run shell commands as interactive shell (Read .bashrc, use aliases etc.)
" set shellcmdflag=-ic
" Better (https://superuser.com/a/646268/111493):
let $BASH_ENV = "~/.bash_aliases"

" Key mappings

let mapleader=' '

" map 'jj' to ESC (exit insert mode)
imap jj <Esc>
imap kj <Esc>

" Save with C-s
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

nnoremap <Leader>g :Git<CR>
" nnoremap <Leader>e :Lexplore<CR>
nnoremap <leader>m :!make<CR>

" fzf settings
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_history_dir = '~/.local/share/fzf-history'

" fzf shortcuts
" nnoremap <Leader>f :GFiles<CR>
" nnoremap <Leader>l :Lines<CR>
" nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <C-P> :GFiles<CR>
nnoremap <silent> <Leader>p :GFiles<CR>
nnoremap <silent> <Leader>f :Files<CR>
" List buffer and ready to select
nnoremap <Leader>b :Buffer<CR>



" Underline current line
nnoremap <Leader>u yyp^v$r-

" Tagbar
nmap <F8> :TagbarToggle<CR>
" let g:tagbar_left = 1
let g:tagbar_position = 'botright vertical'
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1

" vim-unimpaired handles this with ]l, [l already!!
" nnoremap <Leader>a :ALENext<CR>
" nnoremap <Leader>A :ALEPrev<CR>


" netrw
" https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0			" Disable banner of netrw
let g:netrw_liststyle = 3 		" Tree view
let g:netrw_winsize = -40 		" Window size

" netrw vinegar enhancements:
" Hide dotfiles (toggle with gh)
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'


set errorformat^=%f:%l.%c-%[%^:]%#:\ warning:\ %m

set diffopt=filler,vertical
set diffopt+=internal

iabbrev </ </<C-X><C-O>

" Subdirectory names to look for snippets below any path defined
" in runtimepath
let g:UltiSnipsSnippetDirectories = [ 'UltiSnips', 'mysnippets' ]

" ALE Options
let g:ale_completion_enabled = 1
let g:ale_css_stylelint_use_global = 0
let g:ale_css_stylelint_executable = ''
let g:ale_css_stylelint_options = '--config=~/.stylelintrc.json'
let g:ale_linters = {	'javascript':['prettier'], 'sass': ['stylelint'], 'css': ['stylelint'], 'sh': ['shellcheck']}
let g:ale_fixers =  {	'javascript':['prettier'], 'sass': ['stylelint'], 'scss': ['stylelint']}
let g:ale_linters = {	'javascript':['prettier'], 'scss': ['stylelint'], 'css': ['stylelint'], 'sh': ['shellcheck']}
let g:ale_fixers =  {	'javascript':['prettier'], 'scss': ['stylelint']}
let g:ale_sign_column_always = 1
let g:ale_sign_error = '-x'
let g:ale_sign_warning = '-!'
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
" nnoremap <Leader>f :ALEFix<CR>


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
\ 		'break_on_open' : 0
\} 

" Disable vim tips ("fortunes") fot the time being...
let g:fortune_vimtips_auto_display = 0

nnoremap <leader>d ^i[✓] <Esc>df]
nnoremap <leader>D ^i[ ] <Esc>df]

" Move visual block
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
" inoremap <c-j> <ESC>:m .+1<CR>==gi
" inoremap <c-k> <ESC>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" let g:easytags_cmd = '~/.vim/plugged/tagbar-phpctags.vim/build/phpctags-0.5.1/phpctags'
" let g:easytags_autorecures = 1
" let g:easytags_async = 1

" Helper for diff via FTP / Filezilla
nnoremap <Leader>v :vertical diffsplit ~/Sites/
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader><Leader> :Buffer<CR>

" vim-matchup: Enable parallel transmution (e.g. change closing XML Tag when
" opening one is altered)
let g_matchup_transmute_enabled = 1
let g:matchup_transmute_enabled = 1
let g:matchup_matchparen_enabled = 1
let g:matchup_matchparen_deferred = 1 " Be more performant

" MacVim Settings
if (WhichOS() =~# 'DARWIN' && has('gui_running'))
	" 2019-08-15: vim-matchparen somehow breaks MacVim unusable, so for the time
	" being it is disabled there
	let g:matchup_enabled = 0
	" Sane font for GVim / MacVim
	set guifont=SourceCodePro-Regular:h15
endif

" Sum up numbers of matches
" https://vim.fandom.com/wiki/Sum_numbers
let g:S = 0  "result in global variable S
function! Sum(number)
	let g:S = g:S + a:number
	return a:number
endfunction

augroup plugin-devdocs
  autocmd!
  autocmd FileType php,css,scss,sass,js,javacsript nmap <buffer>K <Plug>(devdocs-under-cursor)
augroup END

augroup htmlFileCompletion
	autocmd!
	autocmd FileType html,css,scss,sass,js,javascript,php let b:basedir=FindProjectRoot('.gitignore')
augroup END

function! FindProjectRoot(lookFor)
	let pathMaker='%:p'
	while(len(expand(pathMaker))>1)
		let pathMaker=pathMaker.':h'
		let fileToCheck=expand(pathMaker).'/'.a:lookFor
		if filereadable(fileToCheck)||isdirectory(fileToCheck)
			return expand(pathMaker)
		endif
	endwhile
	return 0
endfunction

let g:signify_sign_change = '~'
nnoremap <Leader>w :BD<CR>

:autocmd InsertEnter,InsertLeave * set cul!


augroup vala-meson
	autocmd!
	autocmd FileType vala nnoremap <Leader>c :!cd build; ninja<CR>
	autocmd FileType vala nnoremap <Leader>x :!./run.sh<CR><CR>
augroup END

augroup php
	autocmd!
	autocmd FileType php nnoremap <Leader>x :!php -l %<CR>
augroup END


nnoremap + <C-a>
nnoremap - <C-x>
vnoremap + g<C-a>
vnoremap - g<C-x>

nnoremap <Leader>* :Ggrep --untracked <cword><CR><CR>

" Visually mark insert mode by highlighting line numbers in a different color
" autocmd InsertEnter * hi  clear LineNr | hi LineNr ctermfg=yellow
" autocmd InsertLeave * hi  clear LineNr | hi LineNr ctermfg=darkgray

" Update tags file when saving PHP file
" au BufWritePost *.php silent! !eval 'ctags' &



" Needed for lightline relative path to project (git)
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction



" Highlight specific lines, a trick from 
" https://vimtricks.com/p/highlight-specific-lines/
highlight LineHighlight ctermbg=yellow guibg=yellow
nnoremap <silent> <Leader>l :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>
nnoremap <silent> <Leader>c :call clearmatches()<CR>


autocmd BufNewFile *.vue 0r ~/skeletons/component.vue
autocmd BufNewFile *.html 0r ~/skeletons/index.html

" Fern (file tree) configuration
nnoremap <Leader>e :Fern . -drawer -toggle<CR>
let g:fern#hide_cursor = 1
let g:fern#drawer_width = 42
function! s:init_fern() abort
	nmap <buffer> H <Plug>(fern-action-open:split)
	nmap <buffer> V <Plug>(fern-action-open:vsplit)
	nmap <buffer> R <Plug>(fern-action-rename)
	nmap <buffer> M <Plug>(fern-action-move)
	nmap <buffer> C <Plug>(fern-action-copy)
	nmap <buffer> N <Plug>(fern-action-new-path)
	nmap <buffer> D <Plug>(fern-action-new-dir)
	nmap <buffer> S <Plug>(fern-action-hidden-toggle)
	nmap <buffer> dd <Plug>(fern-action-trash)
	nmap <buffer> <leader> <Plug>(fern-action-mark)
endfunction

augroup fern-custom
	autocmd! *
	autocmd FileType fern call s:init_fern()
augroup END

let g:vimwiki_list = [{'path': '~/Nextcloud/vimwiki/', 'path_html': '~/Nextcloud/vimwiki_html/'}]
nnoremap <F3> :!curl -Lks https://localhost:3000/__browser_sync__?method=reload > /dev/null<CR><CR>


" Use lf to select and open file(s) in vim (adapted from ranger).
"
" You need to either copy the content of this file to your ~/.vimrc or source
" this file directly:
"
"     let lfvim = "/path/to/lf.vim"
"     if filereadable(lfvim)
"         exec "source " . lfvim
"     endif
"
" You may also like to assign a key to this command:
"
nnoremap <leader>l :LF<cr>
"

function! LF()
    let temp = tempname()
    exec 'silent !lf -selection-path=' . shellescape(temp)
    if !filereadable(temp)
        redraw!
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        return
    endif
    exec 'edit ' . fnameescape(names[0])
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar LF call LF()
