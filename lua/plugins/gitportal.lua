return { 
  --'trevorhauter/gitportal.nvim', 
  dir='~/code/gitportal.nvim/',
  branch='initial_setup',
  config = function()
    require('gitlinks') -- This will load lua/gitlinks/init.lua
  end,
}
