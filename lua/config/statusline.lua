local lualine = require("lualine")

local config = {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = " ", right = " " },
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff" },
    lualine_c = { "filename" },
    lualine_x = { "diagnostics", "progress", "location" },
    lualine_y = { "encoding", "fileformat", "filetype" },
    lualine_z = {},
  },
  inactive_sections = {},
}

lualine.setup(config)
