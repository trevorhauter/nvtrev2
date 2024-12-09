return {
    "trevorhauter/gitportal.nvim",
    config = function()
        local gitportal = require("gitportal")

        gitportal.setup()

        vim.keymap.set("n", "<leader>gp", function()
            gitportal.open_file_in_browser()
        end)
        vim.keymap.set("v", "<leader>gp", function()
            gitportal.open_file_in_browser()
        end)
        vim.keymap.set("n", "<leader>ig", function()
            gitportal.open_file_in_neovim()
        end)

        vim.keymap.set("n", "<leader>gc", function()
            gitportal.copy_link_to_clipboard()
        end)

        vim.keymap.set("v", "<leader>gc", function()
            gitportal.copy_link_to_clipboard()
        end)
    end,
}
