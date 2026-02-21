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

local default_guicursor = vim.opt.guicursor:get()

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
    enable_git_status = false,

    -- set the float window to the right side
    filesystem = {
        window = side_window,
    },
    buffers = {
        window = side_window,
    },
    git_status = {
        window = nil,
    },

    window = {
        width = 30,

        mappings = {
            -- switch between filesystem and buffers
            ["e"] = function() vim.cmd("Neotree focus filesystem current", true) end,
            ["b"] = function() vim.cmd("Neotree focus buffers current", true) end,
        },
    },

    -- hide cursor in neo-tree window
    event_handlers = {
        {
            event = "neo_tree_buffer_enter",
            handler = function()
                vim.opt.guicursor:append "a:CursorHidden"
                vim.api.nvim_set_hl(0, "CursorHidden", { reverse = true, blend = 100, nocombine = true })
                vim.cmd "redraw"
            end,
        },
        {
            event = "neo_tree_buffer_leave",
            handler = function() vim.opt.guicursor = default_guicursor end,
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
