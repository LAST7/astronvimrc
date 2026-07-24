-- Make cursor transparent in dashboard
local default_guicursor = vim.opt.guicursor:get()
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

return {}
