return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end)
        vim.keymap.set("n", "<C-h>", function()
            harpoon:list():clear()
        end)
        vim.keymap.set("n", "<C-j>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)
    end,
}
