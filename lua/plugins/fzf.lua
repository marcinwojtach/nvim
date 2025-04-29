require "fzf-lua".setup {
  defaults = {
    formatter = { "path.filename_first", 2 }
  },
  winopts = {
    backdrop = 100,
    fullscreen = true,
  },
  fzf_colors = {
    ["gutter"] = "-1",
  }
}
