return {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        local cmp = require('cmp')
        local ls = require('luasnip')
        cmp.setup({
            snippet = {
                expand = function(args)
                    ls.lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

                ["<Tab>"] = cmp.mapping(function(fallback)
                    if ls.expand_or_jumpable() then
                        ls.expand_or_jump()
                    elseif cmp.visible() then
                        cmp.confirm({ select = true})
                    else
                        fallback()
                    end
                end, { "i", "s" }),

            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
                { name = 'buffer',keyword_length=5 },
            })
        })

    end,
}
