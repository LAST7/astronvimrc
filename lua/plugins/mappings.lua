local core_mappings = { i = {}, n = {}, v = {}, o = {}, x = {}, t = {} }

-- map H to ^ and L to $
for _, mode in pairs { "n", "v", "o" } do
    core_mappings[mode]["H"] = { "^", desc = "Start of a line" }
    core_mappings[mode]["L"] = { "$", desc = "end of a line" }
end

-- change <C-d> and <C-u> to move 8 lines up/down
for _, mode in pairs { "n", "v", "o", "x" } do
    core_mappings[mode]["<C-u>"] = { "8k", desc = "8 lines up" }
    core_mappings[mode]["<C-d>"] = { "8j", desc = "8 lines down" }
end

-- better indenting
core_mappings.v["<"] = { "<gv" }
core_mappings.v[">"] = { ">gv" }

-- use U to redo
core_mappings.n["U"] = { "<C-r>", desc = "redo" }

-- clear search highlights
core_mappings.n["<Leader>h"] = {
    "<cmd>nohl<cr>",
    desc = "clear search highlights",
}

-- window management
-- split
core_mappings.n["<Leader>sv"] = {
    "<C-w>v",
    desc = "split window verticaly",
}
core_mappings.n["<Leader>sh"] = {
    "<C-w>s",
    desc = "split window horizontally",
}
core_mappings.n["<Leader>se"] = {
    "<cmd>WindowsEqualize<cr>",
    desc = "make all split windows equal in width & height and enable windows.nvim plugin",
}
core_mappings.n["<Leader>sx"] = {
    "<cmd>close<cr>",
    desc = "close current split window",
}

-- tabs
core_mappings.n["<Leader>C"] = false
core_mappings.n["<Leader>c"] = false

core_mappings.n["<A-h>"] = {
    "<cmd>BufferLineCyclePrev<cr>",
    desc = "nevigate to prev buffer",
}
core_mappings.n["<A-l>"] = {
    "<cmd>BufferLineCycleNext<cr>",
    desc = "nevigate to next buffer",
}
core_mappings.n["<A-i>"] = {
    "<cmd>BufferLinePick<cr>",
    desc = "choose buffer",
}
core_mappings.n["<A-q>"] = {
    "<cmd>bp|sp|bn|bd!<cr>",
    desc = "close buffer",
}

-- noice
core_mappings.n["<Leader>mh"] = {
    "<cmd>NoiceSnacks<cr>",
    desc = "open message history with snack picker",
}
core_mappings.n["<Leader>md"] = {
    "<cmd>Noice dismiss<cr>",
    desc = "dismiss all messages",
}
core_mappings.n["<Leader>ml"] = {
    "<cmd>Noice last<cr>",
    desc = "show the last message in a popup",
}

-- neo-tree
core_mappings.n["<Leader>e"] = {
    "<cmd>Neotree toggle left<cr>",
    desc = "toggle floating neo-tree file explorer",
}

core_mappings.n["<Leader>o"] = {
    -- keyword `reveal` is needed here as the plugin wouldn't do so by default
    -- for reasons that IDK.
    "<cmd>Neotree toggle float reveal<cr>",
    desc = "toggle floating neo-tree file explorer",
}

-- format
core_mappings.n["<Leader>w"] = {
    function() require("conform").format { async = true } end,
    desc = "Format buffer",
}

-- visual range format
core_mappings.v["<Leader>w"] = {
    function()
        local s = vim.fn.getpos("'<")
        local e = vim.fn.getpos("'>")
        local end_line = vim.api.nvim_buf_get_lines(0, e[2] - 1, e[2], true)[1] or ""
        require("conform").format {
            async = true,
            range = { start = { s[2], 0 }, ["end"] = { e[2], #end_line } },
        }
    end,
    desc = "Format selection",
}

core_mappings.n["<Leader>ci"] = {
    function() vim.cmd.ConformInfo() end,
    desc = "Conform information",
}

core_mappings.n["<Leader>uf"] = {
    function()
        vim.b.autoformat = not vim.F.if_nil(vim.b.autoformat, vim.g.autoformat, true)
        require("astrocore").notify(
            string.format("Buffer autoformatting %s", vim.b.autoformat and "on" or "off")
        )
    end,
    desc = "Toggle autoformatting (buffer)",
}

core_mappings.n["<Leader>uF"] = {
    function()
        vim.g.autoformat, vim.b.autoformat = not vim.F.if_nil(vim.g.autoformat, true), nil
        require("astrocore").notify(
            string.format("Global autoformatting %s", vim.g.autoformat and "on" or "off")
        )
    end,
    desc = "Toggle autoformatting (global)",
}

-- to-do comments
core_mappings.n["[t"] = {
    function() require("todo-comments").jump_prev() end,
    desc = "previous todo comment",
}

core_mappings.n["]t"] = {
    function() require("todo-comments").jump_next() end,
    desc = "next todo comment",
}

for _, mode in pairs { "n", "i", "t" } do
    core_mappings[mode]["<C-'>"] = false
    core_mappings[mode]["<C-\\>"] = { "<Cmd>ToggleTerm direction=float<CR>", desc = "Toggle terminal" } -- requires terminal that supports binding <C-'>
end

----------
-- LSP Mappings
----------
local lsp_mappings = { i = {}, n = {}, v = {}, o = {}, x = {}, t = {} }

-- lspsaga
lsp_mappings.n["gh"] = {
    "<cmd>Lspsaga finder<cr>",
    desc = "show definition and reference",
}
lsp_mappings.n["gd"] = {
    "<cmd>Lspsaga peek_definition<cr>",
    desc = "peek definition",
}
lsp_mappings.n["gD"] = {
    "<cmd>Lspsaga goto_definition<cr>",
    desc = "go to definition",
    -- bypass astrolsp's mapping filter
    cond = function() return true end,
}
lsp_mappings.n["K"] = {
    "<cmd>Lspsaga hover_doc<cr>",
    desc = "hover documentation",
}
lsp_mappings.n["[d"] = {
    "<cmd>Lspsaga diagnostic_jump_prev<cr>",
    desc = "jump to previous diagnostic in buffer",
}
lsp_mappings.n["]d"] = {
    "<cmd>Lspsaga diagnostic_jump_next<cr>",
    desc = "jump to next diagnostic in buffer",
}
lsp_mappings.n["<Leader>sl"] = {
    "<cmd>Lspsaga outline<cr>",
    desc = "show outline",
}

return {
    {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
            mappings = core_mappings,
        },
    },
    {
        "AstroNvim/astrolsp",
        ---@type AstroLSPOpts
        opts = {
            mappings = lsp_mappings,
        },
    },
}
