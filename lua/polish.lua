-- delete selection keymap
local global_s_maps = vim.api.nvim_get_keymap "s"
for _, map in ipairs(global_s_maps) do
    pcall(vim.keymap.del, "s", map.lhs)
end

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
