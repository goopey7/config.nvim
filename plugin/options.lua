local opt = vim.opt

-- search settings
opt.smartcase = true
opt.ignorecase = true
opt.hlsearch = false

-- line number settings
opt.number = true
opt.relativenumber = true

-- Don't have `o` add a comment
opt.formatoptions:remove "o"

opt.wrap = false
opt.linebreak = true

opt.tabstop = 4
opt.shiftwidth = 4

opt.errorbells = false

opt.swapfile = false

opt.hidden = true

opt.expandtab = false
