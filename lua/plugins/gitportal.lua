return { 
  --'trevorhauter/gitportal.nvim', 
  dir='~/code/gitportal.nvim/',
  branch='initial_setup',
  config = function()
    require('gitportal') -- This will load lua/gitlinks/init.lua
  end,
}
