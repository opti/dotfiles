return {
  "cappyzawa/trim.nvim",
  opts = {
    ft_blocklist = { "alpha", "TelescopePrompt", "gitcommit" },
    highlight = true,
    highlight_bg = "#281D25",
    patterns = {
      [[%s/\(\n\n\)\n\+/\1/]],   -- replace multiple blank lines with a single line
    },
  }
}
