return {
	dir = "D:\\plugins\\unreal.nvim",
	config = function()
		local unreal = require("unreal")
		unreal.setup()
		local unreal_pickers = require("telescope").extensions.unreal
		vim.keymap.set("n", "<leader>us",
			function() unreal_pickers.select_project(require("telescope.themes").get_dropdown()) end)
		vim.keymap.set("n", "<leader>ue", function() unreal_pickers.select_engine_plugin() end)
		vim.keymap.set("n", "<leader>ug", function() unreal_pickers.select_game_plugin() end)
		vim.keymap.set("n", "<leader>um", function() unreal_pickers.select_game_module() end)
		vim.keymap.set("n", "<leader>ud", function() unreal.reset_cwd() end)

		local telescope_builtin = require("telescope.builtin")
		unreal.project_select_callback = function(project)
			vim.uv.chdir(project.project_dir)
			local opts = {
				search_dirs = {
					"./Source",
					"./Plugins",
					"../Engine/Plugins/Rare",
				},
				find_command = { "rg",
					"--files",
					"--color", "never",
					"--glob", "!Binaries/",
					"--glob", "!Intermediate/",
					"--glob", "*.h",
					"--glob", "*.cpp",
					"--glob", "*.inl",
					"--glob", "*.cs",
					"--glob", "*.uplugin",
					"--glob", "*.uproject",
				},
			}
			vim.keymap.set("n", "<leader>fp", function() telescope_builtin.find_files(opts) end)
			opts = {
				find_command = { "rg",
					"--files",
					"--color", "never",
					"--glob", "!Binaries/",
					"--glob", "!Intermediate/",
					"--glob", "*.h",
					"--glob", "*.cpp",
					"--glob", "*.inl",
					"--glob", "*.cs",
					"--glob", "*.uplugin",
					"--glob", "*.uproject",
				},
			}
			vim.keymap.set("n", "<leader>fd", function() telescope_builtin.find_files(opts) end)
		end
	end
}
