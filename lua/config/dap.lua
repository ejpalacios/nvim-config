local M = {}

local dap = require("dap")
M.settings = {
    python = function(config)
        dap.adapters.python = {
            type = "executable",
            command = "debugpy-adapter",
        }

        local venv_path = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
        dap.configurations.python = {
            {
                type = "python",
                request = "launch",
                name = "Python: Launch file (Default)",
                program = "${file}", -- This configuration will launch the current file if used.
                pythonPath = venv_path and (venv_path .. "/bin/python") or nil,
            },
        }
        local a = require("dap.ext.vscode").load_launchjs(nil, { "python" })
        table.insert(dap.configurations.python, a)
        require('mason-nvim-dap').default_setup(config)
    end,
}

M.sources = vim.tbl_keys(M.settings)

return M
