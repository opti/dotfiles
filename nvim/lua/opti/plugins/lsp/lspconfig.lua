return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
      "saghen/blink.cmp",
    },
    config = function()
      local keymap = vim.keymap -- for conciseness

      local opts = { noremap = true, silent = true }
      local on_attach = function(_, bufnr)
        opts.buffer = bufnr

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>L", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "L", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

        opts.desc = "Stop LSP"
        keymap.set("n", "<leader>rq", ":LspStop<CR>", opts)
      end

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Change the Diagnostic symbols in the sign column (gutter)
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- configure html server
      vim.lsp.config("html", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure typescript server with plugin
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure css server
      vim.lsp.config("cssls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure tailwindcss server
      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure prisma orm server
      vim.lsp.config("prismals", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure graphql language server
      vim.lsp.config("graphql", {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
      })

      -- configure emmet language server
      vim.lsp.config("emmet_language_server", {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
      })

      -- -- configure python server
      -- vim.lsp.config("pyright", {
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- })

      vim.lsp.config("solargraph", {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "ruby" },
      })

      -- configure lua server (with special settings)
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })
    end,
  },
  {
    "hinell/lsp-timeout.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
  },
}
