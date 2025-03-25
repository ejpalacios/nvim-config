return {
	-- Graphical installer for LSP, linters, formatters, and DAP
	-- Link: https://github.com/williamboman/mason.nvim
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
		end,
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
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end,
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
		config = function(_, opts)
			require("mason-null-ls").setup(opts)
		end,
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
		config = function(_, opts)
			require("mason-nvim-dap").setup(opts)
		end,
	},
}
