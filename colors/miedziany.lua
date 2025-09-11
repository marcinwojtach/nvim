---@class Miedziany.Palette
---@field black string
---@field grey string
---@field grey_dark string
---@field grey_darker string
---@field white string
---@field red string
---@field green string
---@field accent string
---@field blue string
---@field pink string
---@field yellow string

---@type Miedziany.Palette
local p = {
  black = "#010101",
  grey_darker = "#2a2a2d",
  grey_dark = "#505050",
  grey = "#808080",
  white = "#f0f0f0",
  red = "#e78284",
  green = "#90b99f",
  accent = "#b59efc",
  blue = "#99bbe0",
  pink = "#e29eca",
  yellow = "#e5c890",
}

local BG_NONE = 'NONE'

local BG_MAIN = p.black

local groups = {
  main = {
    Normal = { fg = p.white, bg = BG_MAIN },
    Statusline = { fg = p.accent, bg = BG_MAIN },
    StatuslineNC = { fg = p.accent, bg = BG_MAIN },
    VertSplit = { fg = p.black, bg = BG_MAIN },
    -- TabLine = { fg = p.fg, bg = p.bg }),
    -- TabLineFill = { fg = p.fg, bg = p.bg }),
    -- TabLineSel = { fg = p.fg, bg = p.bg }),
    -- ToolbarLine = { fg = p.fg, bg = p.bg }),
    -- ToolbarButton = { fg = p.fg, bg = p.bg }),
    -- QuickFixLine = { fg = p.fg, bg = p.bg }),
    CursorLineNr = { fg = p.yellow, bg = BG_NONE },
    LineNr = { fg = p.grey_darker, bg = BG_NONE  },
    LineNrAbove = { fg = p.grey_darker, bg = BG_NONE  },
    LineNrBelow = { fg = p.grey_darker, bg = BG_NONE  },
    -- NonText = { fg = p.fg, bg = p.bg }),
    -- EndOfBuffer = { fg = p.fg, bg = p.bg }),
    -- SpecialKey = { fg = p.fg, bg = p.bg }),
    -- FoldColumn = { fg = p.fg, bg = p.bg }),
    -- Visual = { fg = p.fg, bg = p.bg }),
    -- VisualNOS = { fg = p.fg, bg = p.bg }),
    -- Pmenu = { fg = p.fg, bg = p.bg }),
    -- PmenuThumb = { fg = p.fg, bg = p.bg }),
    -- PmenuSbar = { fg = p.fg, bg = p.bg }),
    -- PmenuSel = { fg = p.fg, bg = p.bg }),
    -- PmenuKind = { fg = p.fg, bg = p.bg }),
    -- PmenuKindSel = { fg = p.fg, bg = p.bg }),
    -- PmenuExtra = { fg = p.fg, bg = p.bg }),
    -- PmenuExtraSel = { fg = p.fg, bg = p.bg }),
    -- PmenuMatch = { fg = p.fg, bg = p.bg }),
    -- PmenuMatchSel = { fg = p.fg, bg = p.bg }),
    -- Si= { fg = p.fg, bg = p.bg }),
    Error = { fg = p.red, bg = BG_MAIN },
    -- ErrorMs= { fg = p.fg, bg = p.bg }),
    -- ModeMs= { fg = p.fg, bg = p.bg }),
    -- MoreMs= { fg = p.fg, bg = p.bg }),
    -- Question = { fg = p.fg, bg = p.bg }),
    -- Warnin= { fg = p.fg, bg = p.bg }),
    -- Todo = { fg = p.fg, bg = p.bg }),
    MatchParen = { fg = p.blue, bg = BG_NONE },
    -- Search = { fg = p.fg, bg = p.bg }),
    -- IncSearch = { fg = p.fg, bg = p.bg }),
    -- CurSearch = { fg = p.fg, bg = p.bg }),
    -- WildMenu = { fg = p.fg, bg = p.bg }),
    -- debu= { fg = p.fg, bg = p.bg }),
    -- debu= { fg = p.fg, bg = p.bg }),
    -- Cursor = { fg = p.fg, bg = p.bg }),
    -- lCursor = { fg = p.fg, bg = p.bg }),
    -- CursorLine = { fg = p.fg, bg = p.bg }),
    -- CursorColumn = { fg = p.fg, bg = p.bg }),
    -- Folded = { fg = p.fg, bg = p.bg }),
    -- ColorColumn = { fg = p.fg, bg = p.bg }),
    -- SpellBad = { fg = p.fg, bg = p.bg }),
    -- SpellCap = { fg = p.fg, bg = p.bg }),
    -- SpellLocal = { fg = p.fg, bg = p.bg }),
    -- SpellRare = { fg = p.fg, bg = p.bg }),
    Comment = { fg = p.green, bg = BG_NONE },
    Constant = { fg = p.blue, bg = BG_NONE },
    String = { fg = p.blue, bg = BG_NONE },
    Character = { fg = p.grey, bg = BG_NONE },
    Identifier = { fg = p.grey_dark, bg = BG_NONE },
    Statement = { fg = p.grey, bg = BG_NONE },
    PreProc = { fg = p.grey, bg = BG_NONE },
    Type = { fg = p.grey, bg = BG_NONE },
    -- Special = { fg = p.fg, bg = p.bg }),
    -- Underlined = { fg = p.fg, bg = p.bg }),
    -- Title = { fg = p.fg, bg = p.bg }),
    -- Directory = { fg = p.fg, bg = p.bg }),
    -- Conceal = { fg = p.fg, bg = p.bg }),
    -- I= { fg = p.fg, bg = p.bg }),
    -- Debu= { fg = p.fg, bg = p.bg }),
    -- DiffAdd = { fg = p.fg, bg = p.bg },
    -- DiffChan= { fg = p.fg, bg = p.bg },
    -- DiffText = { fg = p.fg, bg = p.bg },
    DiffDelete = { fg = p.red, bg = p.black },
    -- Added = { fg = p.fg, bg = p.bg }),
    -- Chan= { fg = p.fg, bg = p.bg }),
    Removed = { fg = p.red, bg = p.black },
  },
  treesitter = {

    TSComment = { link = 'Comment', fg = p.green },
    TSAnnotation = { fg = p.yellow, bg = BG_NONE },
    -- TSAttribute = { fg = p.accent, bg = 'NONE' },
    -- TSConstructor = { fg = p.cyan, bg = 'NONE' },
    -- TSType = { fg = p.cyan, bg = 'NONE' },
    -- TSTypeBuiltin = { fg = p.orange, bg = 'NONE' },
    -- TSConditional = { fg = p.yellow, bg = 'NONE' },
    -- TSException = { fg = p.royal, bg = 'NONE' },
    -- TSInclude = { fg = p.royal, bg = 'NONE' },
    -- TSKeywordReturn = { fg = p.magenta, bg = 'NONE' },
    -- TSKeyword = { fg = p.royal, bg = 'NONE' },
    -- TSKeywordFunction = { fg = p.yellow, bg = 'NONE' },
    -- TSLabel = { fg = p.light_red, bg = 'NONE' },
    -- TSNamespace = { fg = p.cyan, bg = 'NONE' },
    -- TSRepeat = { fg = p.yellow, bg = 'NONE' },
    -- TSConstant = { fg = p.royal, bg = 'NONE' },
    -- TSConstBuiltin = { fg = p.royal, bg = 'NONE' },
    -- TSFloat = { fg = p.fg, bg = 'NONE' },
    -- TSNumber = { fg = p.fg, bg = 'NONE' },
    -- TSBoolean = { fg = p.magenta, bg = 'NONE' },
    -- TSCharacter = { fg = p.green, bg = 'NONE' },
    -- TSError = { fg = p.error_red, bg = 'NONE' },
    -- TSFunction = { fg = p.yellow, bg = 'NONE' },
    -- TSFuncBuiltin = { fg = p.light_red, bg = 'NONE' },
    -- TSMethod = { fg = p.orange, bg = 'NONE' },
    -- TSConstMacro = { fg = p.orange, bg = 'NONE' },
    -- TSFuncMacro = { fg = p.cyan, bg = 'NONE' },
    -- TSVariable = { fg = p.red, bg = 'NONE' },
    -- TSVariableBuiltin = { fg = p.red, bg = 'NONE' },
    -- TSProperty = { fg = p.magenta, bg = 'NONE' },
    -- TSName = { fg = p.red, bg = 'NONE' },
    -- TSField = { fg = p.fg, bg = 'NONE' },
    -- TSParameter = { fg = p.red, bg = 'NONE' },
    -- TSParameterReference = { fg = p.red, bg = 'NONE' },
    -- TSSymbol = { fg = p.light_red, bg = 'NONE' },
    -- TSText = { fg = p.alt_fg, bg = 'NONE' },
    -- TSOperator = { fg = p.alt_fg, bg = 'NONE' },
    -- TSPunctDelimiter = { fg = p.alt_fg, bg = 'NONE' },
    -- TSTagDelimiter = { fg = p.alt_fg, bg = 'NONE' },
    -- TSTagAttribute = { fg = p.orange, bg = 'NONE' },
    -- TSPunctBracket = { fg = p.alt_fg, bg = 'NONE' },
    -- TSPunctSpecial = { fg = p.royal, bg = 'NONE' },
    -- TSString = { fg = p.green, bg = 'NONE' },
    -- TSStringRegex = { fg = p.green, bg = 'NONE' },
    -- TSStringEscape = { fg = p.green, bg = 'NONE' },
    -- TSTag = { fg = p.cyan, bg = 'NONE' },
    -- TSEmphasis = { fg = 'NONE', bg = 'NONE', italic = true, },
    -- TSUnderline = { fg = 'NONE', bg = 'NONE', underline = true, },
    -- TSTitle = { fg = p.fg, bg = 'NONE', },
    -- TSLiteral = { fg = p.royal, bg = 'NONE' },
    -- TSURI = { fg = p.orange, bg = 'NONE', underline = true, },
    -- TSKeywordOperator = { fg = p.royal, bg = 'NONE' },
    -- TSStructure = { fg = p.light_red, bg = 'NONE' },
    -- TSStrong = { fg = p.cyan, bg = 'NONE', bold = true, },
    -- TSQueryLinterError = { fg = p.warning_orange, bg = 'NONE' },
    -- TreesitterContext = { fg = 'NONE', bg = p.dark },
  }
}
local load = function()
  -- for name, val in pairs(hl_groups_main) do
  --   vim.api.nvim_set_hl(0, name, val)
  -- end
  vim.g.terminal_color_0 = p.black
  vim.g.terminal_color_1 = p.red
  vim.g.terminal_color_2 = p.green
  vim.g.terminal_color_3 = p.yellow
  vim.g.terminal_color_4 = p.blue
  vim.g.terminal_color_5 = p.pink
  vim.g.terminal_color_6 = p.accent
  vim.g.terminal_color_7 = p.black
  vim.g.terminal_color_8 = p.red
  vim.g.terminal_color_9 = p.red
  vim.g.terminal_color_10 = p.green
  vim.g.terminal_color_11 = p.yellow
  vim.g.terminal_color_12 = p.blue
  vim.g.terminal_color_13 = p.pink
  vim.g.terminal_color_14 = p.blue
  vim.g.terminal_color_15 = p.white

  for _, val in pairs(groups) do
    for name, val in pairs(val) do
      vim.api.nvim_set_hl(0, name, val)
    end
  end
  --
  -- -- Whichkey
  -- h(0, "WhichKey", { fg = p.royal, bg = 'NONE' })
  -- h(0, "WhichKeySeperator", { fg = p.green, bg = 'NONE' })
  -- h(0, "WhichKeyGroup", { fg = p.cyan, bg = 'NONE' })
  -- h(0, "WhichKeyDesc", { fg = p.light_red, bg = 'NONE' })
  -- h(0, "WhichKeyFloat", { fg = 'NONE', bg = p.dark })
  --
  -- -- Git
  -- h(0, "SignAdd", { fg = p.sign_add, bg = 'NONE' })
  -- h(0, "SignChange", { fg = p.sign_change, bg = 'NONE' })
  -- h(0, "SignDelete", { fg = p.sign_delete, bg = 'NONE' })
  -- h(0, "GitSignsAdd", { fg = p.sign_add, bg = 'NONE' })
  -- h(0, "GitSignsChange", { fg = p.sign_change, bg = 'NONE' })
  -- h(0, "GitSignsDelete", { fg = p.sign_delete, bg = 'NONE' })
  --
  -- -- LSP
  -- h(0, "LspDiagnosticsDefaultError", { fg = p.error_red, bg = 'NONE' })
  -- h(0, "LspDiagnosticsDefaultWarning", { fg = p.warning_orange, bg = 'NONE' })
  -- h(0, "LspDiagnosticsDefaultInformation", { fg = p.info_yellow, bg = 'NONE' })
  -- h(0, "LspDiagnosticsDefaultInfo", { fg = p.info_yellow, bg = 'NONE' })
  -- h(0, "LspDiagnosticsDefaultHint", { fg = p.hint_blue, bg = 'NONE' })
  -- h(0, "LspDiagnosticsVirtualTextError", { fg = p.error_red, bg = 'NONE' })
  -- h(0, "LspDiagnosticsVirtualTextWarning", { fg = p.warning_orange, bg = 'NONE' })
  -- h(0, "LspDiagnosticsVirtualTextInformation", { fg = p.info_yellow, bg = 'NONE' })
  -- h(0, "LspDiagnosticsVirtualTextInfo", { fg = p.info_yellow, bg = 'NONE' })
  -- h(0, "LspDiagnosticsVirtualTextHint", { fg = p.hint_blue, bg = 'NONE' })
  -- h(0, "LspDiagnosticsFloatingError", { fg = p.error_red, bg = 'NONE' })
  -- h(0, "LspDiagnosticsFloatingWarning", { fg = p.warning_orange, bg = 'NONE' })
  -- h(0, "LspDiagnosticsFloatingInformation", { fg = p.info_yellow, bg = 'NONE' })
  -- h(0, "LspDiagnosticsFloatingInfo", { fg = p.info_yellow, bg = 'NONE' })
  -- h(0, "LspDiagnosticsFloatingHint", { fg = p.hint_blue, bg = 'NONE' })
  -- h(0, "DiagnosticSignError", { fg = p.error_red, bg = 'NONE' })
  -- h(0, "DiagnosticSignWarning", { fg = p.warning_orange, bg = 'NONE' })
  -- h(0, "DiagnosticSignInformation", { fg = p.info_yellow, bg = 'NONE' })
  -- h(0, "DiagnosticSignInfo", { fg = p.info_yellow, bg = 'NONE' })
  -- h(0, "DiagnosticSignHint", { fg = p.hint_blue, bg = 'NONE' })
  -- h(0, "LspDiagnosticsSignError", { fg = p.error_red, bg = 'NONE' })
  -- h(0, "LspDiagnosticsSignWarning", { fg = p.warning_orange, bg = 'NONE' })
  -- h(0, "LspDiagnosticsSignInformation", { fg = p.info_yellow, bg = 'NONE' })
  -- h(0, "LspDiagnosticsSignInfo", { fg = p.info_yellow, bg = 'NONE' })
  -- h(0, "LspDiagnosticsSignHint", { fg = p.hint_blue, bg = 'NONE' })
  -- h(0, "LspDiagnosticsError", { fg = p.error_red, bg = 'NONE' })
  -- h(0, "LspDiagnosticsWarning", { fg = p.warning_orange, bg = 'NONE' })
  -- h(0, "LspDiagnosticsInformation", { fg = p.info_yellow, bg = 'NONE' })
  -- h(0, "LspDiagnosticsInfo", { fg = p.info_yellow, bg = 'NONE' })
  -- h(0, "LspDiagnosticsHint", { fg = p.hint_blue, bg = 'NONE' })
  -- h(0, "LspDiagnosticsUnderlineError", { fg = 'NONE', bg = 'NONE', underline = true, })
  -- h(0, "LspDiagnosticsUnderlineWarning", { fg = 'NONE', bg = 'NONE', underline = true, })
  -- h(0, "LspDiagnosticsUnderlineInformation", { fg = 'NONE', bg = 'NONE', underline = true, })
  -- h(0, "LspDiagnosticsUnderlineInfo", { fg = 'NONE', bg = 'NONE', underline = true, })
  -- h(0, "LspDiagnosticsUnderlineHint", { fg = 'NONE', bg = 'NONE', underline = true, })
  -- h(0, "LspReferenceRead", { fg = 'NONE', bg = '#2e303b' })
  -- h(0, "LspReferenceText", { fg = 'NONE', bg = '#2e303b' })
  -- h(0, "LspReferenceWrite", { fg = 'NONE', bg = '#2e303b' })
  -- h(0, "LspCodeLens", { fg = p.context, bg = 'NONE', italic = true, })
  -- h(0, "LspCodeLensSeparator", { fg = p.context, bg = 'NONE', italic = true, })
  --
  -- h(0, "LspInlayHint", { fg = p.lightdark, bg = 'NONE', })
  --
  -- -- Lualine
  -- h(0, 'LualineNA', { fg = p.neon, bg = p.dark })
  -- h(0, "LualineNB", { fg = p.star_yellow, bg = p.dark })
  -- h(0, "LualineNC", { fg = p.fg, bg = p.dark })
  -- h(0, 'LualineIA', { fg = p.error_red, bg = p.dark })
  -- h(0, "LualineIB", { fg = p.red, bg = p.dark })
  -- h(0, "LualineIC", { fg = p.fg, bg = p.dark })
  -- h(0, 'LualineVA', { fg = p.royal, bg = p.dark })
  -- h(0, "LualineVB", { fg = p.star_purple, bg = p.dark })
  -- h(0, "LualineVC", { fg = p.fg, bg = p.dark })
  -- h(0, 'LualineRA', { fg = p.darkblue, bg = p.dark })
  -- h(0, "LualineRB", { fg = p.star_blue, bg = p.dark })
  -- h(0, "LualineRC", { fg = p.fg, bg = p.dark })
  -- h(0, 'LualineCA', { fg = p.neongreen, bg = p.dark })
  -- h(0, "LualineCB", { fg = p.star_green, bg = p.dark })
  -- h(0, "LualineCC", { fg = p.fg, bg = p.dark })
  -- h(0, 'LualineEA', { fg = p.solarorange, bg = p.dark })
  -- h(0, "LualineEB", { fg = p.solarorange, bg = p.dark })
  -- h(0, "LualineEC", { fg = p.solarorange, bg = p.dark })
  --
  -- --Oil
  -- h(0, "OilLink", { fg = p.rose, bg = 'NONE' })
  -- h(0, "OilLinkTarget", { fg = p.magenta, bg = 'NONE' })
  --
  -- -- Buffer
  -- h(0, "BufferCurrent", { fg = p.fg, bg = p.bg })
  -- h(0, "BufferCurrentIndex", { fg = p.fg, bg = p.bg })
  -- h(0, "BufferCurrentMod", { fg = p.info_yellow, bg = p.bg })
  -- h(0, "BufferCurrentSign", { fg = p.hint_blue, bg = p.bg })
  -- h(0, "BufferCurrentTarget", { fg = p.red, bg = p.bg, bold = true, })
  -- h(0, "BufferVisible", { fg = p.fg, bg = p.bg })
  -- h(0, "BufferVisibleIndex", { fg = p.fg, bg = p.bg })
  -- h(0, "BufferVisibleMod", { fg = p.info_yellow, bg = p.bg })
  -- h(0, "BufferVisibleSign", { fg = p.white, bg = p.bg })
  -- h(0, "BufferVisibleTarget", { fg = p.red, bg = p.bg, bold = true, })
  -- h(0, "BufferInactive", { fg = p.white, bg = p.alt_bg })
  -- h(0, "BufferInactiveIndex", { fg = p.white, bg = p.alt_bg })
  -- h(0, "BufferInactiveMod", { fg = p.info_yellow, bg = p.alt_bg })
  -- h(0, "BufferInactiveSign", { fg = p.white, bg = p.alt_bg })
  -- h(0, "BufferInactiveTarget", { fg = p.red, bg = p.alt_bg, bold = true, })
  --
  -- -- StatusLine
  -- h(0, "StatusLine", { fg = p.line, bg = p.white })
  -- h(0, "StatusLineNC", { fg = p.line, bg = p.white })
  -- h(0, "StatusLineSeparator", { fg = p.line, bg = 'NONE' })
  -- h(0, "StatusLineTerm", { fg = p.line, bg = 'NONE' })
  -- h(0, "StatusLineTermNC", { fg = p.line, bg = 'NONE' })
  --
  -- -- IndentBlankline
  -- h(0, "IndentBlanklineContextChar", { fg = p.context, bg = 'NONE' })
  -- h(0, "IndentBlanklineContextStart", { fg = 'NONE', bg = 'NONE', underline = true, })
  -- h(0, "IndentBlanklineChar", { fg = p.dark_gray, bg = 'NONE' })
  -- h(0, "IndentBlanklineSpaceChar", { fg = p.cyan, bg = 'NONE' })
  -- h(0, "IndentBlanklineSpaceCharBlankline", { fg = p.info_yellow, bg = 'NONE' })
  --
  -- -- Cmp
  -- h(0, "CmpItemAbbrDeprecated", { fg = p.white, bg = 'NONE', strikethrough = true, })
  -- h(0, "CmpItemAbbrMatch", { fg = p.ui3_blue, bg = 'NONE' })
  -- h(0, "CmpItemAbbrMatchFuzzy", { fg = p.ui3_blue, bg = 'NONE' })
  -- h(0, "CmpItemKindFunction", { fg = p.cyan, bg = 'NONE' })
  -- h(0, "CmpItemKindMethod", { fg = p.cyan, bg = 'NONE' })
  -- h(0, "CmpItemKindConstructor", { fg = p.cyan, bg = 'NONE' })
  -- h(0, "CmpItemKindClass", { fg = p.cyan, bg = 'NONE' })
  -- h(0, "CmpItemKindEnum", { fg = p.cyan, bg = 'NONE' })
  -- h(0, "CmpItemKindEvent", { fg = p.yellow, bg = 'NONE' })
  -- h(0, "CmpItemKindInterface", { fg = p.cyan, bg = 'NONE' })
  -- h(0, "CmpItemKindStruct", { fg = p.cyan, bg = 'NONE' })
  -- h(0, "CmpItemKindVariable", { fg = p.red, bg = 'NONE' })
  -- h(0, "CmpItemKindField", { fg = p.red, bg = 'NONE' })
  -- h(0, "CmpItemKindProperty", { fg = p.red, bg = 'NONE' })
  -- h(0, "CmpItemKindEnumMember", { fg = p.orange, bg = 'NONE' })
  -- h(0, "CmpItemKindConstant", { fg = p.orange, bg = 'NONE' })
  -- h(0, "CmpItemKindKeyword", { fg = p.royal, bg = 'NONE' })
  -- h(0, "CmpItemKindModule", { fg = p.cyan, bg = 'NONE' })
  -- h(0, "CmpItemKindValue", { fg = p.fg, bg = 'NONE' })
  -- h(0, "CmpItemKindUnit", { fg = p.fg, bg = 'NONE' })
  -- h(0, "CmpItemKindText", { fg = p.fg, bg = 'NONE' })
  -- h(0, "CmpItemKindSnippet", { fg = p.yellow, bg = 'NONE' })
  -- h(0, "CmpItemKindFile", { fg = p.fg, bg = 'NONE' })
  -- h(0, "CmpItemKindFolder", { fg = p.fg, bg = 'NONE' })
  -- h(0, "CmpItemKindColor", { fg = p.fg, bg = 'NONE' })
  -- h(0, "CmpItemKindReference", { fg = p.fg, bg = 'NONE' })
  -- h(0, "CmpItemKindOperator", { fg = p.fg, bg = 'NONE' })
  -- h(0, "CmpItemKindTypeParameter", { fg = p.red, bg = 'NONE' })
end

local setup = function()
  vim.cmd('hi clear')

  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  vim.o.background = 'dark'
  vim.o.termguicolors = true
  vim.g.colors_name = 'miedziany'

  load()
end

setup();
