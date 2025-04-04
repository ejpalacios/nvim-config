local M = {}

function M.on_attach(client, buffer)
	-- Define diagnostics UI
	vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
	vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
	vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
	vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵 ", texthl = "DiagnosticSignHint" })
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = buffer,
		callback = function()
			local options = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "CursorMovedI", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
				scope = "cursor",
			}
			vim.diagnostic.config({
				underline = true,
				virtual_text = false,
				severity_sort = true,
			})
			vim.diagnostic.open_float(nil, options)
		end,
	})
end

return M
