return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
      -- Only include noice as dependency when not in VSCode
      not vim.g.vscode and "folke/noice.nvim" or nil,
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          path_display = { "truncate " },
          mappings = {
            i = {
              -- ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              -- ["<C-j>"] = actions.move_selection_next, -- move to next result
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
        buffers = {
          show_all_buffers = true,
          sort_lastused = true,
          theme = "dropdown",
          previewer = false,
          ignore_current_buffer = true,
          mappings = {
            n = {
              ["<C-k>"] = "delete_buffer",
            },
            i = {
              ["<C-k>"] = "delete_buffer",
            },
          },
        },
      })

      telescope.load_extension("fzf")

      -- Only load noice extension when not in VSCode
      if not vim.g.vscode then
        telescope.load_extension("noice")
      end

      -- set keymaps
      local keymap = vim.keymap -- for conciseness

      keymap.set("n", "<leader>t", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
      -- keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
      keymap.set("n", "<leader>gg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
      -- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

      -- Only set noice-related keymaps when not in VSCode
      if not vim.g.vscode then
        keymap.set("n", "<leader>nl", "<cmd>Telescope noice<cr>", { desc = "Show messages history" })
      end

      keymap.set("n", "<leader><space>", function()
        require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true })
      end, { desc = "[ ] Find existing buffers" })
    end,
  }
}
