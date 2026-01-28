-- ~/.config/nvim/init.lua
-- 0. Completely disable netrw and its plugin at the very top of init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- 1. Load your other modules
require("pranab.remap")
require("pranab.packer")
require("pranab.options")

require("nvim-tree").setup()

-- 2. Configure Mason and LSP
require("mason").setup({
    ensure_installed = { "dart-debug-adapter", "dcm" },
})
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "gopls", "pyright", "clangd", "intelephense", "laravel_ls", "ts_ls", "dartls" },
    handlers = {
        function(server_name, config)
            require("lspconfig")[server_name].setup(config)
        end,
    },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")

-- Configure LSPs
vim.lsp.config('lua_ls', { capabilities = capabilities })
vim.lsp.enable('lua_ls')
vim.lsp.config('gopls', { capabilities = capabilities })
vim.lsp.enable('gopls')
vim.lsp.config('pyright', { capabilities = capabilities })
vim.lsp.enable('pyright')
vim.lsp.config('clangd', { capabilities = capabilities })
vim.lsp.enable('clangd')
vim.lsp.config('intelephense', { capabilities = capabilities })
vim.lsp.enable('intelephense')
vim.lsp.config('laravel_ls', { capabilities = capabilities })
vim.lsp.enable('laravel_ls')
vim.lsp.config('ts_ls', { capabilities = capabilities })
vim.lsp.enable('ts_ls')
vim.lsp.config('dartls', { capabilities = capabilities })
vim.lsp.enable('dartls')


-- 3. Configure LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(ev)
        -- Recommended: Set up default keymaps if they aren't already set
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end,
})
