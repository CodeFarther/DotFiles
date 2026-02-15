" Features
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
" autocmd VimEnter * botright 12split +term | wincmd k

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
let g:loaded_perl_provider = 0
set background=dark
" Enable syntax highlighting
syntax on
" vim-plug
call plug#begin()
Plug 'psf/black', { 'branch': 'stable' }
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'folke/tokyonight.nvim'
Plug 'agude/vim-eldar'
" Plug 'iagorrr/noctis-high-contrast.nvim'
call plug#end()
"...
set termguicolors     " enable true colors support

"------------------------
" Syntax: highlighting
"------------------------
if has('syntax')
    syntax enable             " Turn on syntax highlighting
    silent! colorscheme eldar " Custom color scheme
endif

"------------------------
" Syntax: highlighting
"------------------------
if has('syntax')
    " Override Eldar GUI colors
    let g:eldar_red     = "#ff0000"
    let g:eldar_yellow  = "#ffff00"
    let g:eldar_green   = "#00ff00"
    let g:eldar_cyan    = "#00ffff"
    let g:eldar_blue    = "#9f9fff"
    let g:eldar_magenta = "#ff00ff"

    syntax enable             " Turn on syntax highlighting
    silent! colorscheme eldar " Custom color scheme
endif

colorscheme eldar

"autocmd ColorScheme eldar Brighten Keywords (Pink)
highlight Keyword guifg=#F92672 gui=bold
" autocmd ColorScheme eldar Soften Variables (Change from white to Blue)
highlight Identifier guifg=#66D9EF
" autocmd ColorScheme eldar Brighten Functions (Green)
highlight Function guifg=#A6E22E
" autocmd ColorScheme eldar Make Operators stand out (Orange)
highlight Operator guifg=#FD971F


" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
set path+=**
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
"
" Disable the arrow keys in NORMAL mode and INSERT mode
no <right> <Nop>
no <left> <Nop>
no <up> <Nop>
no <down> <Nop>
" <right> <Nop>
" <left> <Nop>
" <up> <Nop>
" <down> <Nop>

set shortmess+=I
let mapleader='l'
nnoremap <leader>q :wqa!<CR>
"let g:black_use_virtualenv = 0

"augroup black_on_save
"  autocmd!
"  autocmd BufWritePre *.py Black
"augroup end
nnoremap <silent> <leader>n :windo stopinsert<CR>

nnoremap <F9> :Black<CR>

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Netrw file browser tweaks
let g:netrw_banner=0            "disable annoying banner
let g:netrw_browse_split=4      "open in prior window
let g:netrw_altv=1              "open split to right


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
"  Map <Esc> to jj
imap jj <Esc>
" Directories for swp files
set noswapfile
set nobackup

" Set clipboard to unnamed to allow the pasting from vim into other applications
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Use relativenumber to make movement between lines easier
set relativenumber

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
"set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'

" Set wrap features
set wrap
set tw=85

" Visually indicate tabs and end of lines
set listchars=tab:,eol:¬

" Set non printing characters
"set list

" Shortcut to nonprinting charaters
"nmap <leader>l :set list!<CR>

noremap <leader>c :bd<CR>
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
set tabstop=8


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
set list
            
            
            
