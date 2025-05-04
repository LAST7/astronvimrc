-- rosewater, flamingo, pink, mauve, red, maroon, peach, yellow...
-- more colors: https://github.com/catppuccin/catppuccin#-palette
local highlight_groups = function(C)
    return {
        NormalFloat = { bg = C.none }, -- transparent
        FloatBorder = { fg = C.lavender },
        TabLineSel = { bg = C.red },
        Pmenu = { bg = C.none },
        PmenuSel = { bg = C.overlay0 },

        -- blink.cmp
        BlinkCmpMenuBorder = { fg = C.yellow },
        BlinkCmpDocBorder = { fg = C.rosewater },
        BlinkCmpMenu = { link = "Pmenu" },
        BlinkCmpMenuSelection = { link = "PmenuSel" },
        -- noice
        -- https://github.com/folke/noice.nvim#-highlight-groups
        NoicePopupmenuBorder = { link = "CmpBorder" },
        -- flash
        -- https://github.com/folke/flash.nvim#-highlights
        FlashLabel = { fg = C.crust, bg = C.red },
        FlashMatch = { fg = C.text, bg = C.surface2 },
        FlashCurrent = { fg = C.surface1, bg = C.blue },
        -- neo-tree
        NeoTreeFloatBorder = { link = "FloatBorder" },
        NeoTreeTabInactive = { link = "Pmenu" },
        NeoTreeTabActive = { link = "CursorLine" },
        NeoTreeTabSeparatorInactive = { link = "Pmenu" },
        NeoTreeTabSeparatorActive = { link = "CursorLine" },
        -- snacks.indent
        SnacksIndent = { fg = C.overlay0 },
        SnacksIndentScope = { fg = C.blue },
    }
end

-- check https://github.com/catppuccin/nvim#special-integrations for more configuration
local config = {
    flavor = "mocha", -- latte, frappe, macchiato, mocha
    floating_border = "on",
    background = {
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    term_colors = true,
    no_italic = false,
    no_bold = false,
    no_underline = false,
    styles = {
        comments = { "italic" },
        onditionals = {},
        loops = {},
        functions = { "italic" },
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "bold" },
        properties = {},
        types = { "italic" },
    },
    integrations = {
        alpha = true,
        cmp = true,
        flash = false,
        gitsigns = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
        },
        lsp_trouble = true,
        markdown = true,
        mason = true,
        neotree = true,
        noice = true,
        notify = true,
        telescope = {
            enabled = true,
        },
        treesitter_context = true,
        which_key = true,
        native_lsp = {
            enable = true,
            virtual_text = {
                errors = { "bold" },
                hints = { "italic" },
                warnings = {},
                information = {},
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
            inlay_hints = {
                background = true,
            },
        },
    },
    -- user defined highlight group
    highlight_overrides = {
        mocha = highlight_groups,
    },
}

return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
        -- setup must be called before loading
        require("catppuccin").setup(config)
        -- vim.cmd.colorscheme("catppuccin-mocha")
    end,
}
