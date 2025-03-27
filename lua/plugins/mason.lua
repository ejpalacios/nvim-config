return {
	-- Graphical installer for LSP, linters, formatters, and DAP
	-- Link: https://github.com/williamboman/mason.nvim
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	-- Configuration for LSP servers
	-- Link: https://github.com/williamboman/mason-lspconfig.nvim
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = require("config.lsp").sources,
		},
	},
	-- Configuration for Linters and formatters
	-- Link: https://github.com/jay-babu/mason-null-ls.nvim
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = require("config.null_ls").sources,
			handlers = require("config.null_ls").settings,
		},
	},
	-- Configuration for DAPs
	-- Link: https://github.com/jay-babu/mason-nvim-dap.nvim
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = require("config.dap").sources,
			handlers = require("config.dap").settings,
		},
	},
}
