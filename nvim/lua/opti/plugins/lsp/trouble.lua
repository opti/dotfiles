return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Toggle Trouble",
    },
    {
      "<leader>xw",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Open Trouble workspace diagnostics",
    },
    {
      "<leader>xd",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Open Trouble document diagnostics",
    },
    {
      "<leader>xq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Open Trouble quickfix list",
    },
    {
      "<leader>xl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Open Trouble LOC list",
    },
    {
      "gR",
      "<cmd>Trouble lsp_references toggle<cr>",
      desc = "Open LSP references via Trouble",
    },
  },
}
