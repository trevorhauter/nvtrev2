return {
  dir='/Users/trevorhauter/Code/gitportal.nvim',
  config = function()
    local gitportal = require("gitportal.core")
    vim.keymap.set("v", "<leader>gp", function() gitportal.open_file_in_browser() end)
    vim.keymap.set("n", "<leader>gp", function() gitportal.open_file_in_browser() end)
    vim.keymap.set('n', '<leader>ig', function()
      gitportal.open_file_in_neovim(vim.fn.input("Github link > "));
    end)

  end,
}
