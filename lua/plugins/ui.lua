return {
  "akinsho/bufferline.nvim",
  config = function()
    require("bufferline").setup({
      options = {
        buffer_close_icon = "",
        always_show_bufferline = false,
      },
    })
  end,
}
