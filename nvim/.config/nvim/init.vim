"general{{{

nnoremap <leader>g :set operatorfunc=goperator#GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call goperator#GrepOperator(visualmode())<cr>


lua << EOF

vim.cmd'packadd paq-nvim'
local Paq = require'paq-nvim'    -- Module
local paq = Paq.paq              -- Function
paq{'savq/paq-nvim', opt=true}   -- Paq manages itself


-- Add your packages
-- paq 'neovim/nvim-lspconfig'
-- paq 'nvim-lua/completion-nvim'
-- paq 'nvim-lua/lsp_extensions.nvim'
-- paq{'lervag/vimtex', opt=true}     -- Use braces when passing options
-- paq{'dracula/vim', as='dracula'}   -- Use `as` to alias a package name (here `vim`)
-- paq 'junegunn/goyo.vim'

paq 'christoomey/vim-tmux-navigator'
paq 'itchyny/lightline.vim'
paq 'junegunn/vim-easy-align'
paq 'gavinok/spaceway.vim'
paq 'lilydjwg/colorizer'

EOF

colorscheme spaceway

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
nnoremap <C-p> :find *
nnoremap <C-s> :b 

"Compile
map <leader>c :w \| !compile %<CR>
"View
autocmd FileType tex,rmd,nroff map <F2> :!zathura %:r.pdf &<CR><CR>

nnoremap j gj
nnoremap k gk
vnoremap <leader>p "_dP

"Jump points
inoremap <C-j> <Esc>/<++><Enter>"_c4l
noremap <C-j> /<++><Enter>"_c4l
"inoremap <C-l> <ESC>dd/<++><Enter>"_c4l
"noremap <C-l> dd/<++><Enter>"_c4l

"Folds
nnoremap <Space> za
set foldmethod=marker

nnoremap <esc> :noh<return><esc>
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

set shortmess+=c   " Shut off completion messages
set completeopt-=preview
set completeopt+=menuone,noselect


"Spell
set spelllang=en_us,da
map <F5> :set spell!<CR>

"Goto file and create
noremap <leader>gf :e <cfile><cr>
noremap gp :! xdg-open <cfile><cr><cr>
noremap <leader>d :r !date --date="+24hours" +'\#\# \%d/\%m/\%C (\%V)'<cr>o


"presentation
nnoremap <F9> :Goyo <CR>

"Enclose in Bracets and quotes
vnoremap { "0c{<c-r>0}<esc>
vnoremap [ "0c[<c-r>0]<esc>
vnoremap ( "0c(<c-r>0)<esc>
vnoremap ½ "0c"<c-r>0"<esc>
"vnoremap ' "0c'<c-r>0'<esc>



nnoremap <F1> :echo<CR>
inoremap <F1> <C-o>:echo<CR>
inoremap <F10> <C-o>:vsp $MYVIMRC<CR>
nnoremap <F10> :vsp $MYVIMRC<CR>

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
"}}}

"Octave{{{
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END
nnoremap <F1> :terminal octave --persist %<CR>
autocmd TermOpen * startinsert

"}}}

autocmd BufNewFile,BufRead vifmrc set ft=vim

