return {
	-- Diagnostics
	-- Link: https://github.com/folke/trouble.nvim
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	-- Terminal
	-- Link: https://github.com/akinsho/toggleterm.nvim
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			shade_terminals = true,
			open_mapping = [[<c-\>]],
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)
			vim.api.nvim_create_autocmd("TermOpen", {
				group = vim.api.nvim_create_augroup("ToggleTermKeys", { clear = true }),
				pattern = { "term://*" },
				callback = function()
					vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = 0, desc = "Leave terminal" })
					vim.keymap.set("t", "jk", [[<C-\><C-n>]], { buffer = 0, desc = "Leave terminal" })
					vim.keymap.set("n", "<C-h>", "<C-w>h", { buffer = 0, desc = "Go to left window" })
					vim.keymap.set("n", "<C-j>", "<C-w>j", { buffer = 0, desc = "Go to lower window" })
					vim.keymap.set("n", "<C-k>", "<C-w>k", { buffer = 0, desc = "Go to upper window" })
					vim.keymap.set("n", "<C-l>", "<C-w>l", { buffer = 0, desc = "Go to right window" })
					vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { buffer = 0 })
					vim.keymap.set("t", "<C-Up>", "<cmd>resize +2<cr>", { buffer = 0, desc = "Increase window height" })
					vim.keymap.set(
						"t",
						"<C-Down>",
						"<cmd>resize -2<cr>",
						{ buffer = 0, desc = "Decrease window height" }
					)
					vim.keymap.set(
						"t",
						"<C-Left>",
						"<cmd>vertical resize -2<cr>",
						{ buffer = 0, desc = "Decrease window width" }
					)
					vim.keymap.set(
						"t",
						"<C-Right>",
						"<cmd>vertical resize +2<cr>",
						{ buffer = 0, desc = "Increase window width" }
					)
				end,
			})
		end,
	},
	-- Symbols outline
	-- Link: https://github.com/simrat39/symbols-outline.nvim
	{
		"simrat39/symbols-outline.nvim",
		keys = {
			{
				"<leader>sy",
				"<cmd>SymbolsOutline<cr>",
				desc = "Symbols outline",
			},
		},
		config = true,
	},
}
