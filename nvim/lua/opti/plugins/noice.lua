return {
  "folke/noice.nvim",
  enabled = function()
    return not vim.g.vscode
  end,
  event = "VeryLazy",
  opts = {
    lsp = {
      -- Override markdown rendering so that LSP hover/signature uses Treesitter.
      -- NOTE: vim.lsp.util.convert_input_to_markdown_lines and
      -- vim.lsp.util.stylize_markdown are deprecated and scheduled for removal
      -- in Neovim 0.12+. Noice handles nil gracefully, but these overrides may
      -- need to be dropped once the functions are fully removed upstream.
      -- cmp.entry.get_documentation is intentionally omitted — blink-cmp does
      -- not expose that API.
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = false, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    cmdline = {
      view = "cmdline",
      format = {
        cmdline = { pattern = "^:", icon = "❯_", lang = "vim" },
      }
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    -- "rcarriga/nvim-notify",
  },
}
