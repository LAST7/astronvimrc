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
            c = { "clang-format" },
            cpp = { "clang-format" },
            lua = { "stylua" },
            python = { "black", "isort" },
            javascript = { "oxfmt" },
            typescript = { "oxfmt" },
            javascriptreact = { "oxfmt" },
            typescriptreact = { "oxfmt" },
            svelte = { "oxfmt", lsp_format = "never" },
            json = { "oxfmt" },
            jsonc = { "oxfmt" },
            yaml = { "oxfmt" },
            markdown = { "oxfmt" },
            html = { "oxfmt" },
            css = { "oxfmt" },
            sql = { "sql_formatter" },
        },
        formatters = {
            ["stylua"] = {
                prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
            },
            ["oxfmt"] = {
                prepend_args = { "-c", vim.fn.expand "~/.config/nvim/fmt/.oxfmtrc.json" },
            },
            -- prettierd = {
            --     prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
            -- },
        },
    },
}
