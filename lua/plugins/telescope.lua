return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require("telescope.builtin")

        -- Variable to control whether ignore patterns are enabled
        local ignore_patterns_enabled = false

        -- Function to read ignore patterns from the file
        local function read_ignore_patterns()
            local ignore_file = vim.fn.expand("~/.config/nvim/telescope_ignore")
            local patterns = {}

            -- Check if the file exists
            if vim.fn.filereadable(ignore_file) == 1 then
                for line in io.lines(ignore_file) do
                    -- Skip empty lines and comments (lines starting with #)
                    if line ~= "" and not line:match("^%s*#") then
                        table.insert(patterns, line)
                    end
                end
            end

            return patterns
        end

        -- Function to toggle ignore patterns
        local function toggle_ignore_patterns()
            ignore_patterns_enabled = not ignore_patterns_enabled
            if ignore_patterns_enabled then
                vim.notify("Telescope ignore patterns ENABLED")
            else
                vim.notify("Telescope ignore patterns DISABLED")
            end
        end

        -- Function to get Telescope options with dynamic ignore patterns
        local function get_telescope_opts()
            local opts = {}

            if ignore_patterns_enabled then
                local ignore_patterns = read_ignore_patterns()
                if #ignore_patterns > 0 then
                    opts.file_ignore_patterns = ignore_patterns
                end
            end

            return opts
        end

        -- Keymaps
        vim.keymap.set("n", "<leader>pf", function()
            builtin.find_files(get_telescope_opts())
        end)
        vim.keymap.set("n", "<C-p>", function()
            builtin.git_files(get_telescope_opts())
        end)
        vim.keymap.set("n", "<leader>ps", function()
            local search = vim.fn.input("Grep > ")
            builtin.grep_string(vim.tbl_extend("force", get_telescope_opts(), { search = search }))
        end)
        vim.keymap.set("v", "<leader>pg", function()
            -- Yank the visually selected text to the unnamed register
            vim.cmd('normal! "vy')
            local search = vim.fn.getreg("v")
            builtin.grep_string(vim.tbl_extend("force", get_telescope_opts(), { search = search }))
        end)

        -- Keymap to toggle ignore patterns
        vim.keymap.set("n", "<leader>pt", toggle_ignore_patterns)
        -- Repeats the last search
        vim.api.nvim_set_keymap("n", "<leader>pr", ":Telescope resume<CR>", { noremap = true, silent = true })
    end,
}
