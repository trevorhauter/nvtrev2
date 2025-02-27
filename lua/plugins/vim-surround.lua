return {
    "tpope/vim-surround",
    config = function()
        -- https://github.com/ggandor/leap.nvim/discussions/38
        vim.keymap.set("n", "ds", "<Plug>Dsurround")
        vim.keymap.set("n", "cs", "<Plug>Csurround")
        vim.keymap.set("n", "cS", "<Plug>CSurround")
        vim.keymap.set("n", "ys", "<Plug>Ysurround")
        vim.keymap.set("n", "yS", "<Plug>YSurround")
        vim.keymap.set("n", "yss", "<Plug>Yssurround")
        vim.keymap.set("n", "ySs", "<Plug>YSsurround")
        vim.keymap.set("n", "ySS", "<Plug>YSsurround")

        vim.keymap.set("x", "rs", "<Plug>VSurround")
        vim.keymap.set("x", "rS", "<Plug>VgSurround")
    end,
}
