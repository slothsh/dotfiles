local plugins = {
    {
        "stevearc/conform.nvim",
        opts = require "configs.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("telescope").setup {
                defaults = {
                    layout_strategy = "vertical",
                    layout_config = {
                        prompt_position = 'bottom',
                        height = 0.9,
                        width = 0.9,
                    }
                }
            }
        end,
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    { "johmsalas/text-case.nvim",
        event = "VeryLazy",
        config = function()
            require("textcase").setup({})
        end
    },

    {
        "gbprod/phpactor.nvim",
    },

    {
        "fedepujol/move.nvim",
        event = "VeryLazy",
        opts = {},
        config = function()
            vim.api.nvim_create_user_command("MoveLineMotion", function(args)
                local sign = args.args/math.abs(args.args)
                local n = (args.line2 - args.line1)*sign + args.args
                vim.cmd{ cmd = "MoveLine", args = { n } }
            end, { nargs = 1, range = true, desc = "move.nvim MoveLine wrapper with motions" })
            require("move").setup({})
        end
    },

    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        dependencies = {
            "folke/snacks.nvim"
        },
        opts = {
            open_for_directories = false,
            keymaps = {
                show_help = "<f1>",
            },
        },
        init = function()
            vim.g.loaded_netrwPlugin = 1
        end,
    },

    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        cmd = "Copilot",
        config = function()
            require("copilot").setup({})
        end,
    },

    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        cmd = "CodeCompanion",
        event = "VeryLazy",
        config = function()
            require("codecompanion").setup({
                strategies = {
                    chat = {
                        adapter = "opencode",
                    },
                },
                opts = {
                    log_level = "DEBUG",
                },
            })
        end
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^6',
        lazy = false,
    },
}

return plugins
