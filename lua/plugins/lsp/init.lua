-- This function gets run when an LSP connects to a particular buffer.
return {
	-- LSP status widget
	-- Link: https://github.com/j-hui/fidget.nvim
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	-- Display code context
	-- Link: https://github.com/SmiteshP/nvim-navic
	{
		"SmiteshP/nvim-navic",
	},
	-- LSP configuration
	-- Link: https://github.com/neovim/nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"SmiteshP/nvim-navic",
			"j-hui/fidget.nvim",
		},
		opts = {
			servers = require("config.lsp").settings,
		},
		config = function(_, opts)
			-- vim.lsp.set_log_level("debug")
			-- Setup formatting, keymaps, diagnostics, and symbols
			require("plugins.lsp.util").on_attach(function(client, buffer)
				require("plugins.lsp.format").on_attach(client, buffer)
				require("plugins.lsp.keymaps").on_attach(client, buffer)
				require("plugins.lsp.diagnostic").on_attach(client, buffer)
				require("plugins.lsp.docsymbols").on_attach(client, buffer)
			end)
			-- Configure hover and signature help boxes
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
			-- Load list of servers from options
			local servers = opts.servers
			-- Broadcast to LSP servers the capabilities of nvim-cmp
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			require("mason-lspconfig").setup_handlers({
				-- This function applies to all installed LSPs
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = vim.deepcopy(capabilities),
						settings = servers[server_name],
					})
				end,
			})
		end,
	},
	-- Formatting
	-- Link: https://github.com/nvimtools/none-ls.nvim
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"jay-babu/mason-null-ls.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup()
		end,
	},
}
