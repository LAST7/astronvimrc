return {
    "stevearc/conform.nvim",
    event = "User AstroFile",
    cmd = "ConformInfo",
    specs = {
        { "AstroNvim/astrolsp", optional = true, opts = { formatting = { disabled = true } } },
        { "jay-babu/mason-null-ls.nvim", optional = true, opts = { methods = { formatting = false } } },
    },
    dependencies = {
        { "williamboman/mason.nvim", optional = true },
        {
            "AstroNvim/astrocore",
            opts = {
                options = { opt = { formatexpr = "v:lua.require'conform'.formatexpr()" } },
            },
        },
    },
    init = function()
        -- default: enable autoformat unless user toggles it off
        if vim.g.autoformat == nil then vim.g.autoformat = true end
    end,
    opts = {
        default_format_opts = { lsp_format = "fallback" },
        -- Choose formatters per filetype
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black", "isort" },
            javascript = { "prettierd" },
            typescript = { "prettierd" },
            javascriptreact = { "prettierd" },
            typescriptreact = { "prettierd" },
            json = { "prettierd" },
            jsonc = { "prettierd" },
            yaml = { "prettierd" },
            markdown = { "prettierd" },
            html = { "prettierd" },
            css = { "prettierd" },
        },
        -- Force 4-space indentation and avoid tabs where supported
        formatters = {
            stylua = {
                prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
            },
            prettier = {
                prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
            },
        },
    },
}
