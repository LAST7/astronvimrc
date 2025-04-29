---@type LazySpec
return {
    {
        "Saghen/blink.cmp",
        dependencies = {
            "echasnovski/mini.icons",
        },
        opts = {
            keymap = {
                -- ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-K>"] = { "show", "show_documentation", "hide_documentation" },
                ["<A-e>"] = { "hide", "fallback" },
                ["<Tab>"] = {
                    "select_next",
                    "snippet_forward",
                    function()
                        vim.schedule(function() vim.snippet.jump(1) end)
                    end,
                    "fallback",
                },
            },
            completion = {
                menu = {
                    winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
                },
                documentation = {
                    window = {
                        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
                    },
                },
            },
            signature = {
                enabled = false,
            },
        },
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
            -- change the pattern of the ui
            -- "default", "minimal", "simple", "compact"
            render = "compact",
            -- change the animation when the notification disappears
            -- "fade_in_slide_out", "fade", "slide", "static"
            stages = "fade",
        },
    },
    {
        "MunifTanjim/nui.nvim",
        version = "8d5b0b5",
    },
    {
        "folke/noice.nvim",
        opts = {
            -- display the cmdline and popupmenu together
            views = {
                cmdline_popup = {
                    position = {
                        row = 5,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                    },
                },
                popupmenu = {
                    relative = "editor",
                    position = {
                        row = 8,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = 10,
                    },
                    border = {
                        style = "rounded",
                        padding = { 0, 1 },
                    },
                    win_options = {
                        winhighlight = {
                            Normal = "Normal",
                            FloatBorder = "NoicePopupmenuBorder",
                        },
                    },
                },
            },
            lsp = {
                hover = {
                    enabled = false,
                },
                signature = {
                    enabled = false,
                },
            },
        },
    },
    {
        "mistricky/codesnap.nvim",
        opts = {
            has_breadcrumbs = true,
            show_workspace = true,
            has_line_number = true,

            -- bg_theme = "grape",
            bg_color = "#5c6c7b",
            bg_padding = 30,

            -- watermark = "blog.imlast.top",
        },
    },
    {
        "nvimdev/lspsaga.nvim",
        opts = {
            ui = {
                border = "rounded",
            },
            outline = {
                auto_close = true,
            },
        },
    },
    {
        "echasnovski/mini.align",
        opts = {
            mappings = {
                start = "ga",
                start_with_preview = "gA",
            },
        },
    },
}
