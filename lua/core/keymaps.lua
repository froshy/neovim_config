vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- <space h > for clear command
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
-- <shift h/l> to switch buffers
vim.keymap.set('n', '<S-h>', ':bp<CR>')
vim.keymap.set('n', '<S-l>', ':bn<CR>')
vim.keymap.set('n', '<leader>q', ':bd#<bar>bn<CR>')
-- save map
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<C-o>:w<CR>')


-- diagnostics
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

-- Trouble keymaps
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  { silent = true, noremap = true }
)

-- set scale factor for neovide
vim.g.neovide_scale_factor = 1.0
ChangeScaleFactor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.api.nvim_set_keymap('n', '<C-=>', ':lua ChangeScaleFactor(1.1)<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-->', ':lua ChangeScaleFactor(1/1.1)<CR>', { noremap = true })
