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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "gopls", "pyright", "clangd", "intelephense", "laravel_ls", "ts_ls", "dartls" },
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({
                capabilities = capabilities,
            })
        end,
    },
})


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
