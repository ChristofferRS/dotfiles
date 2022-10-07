vim.opt.guicursor=""
vim.opt.spelllang="en_us,da"
vim.opt.wildmenu=true
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.smartcase=true
vim.opt.ignorecase=true
vim.opt.incsearch=true
vim.opt.smartindent=true
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.wrap=false
vim.opt.signcolumn="yes"

vim.opt.completeopt={"menu","menuone","noselect"}

vim.cmd("colorscheme spaceway")
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap("n" ,"<Space>","za",opts)
vim.api.nvim_set_keymap("n", "<F10>", ":vsp $MYVIMRC<CR>",opts)
vim.api.nvim_set_keymap("n", "<F1>", ":echo<CR>",opts)
vim.api.nvim_set_keymap("n", "k", "gk",opts)
vim.api.nvim_set_keymap("n", "j", "gj",opts)
vim.api.nvim_set_keymap("n", "<esc>", ":noh<CR>",opts)
vim.api.nvim_set_keymap("n", "<leader>gf", ":e <cfile><CR>",opts)
vim.api.nvim_set_keymap("n", "gp", ":! xdg-open <cfile><cr>",opts)
vim.api.nvim_set_keymap("n", "<C-c>", ":w | make<CR>",opts)
vim.api.nvim_set_keymap("n", "<F5>", ":set spell!<CR>",opts)
vim.api.nvim_set_keymap("n", "<leader>c", ":w | !compile %<CR>",opts)
vim.api.nvim_set_keymap("n","<C-p>", ":Files<CR>",opts)
vim.api.nvim_set_keymap("n","<C-q>", ":Buffers<CR>",opts)
vim.api.nvim_set_keymap("n","<leader>p",":Ex<CR>",opts)

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.tex", "*.md","*.rmd","*.nroff"},
  callback = function() vim.api.nvim_set_keymap("n","<F2>", ":!zathura %:r.pdf &<CR><CR>",opts) end,
})

vim.api.nvim_set_keymap("i","<C-w>", "<Esc>/<++><Enter>\"_c4l",opts)
vim.api.nvim_set_keymap("i","<F10>", "<C-o>:vsp $MYVIMRC<CR>",opts)
vim.api.nvim_set_keymap("i","<F1>", "<C-o>:echo<CR>",opts)
