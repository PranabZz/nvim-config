local opt = vim.opt

-- General appearance
opt.number = true           -- Show line numbers
opt.relativenumber = true   -- Relative line numbers for easier jumping
opt.cursorline = true       -- Highlight the current line
opt.termguicolors = true    -- True color support (required for modern themes)

-- Indentation (Standard 2025 defaults)
opt.shiftwidth = 4          -- Size of an indent
opt.tabstop = 4             -- Number of spaces tabs count for
opt.expandtab = true        -- Use spaces instead of tabs
opt.smartindent = true      -- Insert indents automatically

-- Completion (v0.11+ Native Completion)
-- "fuzzy" enables the new 0.11 native fuzzy matching for ins-completion
opt.completeopt = { "menu", "menuone", "noselect", "fuzzy" }

-- Behavior
opt.mouse = "a"             -- Enable mouse support
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.ignorecase = true       -- Ignore case in search
opt.smartcase = true        -- Don't ignore case if search has capitals
opt.splitright = true       -- Vertical splits go to the right
opt.splitbelow = true       -- Horizontal splits go below
opt.updatetime = 250        -- Faster completion and diagnostics feedback

-- Persistence
opt.undofile = true         -- Save undo history to a file

