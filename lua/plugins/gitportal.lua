return { 
  dir='/Users/trevorhauter/Code/gitportal.nvim',
  config = function()
    local gitportal = require("gitportal.core")
    vim.keymap.set("v", "<leader>gp", function() gitportal.open_file() end)
    vim.keymap.set("n", "<leader>gp", function() gitportal.open_file() end)
  end,
}
