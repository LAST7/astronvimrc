-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.pack.lua" },
    -- import/override with your plugins folder
    { import = "astrocommunity.pack.cpp" },
    -- { import = "astrocommunity.pack.verilog" },
    -- { import = "astrocommunity.pack.markdown" },
    { import = "astrocommunity.pack.typescript" },
    -- { import = "astrocommunity.pack.tailwindcss" },
    { import = "astrocommunity.pack.python" },
    { import = "astrocommunity.pack.rust" },
    -- diagnostic
    { import = "astrocommunity.diagnostics.trouble-nvim" },

    { import = "astrocommunity.bars-and-lines.scope-nvim" },
    { import = "astrocommunity.bars-and-lines.bufferline-nvim" },

    -- lspsaga
    { import = "astrocommunity.lsp.lspsaga-nvim" },

    -- flash
    { import = "astrocommunity.motion.flash-nvim" },

    -- markdown preview
    { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },

    -- undotree
    { import = "astrocommunity.editing-support.undotree" },

    -- code snap
    { import = "astrocommunity.media.codesnap-nvim" },

    -- appearance
    { import = "astrocommunity.bars-and-lines.lualine-nvim" },
    { import = "astrocommunity.colorscheme.catppuccin" },

    -- utility
    { import = "astrocommunity.motion.nvim-surround" },
    { import = "astrocommunity.motion.tabout-nvim" },
}
