if not vim.g.neovide then
    return {} -- do nothing if not in a Neovide session
end

return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
        options = {
            opt = { -- configure vim.opt options
                -- configure font
                guifont = "FiraCode Nerd Font:h13",
                -- line spacing
                linespace = 0,
            },
            g = { -- configure vim.g variables
                floating_shadow = true,
                -- configure scaling
                neovide_scale_factor = 1.25,
                -- configure padding
                neovide_padding_top = 0,
                neovide_padding_bottom = 0,
                neovide_padding_right = 0,
                neovide_padding_left = 0,

                neovide_opacity = 0.7,
                neovide_hide_mouse_when_typing = true,
            },
        },
    },
}
