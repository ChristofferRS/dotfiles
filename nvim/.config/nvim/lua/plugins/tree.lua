return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require('nvim-treesitter.configs').setup{
            indent = {
                enable = true,
            },
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
            auto_install = true,
        }
    end,
}
