return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    -- make sure to load this before all the other start plugin
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme catppuccin-mocha]])
    end,
  },
}

-- lazy.lua references the colorscheme
