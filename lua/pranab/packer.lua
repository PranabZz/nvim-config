vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- 1. Core
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-tree/nvim-web-devicons' -- Moved to top level so everyone can use it

    -- 2. Theme
    use { "catppuccin/nvim", as = "catppuccin" }
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
        -- The configuration will be moved to after/plugin/treesitter.lua
    }

    -- nvim-cmp and its sources
    use 'hrsh7th/nvim-cmp'         -- The completion plugin
    use 'hrsh7th/cmp-buffer'       -- Source for text in buffer
    use 'hrsh7th/cmp-path'         -- Source for file system paths
    use 'hrsh7th/cmp-cmdline'      -- Source for command line history
    use 'saadparwaiz1/cmp_luasnip' -- nvim-cmp source for LuaSnip
    use 'L3MON4D3/LuaSnip'         -- Snippet engine
    use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp

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

    use({"williamboman/mason.nvim", config = function() require("mason").setup() end})

    use("williamboman/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig")
    use({"kdheepak/lazygit.nvim",
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

    -- Add flutter-tools.nvim plugin
    use {
        "akinsho/flutter-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim", -- Optional, for better UI
        },
        config = function()
            -- Define on_attach function with standard LSP keymaps for Dart
            local on_attach = function(client, bufnr)
                -- These are the same keymaps from your existing LspAttach autocommand
                -- which should be applied when dartls attaches
                local opts = { buffer = bufnr }
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                -- Add any other Dart-specific keymaps here if needed
            end

            require("flutter-tools").setup {
                flutter_path = nil, -- Let flutter-tools try to find it (since 'dart' is in PATH)
                fvm = false,
                widget_guides = {
                    enabled = true,
                },
                lsp = {
                    on_attach = on_attach, -- Use the defined on_attach function
                    capabilities = require('cmp_nvim_lsp').default_capabilities(), -- if using nvim-cmp
                },
                debugger = {
                    enabled = true,
                    run_via_dap = true,
                },
            }
        end,
    }

    use 'lukas-reineke/indent-blankline.nvim'
end)
