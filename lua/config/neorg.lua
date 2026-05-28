vim.filetype.add({
  extension = {
    norg = "norg",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "norg",
  callback = function(args)
    vim.treesitter.start(args.buf)
  end,
})

require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/notes",
				},
				default_workspace = "notes",
			},
		},
		["core.concealer"] = {},
	}
})
