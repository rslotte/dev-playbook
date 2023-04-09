" don't use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" really, just don't
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" Set basic configuration
set hidden
set number
set tabstop=4
set softtabstop=4
set shiftwidth=0
set listchars=space:·,tab:──
set list
set spelllang=en
set spellfile=${HOME}/Work/ansible-term-dev/roles/term-dev/files/en.utf-8.add
set nocompatible
set clipboard=unnamedplus
set autochdir

" Avoid escape key
imap jj <Esc>

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim', { 'on': 'Files' }
Plug 'ekalinin/Dockerfile.vim'
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }
Plug 'stephpy/vim-yaml'
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-scripts/kickAssembler-syntax'
Plug 'editorconfig/editorconfig-vim'
Plug 'zchee/deoplete-jedi'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'machakann/vim-highlightedyank'

" Initialize plugin system
call plug#end()

" deoplete config
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
let g:deoplete#enable_at_startup = 1
call deoplete#initialize()

" NERDTree on ctrl+n
let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1

" fzf on ctrl+p
nnoremap <C-P> :Files<CR>

" vim-terraform configuration
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Lightline config
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" Nord theme config
colorscheme nord

" KickAssembler syntax config
autocmd BufRead *.asm set filetype=kickass

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" enably pylint
let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)

