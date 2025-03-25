return {
	-- Autopairs
	-- Link: https://github.com/windwp/nvim-autopairs
	{
		"windwp/nvim-autopairs",
		config = true,
	},
	-- Editing of surrounding elements
	-- Link: https://github.com/tpope/vim-surround
	{
		"tpope/vim-surround",
	},
	-- Allow repeating actions of plugins
	-- Link: https://github.com/tpope/vim-repeat
	{
		"tpope/vim-repeat",
	},
	-- Git utilities
	-- Link: https://github.com/tpope/vim-fugitive
	{
		"tpope/vim-fugitive",
	},
	-- Quick motions
	-- https://github.com/ggandor/eeap.nvim
	{
		"ggandor/leap.nvim",
		keys = {
			{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
			{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
		},
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			leap.add_default_mappings(true)
			vim.keymap.del({ "x", "o" }, "x")
			vim.keymap.del({ "x", "o" }, "X")
		end,
	},
	-- Additional Quick motions
	-- https://github.com/ggandor/flit.nvim
	{
		"ggandor/flit.nvim",
		dependencies = {
			"ggandor/leap.nvim",
		},
		keys = function()
			local ret = {}
			for _, key in ipairs({ "f", "F", "t", "T" }) do
				ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
			end
			return ret
		end,
		opts = { labeled_modes = "nx" },
	},
	-- Show key bindings
	-- Link: https://github.com/folke/which-key.nvim
	{
		"folke/which-key.nvim",
		config = true,
	},
	-- Additional text objects
	-- Link: https://github.com/wellle/targets.vim
	{
		"wellle/targets.vim",
	},
	-- Markdown previewer
	-- Link: https://github.com/iamcco/markdown-preview.nvim
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		init = function()
			vim.g.mkdp_theme = "dark"
		end,
		keys = {
			{ "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "Open Markdown Preview" },
			{ "<leader>mc", "<cmd>MarkdownPreviewStop<cr>", desc = "Close Markdown Preview" },
		},
	},
}
