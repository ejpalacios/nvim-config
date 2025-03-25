return {
	-- Diagnostics
	-- Link: https://github.com/folke/trouble.nvim
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xd",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Trouble: [x]oggle [d]iagnostics",
			},
			{
				"<leader>xb",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Trouble: [x]oggle [b]uffer diagnostics",
			},
			{
				"<leader>xs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Trouble: [x]oggle [s]ymbols",
			},
			{
				"<leader>xL",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "Trouble: [x]oggle [L]SP Definitions / references / ...",
			},
			{
				"<leader>xl",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Trouble: [x]oggle [l]ocation List",
			},
			{
				"<leader>xf",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Trouble: [x]oggle Quick[f]ix List",
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
					vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = 0, desc = "Term: Leave" })
					vim.keymap.set("t", "jk", [[<C-\><C-n>]], { buffer = 0, desc = "Term: Leave" })
					vim.keymap.set("n", "<C-h>", "<C-w>h", { buffer = 0, desc = "Term: Go to left" })
					vim.keymap.set("n", "<C-j>", "<C-w>j", { buffer = 0, desc = "Term: Go to lower" })
					vim.keymap.set("n", "<C-k>", "<C-w>k", { buffer = 0, desc = "Term: Go to upper" })
					vim.keymap.set("n", "<C-l>", "<C-w>l", { buffer = 0, desc = "Term: Go to right" })
					vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { buffer = 0 })
					vim.keymap.set("t", "<C-Up>", "<cmd>resize +2<cr>", { buffer = 0, desc = "Term: Increase height" })
					vim.keymap.set(
						"t",
						"<C-Down>",
						"<cmd>resize -2<cr>",
						{ buffer = 0, desc = "Term: Decrease height" }
					)
					vim.keymap.set(
						"t",
						"<C-Left>",
						"<cmd>vertical resize -2<cr>",
						{ buffer = 0, desc = "Term: Decrease width" }
					)
					vim.keymap.set(
						"t",
						"<C-Right>",
						"<cmd>vertical resize +2<cr>",
						{ buffer = 0, desc = "Term: Increase width" }
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
				"<leader>so",
				"<cmd>SymbolsOutline<cr>",
				desc = "[s]ymbols [o]utline",
			},
		},
		config = true,
	},
}
