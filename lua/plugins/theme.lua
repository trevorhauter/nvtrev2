return {
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            if vim.fn.has("termguicolors") == 1 then
                vim.opt.termguicolors = true
            end

            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_enable_bold = true

            vim.g.gruvbox_material_transparent_background = 1
            vim.o.background = "dark"

            vim.g.gruvbox_material_background = "soft"
            vim.g.gruvbox_material_better_performance = 1
            vim.cmd.colorscheme("gruvbox-material")
        end,
    },
}
