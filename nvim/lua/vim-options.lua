-- Setting tab to 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.g.mapleader = " "

-- Enable nvim to use system clipboard when copying from it
vim.opt.clipboard = "unnamedplus"

-- Enable absolute line numbers
vim.o.number = true

-- Better line wrapping
vim.opt.wrap = true -- Enable line wrap
vim.opt.breakindent = true -- Maintain indent when wrapping
vim.opt.linebreak = true -- Break lines at word boundaries not midword
