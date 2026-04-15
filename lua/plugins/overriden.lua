return {
    {
        "saghen/blink.cmp",
        dependencies = {
            "nvim-mini/mini.icons",
        },
        opts = {
            keymap = {
                -- ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-k>"] = { "show", "show_documentation", "hide_documentation" },
                ["<A-o>"] = { "show" },
                ["<A-e>"] = { "cancel" },
                ["<A-l>"] = {
                    function(cmp)
                        if cmp.snippet_active() then return cmp.snippet_forward() end
                    end,
                    "fallback",
                },
                ["<Tab>"] = {
                    function(cmp)
                        if cmp.is_visible() then return cmp.select_next() end
                    end,
                    "fallback",
                },
            },
            sources = {
                providers = {
                    lsp = {
                        -- disable snippets from lsp
                        transform_items = function(_, items)
                            return vim.tbl_filter(
                                function(item) return item.kind ~= vim.lsp.protocol.CompletionItemKind.Snippet end,
                                items
                            )
                        end,
                    },
                    snippets = {
                        -- for comment snippets triggerred by "/*"
                        -- override = {
                        --     get_trigger_characters = function(_) return { "*" } end,
                        -- },
                    },
                },
                default = {
                    "lsp",
                    "path",
                    "snippets",
                    "buffer",
                },
            },
            completion = {
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = true,
                    },
                },
                menu = {
                    winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
                },
                documentation = {
                    window = {
                        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
                    },
                },
            },
            snippets = {
                preset = "luasnip",
                active = function(filter)
                    local snippet = require "luasnip"
                    local blink = require "blink.cmp"
                    if snippet.in_snippet() and not blink.is_visible() then
                        return true
                    else
                        if not snippet.in_snippet() and vim.fn.mode() == "n" then snippet.unlink_current() end
                        return false
                    end
                end,
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
        -- FIXME: outdated
        version = "v1.6.3",
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
