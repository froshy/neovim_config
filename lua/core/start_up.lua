-- Set line numbers
vim.cmd("set number")
-- No swap file
vim.cmd("set noswapfile")
-- hide tilde
vim.opt.fillchars:append { eob = " " }
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.o.updatetime = 250
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.opt.guifont = { "JetBrainsMono Nerd Font", ":h12" }
vim.opt.fillchars:append { vert = " " }
