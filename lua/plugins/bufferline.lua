return {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = {
        "catppuccin",
    },
    config = function()
        local config = {
            options = {
                close_command = "bp|sp|bn|bd! %d",
                right_mouse_command = "bp|sp|bn|bd! %d",
                left_mouse_command = "buffer %d",
                buffer_close_icon = "",
                modified_icon = "",
                show_close_icon = false,
                left_trunc_marker = "",
                right_trunc_marker = "",
                max_name_length = 15,
                max_prefix_length = 13,
                tab_size = 18,
                show_tab_indicators = true,
                indicator = {
                    icon = "▎", --'', '>>'
                    -- style = "icon",
                    style = "underline",
                },
                enforce_regular_tabs = false,
                view = "multiwindow",
                show_buffer_close_icons = false,
                -- separator_style = "slant",
                separator_style = "thin",
                always_show_bufferline = true,

                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                diagnostics_indicator = function(count, level)
                    local icon = level:match "error" and "" or ""
                    return "[" .. count .. " " .. icon .. " " .. "]"
                end,

                themable = true,
            },
            highlights = require("catppuccin.special.bufferline").get_theme {
                styles = {
                    "italic",
                    "bold",
                },
            },
        }

        require("bufferline").setup(config)
    end,
}
