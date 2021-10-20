"Settings{{{
filetype plugin on
syntax on
set tabstop=4 softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set incsearch
set hidden
set ignorecase
set smartcase
set path+=**
set relativenumber
set number
set wildmenu
set wildignorecase
set laststatus=2
set linebreak

"set colorcolumn=80
set shortmess+=c   " Shut off completion messages
set completeopt-=preview
set completeopt+=menuone,noselect
colorscheme spaceway
set makeprg=make\ %:r.pdf
"}}}
"Vanilla bindings{{{
"Spell
set spelllang=en_us,da
map <F5> :set spell!<CR>

noremap <leader>gf :e <cfile><cr>
noremap gp :! xdg-open <cfile><cr><cr>

nnoremap <leader>g :set operatorfunc=goperator#GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call goperator#GrepOperator(visualmode())<cr>

nnoremap <C-p> :find *
nnoremap <C-s> :b 

nnoremap <esc> :noh<return><esc>

map <leader>c :w \| !compile %<CR>
autocmd FileType tex,markdown,rmd,nroff map <F2> :!zathura %:r.pdf &<CR><CR>

nnoremap j gj
nnoremap k gk

vnoremap <leader>p "_dP

nnoremap <F1> :echo<CR>
inoremap <F1> <C-o>:echo<CR>

inoremap <F10> <C-o>:vsp $MYVIMRC<CR>
nnoremap <F10> :vsp $MYVIMRC<CR>

inoremap <C-j> <Esc>/<++><Enter>"_c4l
noremap <C-j> /<++><Enter>"_c4l

nnoremap <Space> za
set foldmethod=marker
"}}}
"Plugins{{{
lua << EOF
vim.cmd'packadd paq-nvim'
local Paq = require'paq-nvim'    -- Module
local paq = Paq.paq              -- Function
paq{'savq/paq-nvim', opt=true}   -- Paq manages itself
paq 'vim-pandoc/vim-pandoc-syntax'
paq 'christoomey/vim-tmux-navigator'
paq 'itchyny/lightline.vim'
paq 'junegunn/vim-easy-align'
paq 'gavinok/spaceway.vim'
paq 'lifepillar/vim-mucomplete'
paq 'editorconfig/editorconfig-vim'

EOF
"}}}
"PLUGIN CONFIG{{{

"EASYALIGN
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"MUCOMPLETE
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 1
let g:mucomplete#buffer_relative_paths = 1
let g:mucomplete#chains = {
\ 'default' : ['path', 'omni', 'keyn', 'dict', 'uspl'],
\ 'vim'     : ['path', 'cmd', 'keyn'],
\ 'tex'     : ['c-n', 'uspl', 'keyn','path']
\ }
imap <expr> <down> mucomplete#extend_fwd("\<down>")

"}}}
"QuicFix{{{

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

nnoremap <leader>q :call QuickfixToggle()<cr>

let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, '&filetype') == 'netrw')
                silent exe 'bwipeout ' . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Vexplore
    endif
endfunction

" Add your own mapping. For example:
noremap <silent> <C-E> :call QuickfixToggle()<CR>


let g:netrw_banner=0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

nnoremap <leader>f :find 
nnoremap <leader>p :bp<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>t  :ter<CR>
nnoremap <leader>vt :vsp \| ter<CR>

"}}}
"Octave{{{
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END
nnoremap <F1> :terminal octave --persist %<CR>
autocmd TermOpen * startinsert

"}}}

autocmd BufNewFile,BufRead vifmrc set ft=vim

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=tex.markdown.pandoc
augroup END

let g:pandoc#syntax#conceal#use = 0
