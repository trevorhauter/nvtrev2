return {
    "nvim-pack/nvim-spectre",
    config = function()
        vim.keymap.set("n", "<leader>R", '<cmd>lua require("spectre").toggle()<CR>', {
            desc = "Toggle Spectre",
        })
        require("spectre").setup({
            replace_engine = {
                ["sed"] = {
                    cmd = "gsed",
                    args = nil,
                    options = {
                        ["ignore-case"] = {
                            value = "--ignore-case",
                            icon = "[I]",
                            desc = "ignore case",
                        },
                    },
                },
            },
        })
    end,
}
