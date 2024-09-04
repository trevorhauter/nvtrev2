-- The following code is to allow for us to toggle the width of nvim-tree in cases
-- that we have long file names/paths :) 
_G.VIEW_WIDTH_FIXED = 30
_G.view_width_max = _G.VIEW_WIDTH_FIXED -- fixed to start

-- toggle the width and redraw
_G.toggle_width_adaptive = function()
  if _G.view_width_max == -1 then
    _G.view_width_max = _G.VIEW_WIDTH_FIXED
  else
    _G.view_width_max = -1
  end

  require("nvim-tree.api").tree.reload()
end

_G.get_view_width_max = function()
  return _G.view_width_max
end

return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    -- Define keybindings for nvim-tree
    {'<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true }},
    {'<leader>n', ':NvimTreeFindFile<CR>', { noremap = true, silent = true }},
    {'<C-t>', ':NvimTreeCollapse<CR>', { noremap = true, silent = true }},
		{'<C-a>', '<cmd>lua toggle_width_adaptive()<CR>', { noremap = true, silent = true }},
  },
  version = "*",
  lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup {
			view = {
				width = {
					min = 30,
					max = _G.get_view_width_max,
				}
			},
			filters = { custom = { "^.git$", "^.gitignore$" } },
		} 
	end,
}
