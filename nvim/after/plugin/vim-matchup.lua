vim.g.matchup_matchparen_offscreen = { method = "popup" }

require('nvim-treesitter.configs').setup({
    matchup = {
        -- mandatory, false will disable the whole extension
        enable = true,
        -- optional, list of language that will be disabled
        -- disable = { "c", "ruby" }, 
        -- [options]
    },
})

