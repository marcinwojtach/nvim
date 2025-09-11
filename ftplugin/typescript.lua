local macros = require 'utils.macros'

local function split_arguments(str)
  local args = {}
  for arg in str:gmatch('([^|]+)') do
    local trimmed_arg = arg:match("^%s*(.-)%s*$")
    if trimmed_arg ~= "" then
      table.insert(args, trimmed_arg)
    end
  end
  return args
end

local function write_to_line(table_args)
  local buf_id = vim.api.nvim_get_current_buf()
  local current_line_num = vim.api.nvim_win_get_cursor(0)[1] - 1

  vim.api.nvim_buf_set_lines(
    buf_id,
    current_line_num,
    current_line_num,
    true,
    table_args
  )
end

vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename(nil, { name = "vtsls" }) end,
  { noremap = true, desc = "Rename" })

vim.fn.setreg('l', 'viwy' .. macros.esc .. 'oconsole.log()' .. macros.esc .. 'P' .. macros.esc .. '_')

vim.api.nvim_create_user_command(
  'SpecIt',
  function(command_args)
    vim.notify("Original input: " .. command_args.args)
    local parsed_arguments = split_arguments(command_args.args)
    local should = parsed_arguments[1] or "should"
    local expect = parsed_arguments[2] or "subject.testable"
    local equal = parsed_arguments[3] or "true"

    write_to_line(
      {
        "it('" .. should .. "', () => {",
        "  expect(".. expect ..").toEqual(".. equal ..");",
        "})",
      }
    )
  end,
  {
    nargs = '*'
  }
)

vim.api.nvim_create_user_command(
  'SpecDesc',
  function(command_args)
    vim.notify("Original input: " .. command_args.args)
    local parsed_arguments = split_arguments(command_args.args)
    local when = parsed_arguments[1] or "when"


    write_to_line(
      {
        "describe('" .. when .. "', () => {",
        " ",
        "})"
      }
    )
  end,
  {
    nargs = '*'
  }
)

