return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				file_ignore_patterns = { ".git/", "node_modules/", "vendor/", "android/", "ios/", "@girs/" },
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>f", builtin.find_files, {})
		vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>j", builtin.grep_string, {})
		vim.keymap.set("n", "<leader>b", builtin.buffers, {})
	end,
}
