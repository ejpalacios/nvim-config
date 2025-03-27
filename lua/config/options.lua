-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Map the <space> as the leader key
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Editor options
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Enable auto write
vim.opt.autowrite = true
-- Background colour
vim.opt.background = "dark"
-- Enable colours in terminal
vim.opt.termguicolors = true
-- Sync clipboard from OS
vim.opt.clipboard = "unnamedplus"
-- Autocompletion options
vim.opt.completeopt = "menu,menuone,noselect"
-- Enhanced autocompletion menu
vim.opt.wildmenu = true
-- Give more space for displaying messages.
vim.opt.cmdheight = 1
-- Decrease update time
vim.opt.updatetime = 250
-- Set timeout enable
vim.opt.timeout = true
-- Set time to timeout of command
vim.opt.timeoutlen = 200
-- Keep sign column always
vim.opt.signcolumn = "yes"
-- Show line number
vim.opt.number = true
-- Relative line numbers
vim.opt.relativenumber = true
-- Increase the width of line numbers
vim.opt.numberwidth = 4
-- Number of spaces for a Tab
vim.opt.tabstop = 4
-- Size of the indent
vim.opt.shiftwidth = 4
-- Use spaces instead of tabs
vim.opt.expandtab = true
-- Insert indent automatically
vim.opt.smartindent = true
-- Enable break indent
vim.opt.breakindent = true
-- Enable mouse use
vim.opt.mouse = "a"
-- Save undo history
vim.opt.undofile = true
-- Disable line wrap
vim.opt.wrap = false
-- Split vertical windows to right
vim.opt.splitright = true
-- Split horizontal windows below
vim.opt.splitbelow = true
-- Disable mode showing
vim.opt.showmode = false
-- Highlight current line
vim.opt.cursorline = true

-- Define diagnostics UI
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	severity_sort = true,
})
