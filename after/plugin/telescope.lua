local builtin = require('telescope.builtin')

-- Keymap for live grep with user input
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = 'Telescope live grep' }) -- Keymap for finding files

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })

-- Maps Ctrl+t to open a fuzzy finder of all open buffers (files)
vim.keymap.set("n", "<C-t>", require('telescope.builtin').buffers, { desc = "Fuzzy find open buffers" })

vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Git Branches' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git Commits' })
vim.keymap.set('n', '<leader>gs', builtin.git_stash, { desc = 'Git Stash' })
