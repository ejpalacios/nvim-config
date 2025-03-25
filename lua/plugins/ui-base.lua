return {
	-- Atom Theme
	-- Link: https://github.com/rmehri01/onenord.nvim
	{
		"rmehri01/onenord.nvim",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme onenord]])
		end,
	},
	-- File tree explorer
	-- Link: https://github.com/nvim-neo-tree/neo-tree.nvim
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			close_if_last_window = true,
			window = {
				mappings = {
					["<space>"] = "none",
				},
			},
			source_selector = {
				winbar = true,
			},
		},
		config = function(_, opts)
			vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1]])
			require("neo-tree").setup(opts)
			vim.keymap.set("n", "<leader>n", function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
			end, { desc = "NeoTree: [n]avigation" })
		end,
	},
	-- Status line
	-- Link: https://github.com/nvim-lualine/lualine.nvim
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "onenord",
				globalstatus = true,
			},
			extensions = {
				"neo-tree",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					"filename",
					{
						function()
							return require("nvim-navic").get_location()
						end,
					},
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "lsp_status" },
			},
		},
	},
	-- Buffer line
	-- Link: https://github.com/akinsho/bufferline.nvim
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				numbers = "buffer_id",
				always_show_buffer_line = true,
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "neo-tree",
						text = "File explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
			vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
			vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
		end,
	},
	-- Remove buffers
	-- Link: https://github.com/echasnovski/mini.bufremove
	{
		"echasnovski/mini.bufremove",
		keys = {
			{
				"<leader>cc",
				function()
					require("mini.bufremove").delete(0, false)
				end,
				desc = "[cc]lose Buffer",
			},
			{
				"<leader>cC",
				function()
					require("mini.bufremove").delete(0, true)
				end,
				desc = "[cC]lose Buffer (Force)",
			},
		},
	},
	-- Notification manager
	-- Link: https://github.com/rcarriga/nvim-notify
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>dn",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Notify: [d]ismiss [n]otifications",
			},
			{
				"<leader>fn",
				"<cmd>Telescope notify<cr>",
				desc = "[f]ind [n]otification",
			},
		},
		init = function()
			vim.notify = require("notify")
		end,
	},
}
