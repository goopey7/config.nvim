require("tree-sitter-manager").setup({
	ensure_installed = { "cpp", "zig", "rust", "json", "yaml", "asm", "bash", "glsl", "hlsl" },
	highlight = true,
	languages = {
		norg = {
			install_info = {
				url = "https://github.com/nvim-neorg/tree-sitter-norg",
			},
		},
	},
})
