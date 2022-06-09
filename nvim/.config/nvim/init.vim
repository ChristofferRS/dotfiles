"Plugins{{{
call plug#begin()
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'gavinok/spaceway.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'neoclide/coc.nvim', {'branch':'release'}
call plug#end()

"}}}
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
set completeopt=longest,menuone,noinsert,noselect
let g:gruvbox_contrast_dark = "hard"
colorscheme spaceway
set makeprg=make\ %:r.pdf
map <C-c> :w \| make<CR>
"}}}
"Vanilla bindings{{{
"Spell
set spelllang=en_us,da
map <F5> :set spell!<CR>

noremap <leader>gf :e <cfile><cr>
noremap gp :! xdg-open <cfile><cr><cr>

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

inoremap <C-w> <Esc>/<++><Enter>"_c4l
"noremap <C-w> /<++><Enter>"_c4l

nnoremap <Space> za
set foldmethod=marker
"}}}
"PLUGIN CONFIG{{{

"EASYALIGN
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"COMPLETE{{{

" Give more space for displaying messages.
set cmdheight=2
set updatetime=1000

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"" Use <c-space> to trigger completion.
"if has('nvim')
"  inoremap <silent><expr> <c-space> coc#refresh()
"else
"  inoremap <silent><expr> <c-@> coc#refresh()
"endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"}}}

nmap <C-p> :Files<CR>
nmap <C-q> :Buffers<CR>

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


" Add your own mapping. For example:
noremap <silent> <C-E> :call QuickfixToggle()<CR>


let g:netrw_banner=0
let g:netrw_liststyle = 3

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


let g:vimwiki_list = [{'path': '~/Syncthing/AU/wiki/text/',
            \ 'template_path': '~/Syncthing/AU/wiki/templates/',
            \ 'path_html': '~/Syncthing/AU/wiki/html/',
            \ 'template_default': 'default',
            \ 'template_ext': '.html',
            \ 'nested_syntaxes' : {'python': 'python'}}]
", 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_markdown_link_ext=1
autocmd BufNewFile,BufRead vifmrc set ft=vim

augroup pandoc_syntax
        au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc.tex
augroup END

let g:pandoc#syntax#conceal#use = 0

