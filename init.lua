-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.g.smooth_scroll = false

-- Ensure files are written with a trailing newline
vim.opt.endofline = true
vim.opt.fixendofline = true
