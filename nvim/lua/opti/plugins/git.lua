return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
  {
    "ruifm/gitlinker.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = true,
    opts = {
      mappings = nil, -- reset default mappings
    },
    config = true,
  },
  {
    "Rawnly/gist.nvim",
    cmd = { "GistCreate", "GistCreateFromFile", "GistsList" },
    config = {
      private = true, -- All gists will be private, you won't be prompted again
    },
  },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      enabled = false,
    },
    config = function()
      local gitblame = require("gitblame")

      -- configure gitblame
      gitblame.setup({
        enabled = false,
        display_virtual_text = 0,
        message_template = "<date> • <author> • <summary>",
        date_format = "%Y/%m/%d",
      })

      -- set keymaps
      local keymap = vim.keymap

      keymap.set("n", "<leader>cb", "<cmd>GitBlameToggle<cr>", { silent = true, desc = "Toggle GitBlame" })
      keymap.set("n", "<leader>co", "<cmd>GitBlameOpenCommitURL<cr>", { silent = true, desc = "Open commit URL" })
    end,
  },
  {
    "tpope/vim-fugitive",
    lazy = true,
  },
}
