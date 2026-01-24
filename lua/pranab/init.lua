-- ~/.config/nvim/init.lua
-- 0. Completely disable netrw and its plugin at the very top of init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- 1. Load your other modules
require("pranab.remap")
require("pranab.packer")
require("pranab.options")

require("nvim-tree").setup()

-- 2. Define Server Configurations
-- Neovim 0.11+ can automatically find these in your 'lsp/' directory, 
-- but you can also enable them directly if using default settings:
vim.lsp.enable({ 'lua_ls', 'dartls', 'gopls', 'pyright', 'clangd', 'intelephense', 'laravel_ls', 'tsserver' })

-- 3. Configure Native Autocompletion
-- This triggers the completion menu based on the LSP's 'triggerCharacters'
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions and completion",
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client.supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
    end

    -- Recommended: Set up default keymaps if they aren't already set
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  end,
})

