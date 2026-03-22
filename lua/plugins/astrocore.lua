-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

local default_guicursor = vim.opt.guicursor:get()
-- Set cursor to be transparent in dashboard
vim.api.nvim_create_autocmd("User", {
    pattern = "SnacksDashboardOpened",
    desc = "Set cursor to be transparent in dashboard",
    callback = function()
        vim.opt.guicursor:append "a:CursorHidden"
        vim.api.nvim_set_hl(0, "CursorHidden", { reverse = true, blend = 100, nocombine = true })
        vim.cmd "redraw"
    end,
})

vim.api.nvim_create_autocmd("User", {
    pattern = "SnacksDashboardClosed",
    desc = "Reset cursor blend when leaving dashboard",
    callback = function() vim.opt.guicursor = default_guicursor end,
})

local custom_opts = {
    relativenumber = true,
    number = true,
    spell = false,
    signcolumn = "yes",
    wrap = true,
    -- indentation
    expandtab = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    smarttab = true,
    autoindent = true,
    -- search
    ignorecase = true,
    smartcase = true,

    cursorline = true,
    termguicolors = true,
    colorcolumn = "80",

    backspace = "indent,eol,start",

    splitright = true,
    splitbelow = true,

    fileencoding = "UTF-8",
    -- fileencodings = "UTF-8,gbk,latin1",
    syntax = "off",

    undofile = true,

    -- remain lines around cursor
    scrolloff = 8,
    sidescrolloff = 8,

    -- show invisible characters
    list = true,
    listchars = {
        space = "·",
        tab = ">~",
        eol = "↴",
        trail = "■",
    },

    wildmenu = true,
    completeopt = "menu,menuone,noselect",

    timeout = true,
    timeoutlen = 300,
}

---@type LazySpec
return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
        -- Configure core features of AstroNvim
        features = {
            large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
            autopairs = true, -- enable autopairs at start
            cmp = true, -- enable completion at start
            diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
            highlighturl = true, -- highlight URLs at start
            notifications = true, -- enable notifications at start
        },
        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
            virtual_text = true,
            underline = true,
        },
        -- passed to `vim.filetype.add`
        filetypes = {
            -- see `:h vim.filetype.add` for usage
        },
        -- vim options can be configured here
        options = {
            opt = custom_opts, -- see above
            g = { -- vim.g.<key>
                -- configure global vim variables (vim.g)
                -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
                -- This can be found in the `lua/lazy_setup.lua` file
            },
        },
    },
}
