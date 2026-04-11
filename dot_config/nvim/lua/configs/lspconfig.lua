require("nvchad.configs.lspconfig").defaults()
require('configs.lsp.rust-analyzer')
require('configs.lsp.pest')

vim.lsp.config.neocmakelsp = require('configs.lsp.neocmakelsp')
vim.lsp.config.svelte = require('configs.lsp.svelte')
vim.lsp.config.clangd = require('configs.lsp.clangd')
vim.lsp.config.phpactor = require('configs.lsp.phpactor')
vim.lsp.config.nushell = require('configs.lsp.nushell')

vim.lsp.enable({
    "html",
    "cssls",
    "vtsls",
    "eslint-lsp",
    "clangd",
    "phpactor",
    "rust-analyzer",
    "hclfmt",
    "neocmakelsp",
    "sqlls",
    "twiggy-language-server",
    "pyright",
    "bash-language-server",
    "nushell",
    "svelte",
    "pest_ls",
})
