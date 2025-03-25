-- Autocompletion
return {
	-- Autocompletion for buffer words
	-- Link: https://github.com/hrsh7th/cmp-buffer
	{
		"hrsh7th/cmp-buffer",
	},
	-- Autocompletion for filesystem paths
	-- Link: https://github.com/hrsh7th/cmp-path
	{
		"hrsh7th/cmp-path",
	},
	-- Autocompletion for LSP servers
	-- Link: https://github.com/hrsh7th/cmp-nvim-lsp
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	-- Autocompletion for Luasnip
	-- Link: https://github.com/saadparwaiz1/cmp_luasnip
	{
		"saadparwaiz1/cmp_luasnip",
	},
	-- Code snippets
	-- Link: https://github.com/L3MON4D3/LuaSnip
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
	},
	-- Additional VS Code style snippets
	-- Link: https://github.com/rafamadriz/friendly-snippets
	{
		"rafamadriz/friendly-snippets",
		dependencies = {
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	-- Adds pictograms next to autocomplete options
	-- Link: https://github.com/onsails/lspkind.nvim
	{
		"onsails/lspkind.nvim",
	},
	-- Link: https://github.com/hrsh7th/nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")
			luasnip.config.setup()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "path" },
					{ name = "nvim_lsp", keyword_length = 1 },
					{ name = "buffer", keyword_length = 3 },
					{ name = "luasnip", keyword_length = 2 },
				}),
				window = {
					documentation = cmp.config.window.bordered(),
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
						before = function(entry, vim_item)
							return vim_item
						end,
					}),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
			})
		end,
	},
}
