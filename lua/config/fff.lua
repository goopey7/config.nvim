require("fff.download").ensure_downloaded({}, function(ok, err)
	if not ok then
		vim.schedule(function()
			vim.notify(
				"fff.nvim: failed to fetch binary: " .. (err or "unknown"),
				vim.log.levels.ERROR
			)
		end)
	end
end)

vim.api.nvim_create_autocmd('PackChanged', {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == 'fff.nvim' and (kind == 'install' or kind == 'update') then
			if not ev.data.active then vim.cmd.packadd('fff.nvim') end
			require('fff.download').download_or_build_binary()
		end
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'fff_input',
	command = 'setlocal complete=',
})

require('fff').setup({
	lazy_sync = true,
	prompt_vim_mode = true,
	prompt = '> ',
	layout = {
		height = 1.0,
		width = 1.0,
		prompt_position = 'top',
		preview_position = 'right',
		preview_size = 0.5,
		show_scrollbar = true,
		path_shorten_strategy = 'middle',
		anchor = 'center',
	},
	debug = { enabled = false, show_scores = false },
})
