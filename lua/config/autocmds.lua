-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	desc = "Close Popup windows with q",
	group = vim.api.nvim_create_augroup("CloseWith_q", { clear = true }),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"query", -- :InspectTree
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"lazy",
		"mason",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	desc = "Apply wrap and spell check to text files",
	group = vim.api.nvim_create_augroup("Wrap&Spell", { clear = true }),
	pattern = { "gitcommit", "markdown", "tex", "bib" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

