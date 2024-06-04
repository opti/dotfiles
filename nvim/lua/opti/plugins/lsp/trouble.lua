return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },

  config = function()
    local opts = {}
    opts.desc = "Toggle Trouble"
    vim.keymap.set("n", "<leader>xx", function()
      require("trouble").toggle()
    end, opts)
    opts.desc = "Open Trouble workspace diagnostics"
    vim.keymap.set("n", "<leader>xw", function()
      require("trouble").toggle("workspace_diagnostics")
    end, opts)
    opts.desc = "Open Trouble document diagnostics"
    vim.keymap.set("n", "<leader>xd", function()
      require("trouble").toggle("document_diagnostics")
    end, opts)
    opts.desc = "Open Trouble quickfix list"
    vim.keymap.set("n", "<leader>xq", function()
      require("trouble").toggle("quickfix")
    end, opts)
    opts.desc = "Open Trouble LOC list"
    vim.keymap.set("n", "<leader>xl", function()
      require("trouble").toggle("loclist")
    end, opts)
    opts.desc = "Open LSP references via Trouble"
    vim.keymap.set("n", "gR", function()
      require("trouble").toggle("lsp_references")
    end, opts)
  end,
}
