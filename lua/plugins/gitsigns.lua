return {
    {
        "lewis6991/gitsigns.nvim",
        opts = function(_, opts)
            local old_on_attach = opts.on_attach

            -- delete this fucking stupid keymap in visual/select mode
            opts.on_attach = function(bufnr)
                if old_on_attach then old_on_attach(bufnr) end

                pcall(vim.keymap.del, "v", "<Leader>g", { buffer = bufnr })
                pcall(vim.keymap.del, "v", "<Leader>gs", { buffer = bufnr })
                pcall(vim.keymap.del, "v", "<Leader>gr", { buffer = bufnr })
            end
        end,
    },
}
