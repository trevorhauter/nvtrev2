return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim', },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end)
    vim.keymap.set('v', '<leader>pg', function()
      -- Yank the visually selected text to the unnamed register
      vim.cmd('normal! "vy')
      local search = vim.fn.getreg('v')
      builtin.grep_string({ search = search })
    end)
  end,
}
