vim.o.shell = 'pwsh.exe'
vim.o.shellcmdflag = '-NoLogo -NoProfile -Command'
vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellquote = ''
vim.o.shellxquote = ''

vim.o.termguicolors = true
vim.o.laststatus = 3
vim.o.statusline = '%{%&buftype!="terminal"?" %f%m%r%h%w%=%l,%c%V %P ":""%}'

vim.api.nvim_create_autocmd({'BufEnter', 'TermEnter' }, {
	desc = 'sync nvim with terminal cwd',
	pattern = 'term://*',
	callback = function()
		local pid = vim.bo.channel and vim.fn.jobpid(vim.bo.channel)
		if not pid or pid <= 0 then return end
		local tmp = os.getenv('TEMP') .. '\\nvim-pwd-' .. pid
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
