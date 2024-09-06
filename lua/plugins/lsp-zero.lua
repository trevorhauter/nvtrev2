return {
  {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  config = function()

    -- lsp_attach is where you enable features that only work
    -- if there is a language server active in the file
    local lsp_attach = function(client, bufnr)

      local opts = {buffer = bufnr}

      vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
      vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
      vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
      vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
      vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
      vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end

    lsp_zero.extend_lspconfig({
      sign_text = true,
      lsp_attach = lsp_attach,
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })


    -- set up auto completion
    local cmp = require('cmp')

    cmp.setup({
      sources = {
        {name = 'nvim_lsp'},
      },
      snippet = {
        expand = function(args)
          -- You need Neovim v0.10 to use vim.snippet
          vim.snippet.expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({}),
    })


    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {
        -- Helpful shortcuts for web development
        'emmet_ls',

        -- For js, react, and ts development
        'eslint',

        -- self explanatory...
        'html',

        -- for python
        'pyright', 

        -- The best CSS LSP money can buy 
        'tailwindcss',

      },
      handlers = {
        lsp_zero.default_setup,

        -- emmet_ls
        emmet_ls = function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = true

          require('lspconfig').emmet_ls.setup({
            capabilities = capabilities,
          })
        end,

        -- eslint
        eslint = function()
          require('lspconfig').eslint.setup({
            on_attach = function(client, bufnr)
              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                command = "EslintFixAll",
              })
            end,
          })
        end,

        --html
        html = function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = true

          require('lspconfig').html.setup ({
            capabilities = capabilities,
          })
        end,

        --pyright
        pyright = function()
          require('lspconfig').pyright.setup({
            settings = {
              python = {
                analysis = {
                  -- TODO: It would be nice to understand this better and turn these back on someday.
                  reportMissingTypeStubs = false,
                  typeCheckingMode = "off",
                },
              },
            },
          })
        end,

        --tailwindcss
        tailwindcss = function()
          require('lspconfig').tailwindcss.setup({})
        end,

      },
    })

  end,
}
