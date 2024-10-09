local lsp_zero = require('lsp-zero')
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


local lspconfig = require('lspconfig')
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    -- For CSS, duh!
    'cssls',

    -- Makes web development faster... mostly html tag creation stuff
    'emmet_language_server',

    -- For js, react, and ts linting.
    -- NOTE: REQUIRES ESLINT FILE IN ROOT DIR OF PROJECT
    'eslint',

    -- for html (NOT DJANGO TEMPLATES)
    'html',

    -- for lua!
    'lua_ls',

    -- for python
    'pyright',

    -- for javascript and typescript
    -- TODO: Update this to ts_ls... but it keeps yelling at me.
    'ts_ls',

  },
  handlers = {
    -- this first function is the "default handler"
    -- it applies to every language server without a "custom handler"
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,

    --cssls
    cssls = function()
      --Enable (broadcasting) snippet capability for completion
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      lspconfig.cssls.setup {
        capabilities = capabilities,
      }
    end,

    --eslint
    eslint = function()
      lspconfig.eslint.setup({
        --- ...
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
    end,

    --html 
    --NOTE THIS ONLY WORKS FOR regular html... not django templates!
    html = function()
      --Enable (broadcasting) snippet capability for completion
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      lspconfig.html.setup ({
        capabilities = capabilities,
      })
    end,

    lua_ls = function()
      lspconfig.lua_ls.setup ({
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim'},
            },
          },
        },
      })
    end,

    --pyright
    pyright = function()
      lspconfig.pyright.setup({
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

  },
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

-- Function to disable eslint for the current buffer
_G.disable_eslint_for_current_buffer = function()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })

  for _, client in ipairs(clients) do
    if client.name == 'eslint' then
      -- Detach ESLint from the current buffer
      vim.lsp.buf_detach_client(0, client.id)
      print('ESLint disabled for current buffer.')
    end
  end

  -- Disable ESLintFixAll on save for this buffer
  vim.api.nvim_clear_autocmds({ buffer = 0, event = 'BufWritePre' })
end

-- Set keybinding to disable eslint in the current buffer
vim.api.nvim_set_keymap(
  'n', 
  '<leader>es', -- Replace <leader>de with your preferred key combo
  '<cmd>lua disable_eslint_for_current_buffer()<CR>', 
  { noremap = true, silent = true }
)

