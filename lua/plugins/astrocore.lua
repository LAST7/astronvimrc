-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

local custom_opts = {
    relativenumber = true,
    number = true,
    spell = false,
    signcolumn = "yes",
    wrap = true,
    -- indentation
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
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

    -- for avante
    laststatus = 3,
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
            diagnostics = { virtual_text = false, virtual_lines = true }, -- diagnostic settings on startup
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
            extension = {
                foo = "fooscript",
            },
            filename = {
                [".foorc"] = "fooscript",
            },
            pattern = {
                [".*/etc/foo/.*"] = "fooscript",
            },
        },
        -- vim options can be configured here
        options = {
            opt = custom_opts,
            g = { -- vim.g.<key>
                -- configure global vim variables (vim.g)
                -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
                -- This can be found in the `lua/lazy_setup.lua` file
            },
        },
        -- Mappings can be configured through AstroCore as well.
        -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
        mappings = {
            -- first key is the mode
            n = {
                -- second key is the lefthand side of the map

                -- navigate buffer tabs
                -- ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
                -- ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

                -- mappings seen under group name "Buffer"
                -- ["<Leader>bd"] = {
                --     function()
                --         require("astroui.status.heirline").buffer_picker(
                --             function(bufnr) require("astrocore.buffer").close(bufnr) end
                --         )
                --     end,
                --     desc = "Close buffer from tabline",
                -- },

                -- tables with just a `desc` key will be registered with which-key if it's installed
                -- this is useful for naming menus
                -- ["<Leader>b"] = { desc = "Buffers" },

                -- setting a mapping to false will disable it
                -- ["<C-S>"] = false,
            },
        },
    },
}
