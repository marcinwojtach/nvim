require "oil".setup({
  keymaps = {
    ['yp'] = {
      desc = 'Copy filepath to system clipboard',
      callback = function()
        require('oil.actions').copy_entry_path.callback()
        vim.fn.setreg("+", vim.fn.getreg(vim.v.register))
      end,
    },
  }
})
