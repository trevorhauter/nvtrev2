return {
    "trevorhauter/gitportal.nvim",
    config = function()
        local gitportal = require("gitportal")

        gitportal.setup()

        vim.keymap.set("n", "<leader>gp", gitportal.open_file_in_browser)
        vim.keymap.set("v", "<leader>gp", gitportal.open_file_in_browser)

        vim.keymap.set("n", "<leader>ig", gitportal.open_file_in_neovim)

        vim.keymap.set("n", "<leader>gc", gitportal.copy_link_to_clipboard)
        vim.keymap.set("v", "<leader>gc", gitportal.copy_link_to_clipboard)
    end,
}
