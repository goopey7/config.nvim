return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    local languages = require("config.languages")
    local lang_names = {}
    for _,language in ipairs(languages) do
      table.insert(lang_names, language.name)
    end
    treesitter.setup({
      ensure_installed = vim.tbl_flatten({lang_names}),
      auto_install = false,
      highlight = {
        enable = true,
        -- disable if loading a large file
        disable = function(_, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
    })
  end,
}
