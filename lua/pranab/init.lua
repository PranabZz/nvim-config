vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('pranab.remap')
require('pranab.packer')
require('pranab.options')
require('pranab.file_management')

require('nvim-tree').setup()

require('mason').setup({
    ensure_installed = { 'dart-debug-adapter', 'dcm' },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'gopls', 'pyright', 'clangd', 'intelephense', 'laravel_ls', 'ts_ls', 'dartls', 'kotlin_language_server' },
    handlers = {
        function(server_name)
            vim.lsp.config(server_name, { capabilities = capabilities })
            vim.lsp.enable(server_name)
        end,
    },
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end,
})

vim.lsp.config('sourcekit', { capabilities = capabilities })
vim.lsp.enable('sourcekit')
