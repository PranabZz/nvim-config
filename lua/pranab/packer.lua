vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- 1. Core
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-tree/nvim-web-devicons' -- Moved to top level so everyone can use it

    -- 2. Theme
    use { "rebelot/kanagawa.nvim", config = function() vim.cmd("colorscheme kanagawa") end }

    -- 3. The Dashboard (Fixed)
    use({
        'goolord/alpha-nvim',
        config = function()
            local dashboard = require("alpha.themes.dashboard")

            dashboard.section.header.val = {
                [[                                                      ]],
                [[          ██╗  ██╗             ██████╗                ]],
                [[          ██║ ██╔╝            ██╔════╝                ]],
                [[          █████╔╝     ██╗     ██║                     ]],
                [[          ██╔═██╗     ╚═╝     ██║                     ]],
                [[          ██║  ██╗            ╚██████╗                ]],
                [[          ╚═╝  ╚═╝             ╚═════╝                ]],
                [[                                                      ]],
                [[         K.C - DEVELOPMENT ENVIRONMENT                ]],
                [[                                                      ]],
            }
            dashboard.section.buttons.val = {
                dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
                dashboard.button("n", "  New File", ":ene <BAR> startinsert<CR>"),
                dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
                dashboard.button("t", "󰄱  Project Todos", ":lua require('kc').open_todo()<CR>"),
                dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
            }

            dashboard.section.footer.val = "Happy Coding, KC"
            require("alpha").setup(dashboard.opts)
        end
    })

    -- 4. Navigation & UI
    use {
        'nvim-telescope/telescope.nvim',
        config = function() require('telescope').setup {} end
    }



    -- 5. Treesitter (Merged duplicate entries)
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    'rust',
                    'javascript',
                    'typescript',
                    'php',
                    'dart',
                    'zig',
                    'python'
                },
                auto_install = true, -- automatically install new parsers
                highlight = {
                    enable = true,
                },
            }
        end
    }

    use({
        'Saghen/blink.cmp',
        tag = 'v0.*',
        config = function()
            require('blink.cmp').setup({
                keymap = {
                    preset = 'none', -- We'll define them manually to be safe
                    ['<cr>'] = { 'accept', 'fallback' },
                    ['<Tab>'] = { 'select_next', 'fallback' },
                    ['<S-Tab>'] = { 'select_prev', 'fallback' },
                },

                completion = {
                    -- This ensures the first item is ALWAYS highlighted automatically
                    list = { selection = { preselect = true, auto_insert = false } },

                    -- This shows the ghost text (optional, but helpful)
                    ghost_text = { enabled = true },
                },

                sources = {
                    default = { 'lsp', 'path', 'snippets', 'buffer' },
                },
            })
        end
    })
    use({
        'stevearc/conform.nvim',
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "isort", "black" },
                    javascript = { "prettierd", "prettier" },
                    typescript = { "prettierd", "prettier" },
                    dart = { "dart_format" },
                    php = { "php-cs-fixer" }, -- PHP formatter
                    cpp = { "clang-format" }, -- C++ formatter
                },
                format_on_save = { timeout_ms = 500, lsp_fallback = true },
            })
        end,
    })

    use({ "williamboman/mason.nvim", config = function() require("mason").setup() end })

    use({
        "kdheepak/lazygit.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end
    }

    use({
        'nvim-tree/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        config = function()
            require('nvim-tree').setup {
                respect_buf_cwd = true,
                view = {
                    adaptive_size = true,
                    side = 'left',
                }
            }
        end
    })

    use 'lukas-reineke/indent-blankline.nvim'
end)
