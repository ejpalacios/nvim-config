local M = {}

function M.on_attach(client, buffer)
	-- Document symbols
	if client.server_capabilities.documentSymbolProvider then
		require("nvim-navic").attach(client, buffer)
	end
end

return M
