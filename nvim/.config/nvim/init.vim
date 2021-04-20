"general{{{
call plug#begin('~/.config/nvim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'gavinok/spaceway.vim'
Plug 'junegunn/goyo.vim'
call plug#end()

colorscheme spaceway

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
nnoremap <C-p> :find *
nnoremap <C-a> :b 

"Compile
map <leader>c :w \| !compile %<CR>
"View
autocmd FileType tex,rmd,nroff map <F2> :!zathura %:r.pdf &<CR><CR>

nnoremap j gj
nnoremap k gk

"Jump points
inoremap <C-j> <Esc>/<++><Enter>"_c4l
noremap <C-j> /<++><Enter>"_c4l

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
map <F5> :setlocal spell!<CR>

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

"Netrw{{{
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
noremap <silent> <C-E> :call ToggleNetrw()<CR>


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
