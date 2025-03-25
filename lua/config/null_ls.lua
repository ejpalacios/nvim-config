local M = {}

local null_ls = require("null-ls")
M.settings = {
	-- Format
	prettier = function(source_name, methods)
		null_ls.register(null_ls.builtins.formatting.prettier.with({
			extra_filetypes = { "toml" },
		}))
	end,
	stylua = function(source_name, methods)
		null_ls.register(null_ls.builtins.formatting.stylua)
	end,
	shellharden = function(source_name, methods)
		null_ls.register(null_ls.builtins.formatting.shellharden)
	end,
	-- Linters
	shellcheck = function(source_name, methods)
		null_ls.register(null_ls.builtins.diagnostics.shellcheck)
	end,
	markdownlint = function(source_name, methods)
		null_ls.register(null_ls.builtins.diagnostics.markdownlint.with({
			extra_args = { "-r", "~MD013" },
		}))
	end,
	sqlfluff = function(source_name, methods)
		null_ls.register(null_ls.builtins.diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "postgres" },
		}))
		null_ls.register(null_ls.builtins.formatting.sqlfluff.with({
			extra_args = { "--dialect", "postgres" },
		}))
	end,
}

M.sources = vim.tbl_keys(M.settings)

return M
