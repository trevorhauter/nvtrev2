return {
    "nvim-tree/nvim-tree.lua",
    keys = {
        -- Define keybindings for nvim-tree
        { "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true } },
        { "<leader>n", ":NvimTreeFindFile<CR>", { noremap = true, silent = true } },
        { "<C-t>", ":NvimTreeCollapse<CR>", { noremap = true, silent = true } },
        { "<C-a>", "<cmd>lua toggle_width_adaptive()<CR>", { noremap = true, silent = true } },
    },
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            view = { adaptive_size = true },
            filters = { custom = { "^.git$", "^.gitignore$" } },
        })
    end,
}
