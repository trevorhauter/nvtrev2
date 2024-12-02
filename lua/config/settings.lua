-- THIS IS WHERE YOU DO YOUR GENERAL NEOVIM CONFIG - Think vim.opt /

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- == BEGIN NVIM-TREE CONFIG ==
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
--
-- == END NVIM-TREE CONFIG ==

-- == BEGIN VIMWIKI CONFIG ==
vim.o.compatible = false
vim.cmd("filetype plugin on")
vim.cmd("syntax on")
-- == END VIMWIKI CONFIG ==

-- AUTO FORMATTING STUFF
-- Pretty sure this is a garbage way to do this but w/e for now
vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.py",
    group = "AutoFormat",
    callback = function()
        vim.cmd("silent !black --quiet %")
        vim.cmd("edit")
    end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.lua",
    group = "AutoFormat",
    callback = function()
        vim.cmd("silent !stylua %")
        vim.cmd("edit")
    end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.c",
    group = "AutoFormat",
    callback = function()
        vim.cmd("silent! !clang-format -i %")
        vim.cmd("edit")
    end,
})

-- END AUTO FORMATTING STUFF

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.o.splitbelow = true
vim.o.splitright = true
