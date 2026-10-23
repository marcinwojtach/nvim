local M = {}

function M.merge_base()
  local def = vim.fn.systemlist('git symbolic-ref --short refs/remotes/origin/HEAD')[1]
  if vim.v.shell_error ~= 0 or not def then def = 'origin/develop' end
  return vim.fn.systemlist('git merge-base HEAD ' .. def)[1]
end

return M
