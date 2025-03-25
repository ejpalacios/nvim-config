local M = {}

M.autoformat = true

function M.format(buffer)
	if M.autoformat == false then
		return
	end
	local ft = vim.bo[buffer].filetype
	local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

	vim.lsp.buf.format({
		bufnr = buffer,
		filter = function(client)
			if have_nls then
				return client.name == "null-ls"
			end
			return client.name ~= "null-ls"
		end,
	})
end

function M.on_attach(client, buffer)
	-- dont format if client disabled it
	if
		client.config
		and client.config.capabilities
		and client.config.capabilities.documentFormattingProvider == false
	then
		return
	end

	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("LspFormat." .. buffer, {}),
			buffer = buffer,
			callback = function()
				if M.autoformat then
					M.format(buffer)
				end
			end,
		})
		vim.api.nvim_buf_create_user_command(buffer, "Format", function(_)
			M.format(buffer)
		end, { desc = "Format current buffer" })
	end
end

vim.api.nvim_create_user_command("FormatOnSave", function()
	M.autoformat = not M.autoformat
	if M.autoformat then
		vim.notify("Setting autoformatting to: " .. tostring(M.autoformat), vim.log.levels.INFO)
	else
		vim.notify("Setting autoformatting to: " .. tostring(M.autoformat), vim.log.levels.WARN)
	end
end, { desc = "Activate autoformattin on save" })

return M
