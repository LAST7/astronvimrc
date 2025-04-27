-- set the float window to the right side
local side_window = {
    popup = {
        position = { col = "100%", row = "2" },
        size = function(state)
            local root_name = vim.fn.fnamemodify(state.path, ":~")
            local root_len = string.len(root_name) + 4
            return {
                width = math.max(root_len, 50),
                height = vim.o.lines - 6,
            }
        end,
    },
}

local cursor_color = vim.api.nvim_get_hl(0, { name = "Cursor" }).bg
local cursor_bg = "#000000"

if cursor_color then
    cursor_bg = string.format("#%06x", cursor_color)
else
    print "Cursor guibg color not found. See config file 'neo-tree.lua'"
end

local config = {
    close_if_last_window = true,
    popup_border_style = "rounded",
    source_selector = {
        statusline = false,
        winbar = true,
    },
    follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
    },

    -- set the float window to the right side
    filesystem = {
        window = side_window,
    },
    buffers = {
        window = side_window,
    },
    git_status = {
        window = side_window,
    },

    window = {
        width = 30,

        mappings = {
            -- switch between filesystem, buffers and git_status
            ["e"] = function() vim.cmd("Neotree focus filesystem current", true) end,
            ["b"] = function() vim.cmd("Neotree focus buffers current", true) end,
            ["g"] = function() vim.cmd("Neotree focus git_status current", true) end,
        },
    },

    -- hide cursor in neo-tree window
    event_handlers = {
        {
            event = "neo_tree_buffer_enter",
            handler = function()
                -- Get current highlight namespace
                local ns = vim.api.nvim_get_hl_ns {}

                -- Get the current Cursor highlight
                local cursor_hl = vim.api.nvim_get_hl(ns, { name = "Cursor" })

                -- Modify the Cursor highlight to be transparent
                cursor_hl.blend = 100
                vim.api.nvim_set_hl(ns, "Cursor", cursor_hl)
                vim.opt.guicursor:append "a:Cursor/lCursor"
            end,
        },
        {
            event = "neo_tree_buffer_leave",
            handler = function()
                local ns = vim.api.nvim_get_hl_ns {}

                -- Get the current Cursor highlight
                local cursor_hl = vim.api.nvim_get_hl(ns, { name = "Cursor" })

                -- Modify the Cursor highlight to be transparent
                cursor_hl.blend = 0
                vim.api.nvim_set_hl(ns, "Cursor", cursor_hl)
                vim.opt.guicursor:append "a:Cursor/lCursor"
            end,
        },
    },
}

return {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    branch = "v2.x",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        -- "nvim-lua/plenary.lua",
        "MunifTanjim/nui.nvim",
    },

    opts = config,
}
