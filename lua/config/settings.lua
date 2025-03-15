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

-- == BEGIN VIM-SURROUND CONFIG ==
vim.g.surround_no_mappings = 1
-- == END VIM-SURROUND CONFIG ==

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

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.js", "*.ts", "*.tsx", "*.jsx" },
    group = "AutoFormat",
    callback = function()
        vim.cmd("silent! !npx prettier --write %")
        vim.cmd("edit")
    end,
})

-- END AUTO FORMATTING STUFF

-- SPECIAL KEY MAPS
-- Add these remaps only when the buffer is modifiable
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*", -- You can specify a specific file type or pattern here
    callback = function()
        if vim.bo.modifiable then
            vim.api.nvim_buf_set_keymap(0, "v", "<C-j>", ":m '>+1<CR>gv=gv", {})
            vim.api.nvim_buf_set_keymap(0, "v", "<C-k>", ":m '<-2<CR>gv=gv", {})
        end
    end,
})

-- END SPECIAL KEY MAPS

--CODE FOLDING TIMEEEE
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldtext =
    [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
vim.opt.fillchars:append({ fold = " " })
vim.o.foldnestmax = 3
vim.o.foldminlines = 1
vim.o.foldenable = false
vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
-- END CODE FOLDING

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
vim.o.hidden = true
