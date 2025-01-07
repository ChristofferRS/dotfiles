return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require('nvim-treesitter.configs').setup{
            indent = {
                enable = false,
            },
            highlight = {
                enable = true,
            },
            ensure_installed = { "python" },
            auto_install = false,
        }
    end,
}
