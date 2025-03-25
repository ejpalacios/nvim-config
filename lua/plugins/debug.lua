return {
	-- Debuggin UI
	-- Link: https://github.com/rcarriga/nvim-dap-ui
	{
		"rcarriga/nvim-dap-ui",
	},
	-- Neovim IO
	-- Link: https://github.com/nvim-neotest/nvim-nio
	{
		"nvim-neotest/nvim-nio",
	},
	-- Debugging
	-- Link: https://github.com/mfussenegger/nvim-dap
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			local dap = require("dap")

			-- Basic debugging keymaps, feel free to change to your liking!
			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Continue" })
			vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step into" })
			vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step over" })
			vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step out" })
			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Breakpoint condition" })

			-- Dap UI setup
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close
		end,
	},
}
