return {
  "okuuva/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true,
      write_all_buffers = true,
      trigger_events = { immediate = { "BufLeave", "FocusLost" } },
    })
  end,
}
