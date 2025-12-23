-- 1. Completely disable netrw and its plugin at the very top of init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 2. Prevent netrw from trying to handle directory browsing
vim.g.netrw_liststyle = 3

-- 3. (IMPORTANT) Explicitly prevent the netrw filetype plugin from loading
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    command = "setlocal bufhidden=wipe",
})

-- Toggle Explorer: This will Open if closed, and Close if open.
vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle Explorer" })

-- Focus Explorer: Only jumps to the tree if it is already open
vim.keymap.set("n", "<C-h>", ":NvimTreeFocus<CR>", { silent = true, desc = "Focus Explorer" })

-- Focus Editor: Standard window navigation to move right
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true, desc = "Focus Editor" })
