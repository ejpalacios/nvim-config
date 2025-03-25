return {
	-- Telescope fuzzy finder
	-- Link: https://github.com/nvim-telescope/telescope.nvim
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					prompt_prefix = "   ",
					sorting_strategy = "ascending",
					layout_config = {
						horizontal = {
							prompt_position = "top",
						},
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[f]ind [f]ile" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[f]ind [g]rep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[f]ind [f]uffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[f]ind [h]elp" })
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		build = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
}
