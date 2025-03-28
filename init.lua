-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Configure editor
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
require("config.options")
require("config.autocmds")
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Install lazy.nvim package manager
-- Link: https://github.com/folke/lazy.nvim
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Install and configure plugins
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
require("lazy").setup("plugins")

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Configure keymaps
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
require("config.keymaps")
