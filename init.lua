-- setup lazy.nvim

-- if we don't have lazy, download it
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

-- add lazy to the `runtimepath`, this allows us to `require` it.
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- set up lazy, and load my `lua/config/plugins/` folder
require("lazy").setup({ import = "config/plugins" }, {
  change_detection = {
    notify = false,
  },
})
