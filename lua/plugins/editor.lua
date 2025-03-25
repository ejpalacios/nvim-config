return {
	-- Git gutters in file
	-- Link: https://github.com/lewis6991/gitsigns.nvim
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(buffer)
				local gs = require("gitsigns")
				vim.keymap.set("n", "<leader>ghh", gs.next_hunk, { desc = "Git: Next Hunk", buffer = buffer })
				vim.keymap.set("n", "<leader>ghH", gs.prev_hunk, { desc = "Git: Prev Hunk", buffer = buffer })
				vim.keymap.set(
					{ "n", "v" },
					"<leader>ghs",
					":Gitsigns stage_hunk<CR>",
					{ desc = "Stage Hunk", buffer = buffer }
				)
				vim.keymap.set(
					{ "n", "v" },
					"<leader>ghr",
					":Gitsigns reset_hunk<CR>",
					{ desc = "Reset Hunk", buffer = buffer }
				)
				vim.keymap.set("n", "<leader>ghS", gs.stage_buffer, { desc = "Git: Stage Buffer", buffer = buffer })
				vim.keymap.set(
					"n",
					"<leader>ghu",
					gs.undo_stage_hunk,
					{ desc = "Git: Undo Stage Hunk", buffer = buffer }
				)
				vim.keymap.set("n", "<leader>ghR", gs.reset_buffer, { desc = "Git: Reset Buffer", buffer = buffer })
				vim.keymap.set("n", "<leader>ghp", gs.preview_hunk, { desc = "Git: Preview Hunk", buffer = buffer })
				vim.keymap.set("n", "<leader>ghb", function()
					gs.blame_line({ full = true })
				end, { desc = "Blame Line", buffer = buffer })
				vim.keymap.set("n", "<leader>ghd", gs.diffthis, { desc = "Git: Diff This", buffer = buffer })
				vim.keymap.set("n", "<leader>ghD", function()
					gs.diffthis("~")
				end, { desc = "Git: Diff This ~", buffer = buffer })
				vim.keymap.set(
					{ "o", "x" },
					"ih",
					":<C-U>Gitsigns select_hunk<CR>",
					{ desc = "Git: Select Hunk", buffer = buffer }
				)
			end,
		},
	},
	-- Automatic highlighting
	-- Link: https://github.com/RRethy/vim-illuminate
	{
		"RRethy/vim-illuminate",
		enabled = false,
		opts = {
			filetypes_denylist = {
				"neo-tree",
				"dashboard",
				"lazy",
				"lspinfo",
			},
		},
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},
	-- Identiation guides
	-- Link: https://github.com/lukas-reineke/indent-blankline.nvim
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
		main = "ibl",
		opts = {
			indent = { char = "│", highlight = "IblChar" },
			scope = { char = "│", highlight = "IblScopeChar" },
		},
	},
	-- Comments
	-- Link: https://github.com/numToStr/Comment.nvim
	{
		"numToStr/Comment.nvim",
		config = true,
	},

	-- Add TODO comments
	-- Link: https://github.com/folke/todo-comments.nvim
	{
		"folke/todo-comments.nvim",
		dependencies = {
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost", "BufNewFile" },
		config = true,
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next todo comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous todo comment",
			},
			{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
			{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
			{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "[f]ind [t]odo" },
		},
	},
	-- Color highlighter
	-- Link: https://github.com/norcalli/nvim-colorizer.lua
	{
		"norcalli/nvim-colorizer.lua",
		config = true,
	},
	-- Test coverage
	-- https://github.com/andythigpen/nvim-coverage
	{
		"andythigpen/nvim-coverage",
		version = "*",
		config = function()
			require("coverage").setup({
				auto_reload = true,
			})
		end,
	},
}
