local mason = {
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup()
	end,
}

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		mason,
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		require("mason-nvim-dap").setup({
		  handlers = {},
		})
		local dap = require("dap")
		local ui = require("dapui")

		ui.setup()
		require("nvim-dap-virtual-text").setup()

		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

		vim.keymap.set("n", "<leader>?", function()
			ui.eval(nil, { enter = true })
		end)

		vim.keymap.set("n", "<F2>", dap.restart)

		vim.keymap.set("n", "dc", dap.continue)
		vim.keymap.set("n", "si", dap.step_into)
		vim.keymap.set("n", "so", dap.step_over)
		vim.keymap.set("n", "sO", dap.step_out)
		vim.keymap.set("n", "sb", dap.step_back)

		dap.listeners.before.attach.dapui_config = function()
			ui.open()
		end

		dap.listeners.before.launch.dapui_config = function()
			ui.open()
		end

		dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
		end

		dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
		end
	end
}
