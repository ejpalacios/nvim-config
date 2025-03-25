-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Treesitter configuration
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Advanced highlight and code navigation
-- Link: https://github.com/nvim-treesitter/nvim-treesitter
return {
	-- Syntax aware text objects
	-- Link: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{
		{
			"nvim-treesitter/nvim-treesitter",
			event = { "BufReadPost", "BufNewFile" },
			cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
			build = ":TSUpdate",
			dependencies = {
				"nvim-treesitter/nvim-treesitter-textobjects",
			},
			keys = {
				{ "c-space", desc = "Increment selection" },
				{ "c-M-space", desc = "Decrement selection", mode = "x" },
			},
			opts = {
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
					use_languagetree = true,
				},
				-- disable = { "latex" },
				indent = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<c-space>",
						node_incremental = "<c-space>",
						scope_incremental = "<c-s>",
						node_decremental = "<c-M-space>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["[f"] = "@function.outer",
							["[o"] = "@class.outer",
						},
						goto_next_end = {
							["]f"] = "@function.outer",
							["]o"] = "@class.outer",
						},
						goto_previous_end = {
							["]F"] = "@function.outer",
							["]O"] = "@class.outer",
						},
						goto_previous_start = {
							["[F"] = "@function.outer",
							["[O"] = "@class.outer",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
				},
			},
			config = function(_, opts)
				require("nvim-treesitter.configs").setup(opts)
			end,
		},
	},
}
