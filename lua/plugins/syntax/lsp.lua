return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "jdtls", "pyright" }
      })
      
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()
      
      -- Setup Python LSP
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      -- Set up keymaps when an LSP attaches to a buffer (IntelliSense features)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }
          opts.desc = "Show line diagnostics"
          vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
          opts.desc = "Go to next diagnostic"
          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
          opts.desc = "Go to declaration"
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          opts.desc = "Go to definition"
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          opts.desc = "Hover documentation"
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          opts.desc = "Go to implementation"
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          opts.desc = "Signature help"
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          opts.desc = "Rename symbol"
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          opts.desc = "Code actions"
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          opts.desc = "Show references"
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          opts.desc = "Format code"
          vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end,
  }
}
