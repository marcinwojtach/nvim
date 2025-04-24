local function augroup(name)
  return vim.api.nvim_create_augroup("my-group" .. name, { clear = true })
end

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

-- check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdwinEnter" }, {
--   group = augroup("cmdline_close"),
--   callback = function()
--     vim.opt.cmdheight = 1
--   end
-- })
--
-- vim.api.nvim_create_autocmd({ "CmdlineLeave", "CmdwinLeave" }, {
--   group = augroup("cmdline_open"),
--   callback = function()
--     vim.opt.cmdheight = 0
--   end
-- })
