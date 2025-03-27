local M = {}

function M.on_attach(client, buffer)
	-- Easier mapping of keys
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = buffer, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[c]ode [a]ction")

	nmap("gd", vim.lsp.buf.definition, "[g]oto [d]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[g]oto [r]eferences")
	nmap("gR", vim.lsp.buf.references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[g]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[d]ocument [s]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[w]orkspace [s]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[g]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[w]orkspace [a]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[w]orkspace [r]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[w]orkspace [l]ist Folders")

	-- -- Create a command `:Format` local to the LSP buffer
	-- vim.api.nvim_buf_create_user_command(buffer, "FormatLsp", function(_)
	--     vim.lsp.buf.format({ bufnr = buffer })
	-- end, { desc = "Format current buffer with LSP" })
	--
	-- if client.server_capabilities.documentSymbolProvider then
	--     require("nvim-navic").attach(client, buffer)
	-- end
end

return M
