return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = {
            "bash",
            "c",
            "c_sharp",
            "cmake",
            "css",
            "gitcommit",
            "gitignore",
            "html",
            "htmldjango",
            "java",
            "javascript",
            "json",
            "lua",
            "python",
            "query",
            "typescript",
            "vim",
            "vimdoc",
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
 }
