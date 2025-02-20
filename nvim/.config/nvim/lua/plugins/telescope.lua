return {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' , 'nvim-tree/nvim-web-devicons'},
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        vim.keymap.set('n', 'fg', builtin.live_grep, {})
        vim.keymap.set('n', '<C-f>', builtin.buffers, {})
        vim.keymap.set('n', 'fh', builtin.help_tags, {})
    end,
}
