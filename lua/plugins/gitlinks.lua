return { 
  'trevorhauter/gitlinks.nvim', 
  branch='initial_setup',
  config = function()
    require('gitlinks') -- This will load lua/gitlinks/init.lua
  end,
}
