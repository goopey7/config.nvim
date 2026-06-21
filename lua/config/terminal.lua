local is_win = vim.fn.has('win32') == 1

vim.o.shell = 'pwsh'
vim.o.shellcmdflag = '-NoLogo -NoProfile -Command'
vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellquote = ''
vim.o.shellxquote = ''

vim.o.termguicolors = true
vim.o.laststatus = 3
vim.o.statusline = '%{%&buftype!="terminal"?" %f%m%r%h%w%=%l,%c%V %P ":""%}'

vim.api.nvim_create_autocmd({ 'BufEnter', 'TermEnter' }, {
	desc = 'sync nvim with terminal cwd',
	pattern = 'term://*',
	callback = function()
		if vim.b.lazygit then return end
		local chan = vim.bo.channel
		if not chan then return end
		local ok, pid = pcall(vim.fn.jobpid, chan)
		if not ok or not pid or pid <= 0 then return end
		local sep = is_win and '\\' or '/'
		local tmpdir = is_win and (os.getenv('TEMP') or '/tmp') or '/tmp'
		local tmp = tmpdir .. sep .. 'nvim-pwd-' .. pid
		local f = io.open(tmp, 'r')
		if f then
			local cwd = f:read('*a'):gsub('%s+$', '')
			f:close()
			if cwd and cwd ~= '' and vim.fn.isdirectory(cwd) == 1 then
				vim.fn.chdir(cwd)
			end
		end
	end,
})

local first_term = true

vim.api.nvim_create_autocmd('TermOpen', {
	desc = 'block terminal input until profile loads',
	pattern = '*',
	callback = function(ev)
		if not first_term then return end
		first_term = false
		if vim.b.lazygit then return end
		local buf = ev.buf
		local chan = vim.bo[buf].channel
		if not chan then return end
		local ok, pid = pcall(vim.fn.jobpid, chan)
		if not ok or not pid or pid <= 0 then return end
		local tmpdir = is_win and (os.getenv('TEMP') or '/tmp') or '/tmp'
		local marker = tmpdir .. '/nvim-profile-ready-' .. pid
		local attempts = 0
		local function check()
			attempts = attempts + 1
			local f = io.open(marker, 'r')
			if f then
				f:close()
				os.remove(marker)
				if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_get_current_buf() == buf then
					vim.cmd.startinsert()
				end
			elseif attempts < 15 then
				vim.defer_fn(check, 200)
			else
				if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_get_current_buf() == buf then
					vim.cmd.startinsert()
				end
			end
		end
		vim.schedule(function()
			vim.cmd.stopinsert()
			vim.defer_fn(check, 500)
		end)
	end,
})
