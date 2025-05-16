require "fzf-lua".setup {
  "border-fused",
  defaults = {
    formatter = { "path.filename_first", 999 }
  },
  winopts = {
    backdrop = 100,
    fullscreen = true,
  },
  fzf_colors = {
    ["gutter"] = "-1",
  }
}
