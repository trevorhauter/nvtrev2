vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }

-- Define QuickScope highlights
-- This updates our highlight colors to be in line with our color scheme automatically!
vim.cmd([[
  augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
  augroup END
]])

return {
    "unblevable/quick-scope",
}
