set nocompatible                " be iMproved, required
filetype off                    " required
set clipboard=unnamedplus
"" Backup, swap, and undo directories
"set backup
"set backupdir=~/.vim/backup//
"set swapfile
"set directory=~/.vim/swap//
"set undofile
"set undodir=~/.vim/undo//
set mouse=i
"" Search options
set incsearch                   " highlight search
set hlsearch
set infercase
set noignorecase
set smartcase
set showmatch                   " show matching brackets
" set nowrap
set showcmd                     " show partial command in statusline
set wildmenu                    " completions menu

"" Line numbers and rulers
set numberwidth=3
set number relativenumber       " Hybrid Line Number
set cursorline
set cursorcolumn
set ruler

"" 300ms keymap
set timeoutlen=300

"" Don't redraw if we don't need to
set lazyredraw

"" Backspace behavior, listchars
set backspace=indent,eol,start
set listchars=tab:>-,trail:.,nbsp:.

"" Sane line joins with 'JJ'
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

"" Highlight ugly code
match ErrorMsg '\%>120v.\+'
match ErrorMsg '\s\+$'

"" Comma leader
let mapleader = ','
let g:mapleader = ','
syntax enable
set ts=2
set autoindent
set expandtab
set shiftwidth=4
" vim will autoread any changes you've made in any previous buffer.
set autoread 
" Disable the welcome Vim message
set shortmess+=I
let python_highlight_all=1

" set the runtime path for fzf-command line utility
set rtp+=~/.fzf

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
"
" GOYO.VIM (고요) Distraction-free writing in Vim.
Plugin 'junegunn/goyo.vim'

Plugin 'morhetz/gruvbox'
colorscheme gruvbox
set background=dark    " Setting dark mode
" set background=light   " Setting light mode

Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'mattn/calendar-vim'
Plugin 'vimwiki/vimwiki'
Plugin 'suan/vim-instant-markdown'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'wikitopian/hardmode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'

let g:tmuxline_preset = 'nightly_fox'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Manual Key mappings 
map <c-n> :tabnew
map <silent><c-e> :NERDTreeToggle <cr>
nnoremap <a-right> gt
nnoremap <a-left>  gT

" NerdTree configuration
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


" vimwiki - Personal Wiki for Vim
" https://github.com/vimwiki/vimwiki
" Run multiple wikis "
" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax 

" vim-instant-markdown - Instant Markdown previews from Vim
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0	" disable autostart
map <leader>md :InstantMarkdownPreview<CR>

" Settings for syntax highlighting of Code in VimWiki - for .wiki files
"let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'go': 'go', 'c': 'c'}
"let g:vimwiki_list = [wiki]

let g:vimwiki_list = [
                        \{'path': '~/Code/Notes','syntax': 'markdown', 'ext': '.md'},
                        \{'path': '~/Documents/VimWiki/faaltu.wiki', 'ext': '.wiki',
                        \ 'path_html': '~/faaltu/public', 'auto_export': 1, 'auto_toc': 1,
                        \ 'template_path': '~/faaltu/public/templates',
                        \ 'template_default': 'def_template',
                        \ 'template_ext': '.html'}
                \]
au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map <Leader>d :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map c :call ToggleCalendar()


