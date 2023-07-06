return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim' },
    opts = {
        extensions = {
            file_browser = {
                hijack_netrw = true,
            },
        },
    },
    config = function(lazy, opts)
        local telescope = require('telescope')
        telescope.setup(opts)
        telescope.load_extension('file_browser')
    end
}

