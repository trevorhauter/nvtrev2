return {
  "tronikelis/gitportal.nvim",
  branch = "close/40/def_commands",
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
  end,
}
