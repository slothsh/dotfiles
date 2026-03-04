vim.g.rustaceanvim = {
    tools = {},
    server = {
        on_attach = function(client, bufnr)
        end,
        default_settings = {
            ['rust-analyzer'] = {
                default_settings = {
                    diagnostics = {
                        'unlinked-file'
                    }
                }
            },
        },
    },
    dap = {},
}
