local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢺⣿⣿⣿⣿⣷⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⢠⣷⡄⠀⠙⢿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⣸⣿⣿⣦⡀⠀⠙⢿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣦⣄⠀⠈⠛⠿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣷⣤⣀⠀⠘⢿⣿⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠘⢁⣴⣾⣿⡿⠋⠀⠀⡀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⠇⢀⣶⣿⣿⣿⠋⠀⢀⣤⣾⣷⠀⠀",
  "⠀⠀⠀⠀⠠⠤⠶⣶⣤⣄⣉⠙⠿⣿⡿⠃⣰⣿⣿⣿⣿⠃⠀⢰⣿⣿⣿⣿⡇⠀",
  "⠀⠀⣤⣤⣤⣄⡀⠈⠻⣿⣿⣷⣦⡈⠁⣼⣿⣿⣿⣿⣿⠀⠀⣿⣿⣿⣿⣿⠃⠀",
  "⠀⢸⣿⣿⣿⣿⣷⠀⠀⢹⣿⣿⣿⣷⡀⢻⣿⣿⣿⣿⣿⠀⠀⢹⣿⣿⣿⡟⠀⠀",
  "⠀⠘⣿⣿⣿⣿⣿⣇⠀⠈⠻⣿⣿⣿⣷⠀⣿⣿⣿⣿⠟⠀⠀⣾⣿⣿⡟⠀⠀⠀",
  "⠀⠀⠙⣿⣿⣿⣿⣿⣦⣀⠀⠀⠉⠛⠻⠀⣿⡿⠟⠁⠀⣠⣾⣿⡿⠋⠀⠀⠀⠀",
  "⠀⠀⠀⠈⠻⢿⣿⣿⣿⣿⣿⣶⣶⠄⠀⠈⠋⠀⢀⣠⣾⡿⠟⠋⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠉⠁⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "                              ",
  "        CODE & COFEE          ",
  "                              ",
}

dashboard.section.buttons.val = {
  dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("s", "  > Session", function() require("persistence").load() end),
  dashboard.button("q", "󰩈  > Quit", ":qa<CR>"),
}

require("alpha").setup(
  dashboard.config
)
