return {
    "neovim/nvim-lspconfig",
    config = function()
        local opts = { noremap=true, silent=true }
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
        require('lspconfig')['rust_analyzer'].setup{}
        require('lspconfig')['pyright'].setup{}
        require('lspconfig').tsserver.setup{}
        require('lspconfig').phpactor.setup{}
        require('lspconfig').gopls.setup{}
        require('lspconfig').dartls.setup{}
    end,
}
