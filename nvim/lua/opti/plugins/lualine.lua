return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    local gitblame = require("gitblame")

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = "tokyonight",
        disabled_filetypes = {
          statusline = { "NvimTree" },
          winbar = { "NvimTree" },
        },
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "filetype" },
        },
        lualine_c = {
          {
            gitblame.get_current_blame_text,
            cond = gitblame.is_blame_text_available,
            color = { fg = "#ff9e64" }
          }
        },
      },
      winbar = {
        lualine_a = {
          {
            "tabs",
            mode = 1,
            path = 1,
            show_modified_status = false,
          }
        }
      },
      inactive_winbar = {
        lualine_a = {
          {
            "tabs",
            mode = 1,
            path = 1,
            tabs_color = {
              active = 'lualine_a_inactive',
            },
            show_modified_status = false,
          }
        }
      },
    })
  end,
}
