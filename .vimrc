set nocompatible                                    "We want the latest Vim settings/options.

so ~/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
let mapleader = ','                                 "The default is \, but a comma is much better.
let g:mapleader = ","
set noerrorbells visualbell t_vb=               			"No damn bells!
set autowriteall                                                        "Automatically write the file when switching buffers.
set complete=.,w,b,u
set backupskip=/tmp/*,/private/tmp/*

set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set expandtab                   " expand tabs by default (overloadable per file type later)
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=4                " number of spaces to use for autoindenting
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set autowrite  "Save on buffer switch

let &t_SI = "\<Esc>]50;CursorShape=1\x7"

" Down is really the next line
nnoremap j gj
nnoremap k gk

"Show (partial) command in the status line
set showcmd

" Powerline (Fancy thingy at bottom stuff)
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**

" enable PHP autocomplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Automatically open the quickfix window
autocmd QuickFixCmdPost *grep* cwindow


"-------------Visuals--------------"
colorscheme hybrid_material
set t_CO=256                                "Use 256 colors. This is useful for Terminal Vim.
set macligatures
set guifont=Roboto\ Mono                       "Set the default font family and size.
set linespace=8
set guioptions-=e

set guioptions-=l                                                       "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R

"We'll fake a custom left padding for each window.
hi LineNr guibg=bg
set foldcolumn=2
hi foldcolumn guibg=bg

"Get rid of ugly split borders.
hi vertsplit guifg=bg guibg=bg



"-------------Search--------------"
set incsearch                               "Incrementally highlight, as we type.


highlight Search cterm=underline
set ignorecase                       	    " ignore case when searching
set smartcase                               " ignore case if search pattern is all lowercase,
"-------------Split Management--------------"
set splitbelow                              "Make splits default to below...
set splitright                              "And to the right. This feels more natural.




"-------------Plugins--------------"
"/
"/ CtrlP
"/
" let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:10'

nmap <C-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

"Make NERDTree easier to toggle.
nmap <D-\> :NERDTreeToggle<cr>

"/
"/ Greplace.vim
"/
set grepprg=ag								"We want to use Ag for the search.

let g:grep_cmd_opts = '--line-numbers --noheading'

"/
"/ Neocomplete
"/
so ~/.vim/neocomplete.vim

"/
"/ Multiple cursors
"/
"
function! Multiple_cursors_before()
    exe 'NeoCompleteLock'
    echo 'Disabled autocomplete'
endfunction

function! Multiple_cursors_after()
    exe 'NeoCompleteUnlock'
    echo 'Enabled autocomplete'
endfunction

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.

augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END
