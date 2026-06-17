local M = {}

function M.getRelFilePath()
  local filepath = vim.api.nvim_buf_get_name(0)
  if filepath == "" then
    return
  end
  -- Try git root first
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if vim.v.shell_error == 0 and git_root then
    filepath = filepath:sub(#git_root + 2)
  else
    filepath = vim.fn.fnamemodify(filepath, ":.")
  end
  return filepath
end

return M
