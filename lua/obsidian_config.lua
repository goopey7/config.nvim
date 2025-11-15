require("obsidian").setup({
	workspaces = {
		{
			name = "personal",
			path = "~/vaults/personal",
		},
	},
	mappings = {
		-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
		["gf"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
		-- Toggle check-boxes.
		["<leader>ch"] = {
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
			opts = { buffer = true },
		},
		-- Smart action depending on context, either follow link or toggle checkbox.
		["<cr>"] = {
			action = function()
				return require("obsidian").util.smart_action()
			end,
			opts = { buffer = true, expr = true },
		}
	},

	-- Where to put new notes. Valid options are
	--  * "current_dir" - put new notes in same directory as the current buffer.
	--  * "notes_subdir" - put new notes in the default notes subdirectory.
	new_notes_location = "notes_subdir",

	-- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
	-- URL it will be ignored but you can customize this behavior here.
	---@param url string
	follow_url_func = function(url)
		vim.ui.open(url)
	end,

	-- Optional, by default when you use `:ObsidianFollowLink` on a link to an image
	-- file it will be ignored but you can customize this behavior here.
	---@param img string
	follow_img_func = function(img)
		-- vim.fn.jobstart { "qlmanage", "-p", img } -- Mac OS quick look preview
		vim.fn.jobstart({ "feh", img }) -- linux
		-- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
	end,

	-- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
	open_app_foreground = false,

	picker = {
		-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
		name = "telescope.nvim",
		-- Optional, configure key mappings for the picker. These are the defaults.
		-- Not all pickers support all mappings.
		note_mappings = {
			-- Create a new note from your query.
			new = "<C-x>",
			-- Insert a link to the selected note.
			insert_link = "<C-l>",
		},
		tag_mappings = {
			-- Add tag(s) to current note.
			tag_note = "<C-x>",
			-- Insert a tag at the current location.
			insert_tag = "<C-l>",
		},
	},

	-- Optional, sort search results by "path", "modified", "accessed", or "created".
	-- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
	-- that `:ObsidianQuickSwitch` will show the notes sorted by latest modified time
	sort_by = "modified",
	sort_reversed = true,

	-- Set the maximum number of lines to read from notes on disk when performing certain searches.
	search_max_lines = 1000,

	-- Optional, determines how certain commands open notes. The valid options are:
	-- 1. "current" (the default) - to always open in the current window
	-- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
	-- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
	open_notes_in = "current",

	-- Optional, define your own callbacks to further customize behavior.
	callbacks = {
		-- Runs at the end of `require("obsidian").setup()`.
		---@param client obsidian.Client
		post_setup = function(client) end,

		-- Runs anytime you enter the buffer for a note.
		---@param client obsidian.Client
		---@param note obsidian.Note
		enter_note = function(client, note) end,

		-- Runs anytime you leave the buffer for a note.
		---@param client obsidian.Client
		---@param note obsidian.Note
		leave_note = function(client, note) end,

		-- Runs right before writing the buffer for a note.
		---@param client obsidian.Client
		---@param note obsidian.Note
		pre_write_note = function(client, note) end,

		-- Runs anytime the workspace is set/changed.
		---@param client obsidian.Client
		---@param workspace obsidian.Workspace
		post_set_workspace = function(client, workspace) end,
	},

	ui = {
		enable = true, -- set to false to disable all additional syntax features
	},

	-- Specify how to handle attachments.
	attachments = {
		-- The default folder to place images in via `:ObsidianPasteImg`.
		-- If this is a relative path it will be interpreted as relative to the vault root.
		-- You can always override this per image by passing a full path to the command instead of just a filename.
		img_folder = "assets/imgs", -- This is the default

		-- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
		---@return string
		img_name_func = function()
			-- Prefix image names with timestamp.
			return string.format("%s-", os.time())
		end,

		-- A function that determines the text to insert in the note when pasting an image.
		-- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
		-- This is the default implementation.
		---@param client obsidian.Client
		---@param path obsidian.Path the absolute path to the image file
		---@return string
		img_text_func = function(client, path)
			path = client:vault_relative_path(path) or path
			return string.format("![%s](%s)", path.name, path)
		end,
		confirm_img_paste = true,
	},
	---@param title string|?
	---@return string
	note_id_func = function(title)
		-- Format timestamp as YYYYMMDDHHMMSS
		local timestamp = os.date("%Y-%m-%d-%H%M%S")

		local suffix = ""
		if title ~= nil then
			-- Transform title into valid file name.
			suffix = title
				:gsub(" ", "-")
				:gsub("[^A-Za-z0-9-]", "")
				:lower()
		else
			-- If title is nil, generate 4 random uppercase letters.
			for _ = 1, 4 do
				suffix = suffix .. string.char(math.random(65, 90))
			end
		end

		return timestamp .. "-" .. suffix
	end
})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "markdown", "markdown_inline" },
	highlight = {
		enable = true,
	},
})

vim.opt.conceallevel = 1
vim.keymap.set("n", "<leader>of", ":ObsidianQuickSwitch<CR>")
vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>")
vim.keymap.set("n", "<leader>og", ":ObsidianSearch<CR>")
vim.keymap.set("n", "<leader>ot", ":ObsidianTags<CR>")
vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>")
