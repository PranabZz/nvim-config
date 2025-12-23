vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-a>", "ggVG\"+y", {
    silent = true,
    desc = "Copy entire file to clipboard",
})

-- Open terminal in a bottom split with <leader>st
vim.keymap.set('n', '<leader>st', ':botright split | terminal<CR>', { desc = "Open Terminal" })

-- This is the ultimate auto-detected cheatsheet
vim.keymap.set('n', '<leader>cs', ':Telescope keymaps<CR>', { desc = "Search all shortcuts" })
-- Exit terminal mode with Double Esc
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = "Exit terminal mode" })
-- Replace whole file with Leader + r (usually Space + r)
vim.keymap.set("n", "<leader>q", "ggVG\"+p", { desc = "Replace file from clipboard" })

vim.keymap.set('n', '<leader>td', function()
    local todo_file = vim.fn.getcwd() .. "/todo.md"
    local file_exists = vim.fn.filereadable(todo_file) == 1

    if not file_exists then
        local f = io.open(todo_file, "w")
        f:write("# 📝 Project Todos\n\n- [ ] ")
        f:close()
    end

    vim.cmd("edit " .. todo_file)
    -- Move cursor to the end of the file in Insert mode
    vim.cmd("normal! G")
    vim.cmd("startinsert!")
end, { desc = "Open/Create Project Todo" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        -- Only apply if the filename is todo.md
        if vim.fn.expand("%:t") == "todo.md" then
            -- In insert mode, hitting enter adds the box
            vim.keymap.set('i', '<CR>', '<CR>- [ ] ', { buffer = true })
            -- In normal mode, hitting o adds the box
            vim.keymap.set('n', 'o', 'o- [ ] ', { buffer = true })
        end
    end
})

vim.keymap.set('n', '<leader><leader>', function()
    if vim.fn.expand("%:t") == "todo.md" then
        local line = vim.api.nvim_get_current_line()
        local new_line

        if line:find("%[ %]") then
            new_line = line:gsub("%[ %]", "[X]")
        elseif line:find("%[X%]") then
            new_line = line:gsub("%[X%]", "[ ]")
        end

        if new_line then
            vim.api.nvim_set_current_line(new_line)
        end
    end
end, { desc = "Toggle Todo Checkbox" })


vim.keymap.set({ "n", "v" }, "<leader>f", function()
    require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    })
end, { desc = "Format file or range (visual)" })

vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Show references" })

-- Press <leader>gg to open LazyGit
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })
-- Move text up and down in Visual Mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
