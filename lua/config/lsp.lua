local M = {}

M.settings = {
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
	texlab = {
		texlab = {
			build = {
				executable = "latexmk",
				args = {
					"-pdf",
					"-interaction=nonstopmode",
					"-synctex=1",
					"-pv",
				},
				onSave = true,
			},
			forwardSearch = {
				executable = "evince-synctex",
				args = {
					"-f",
					"%l",
					"%p",
					'"texlab -i %f -l %l"',
				},
			},
		},
	},
	pylsp = {
		pylsp = {
			plugins = {
				pycodestyle = {
					enabled = false,
				},
				pydocstyle = {
					enabled = true,
					convention = "google",
				},
				mccabe = {
					enabled = true,
				},
				pyflakes = {
					enabled = true,
				},
				autopep8 = {
					enabled = false,
				},
				yapf = {
					enabled = false,
				},
				black = {
					enabled = true,
				},
			},
		},
	},
	dockerls = {
		telemetry = {
			enableTelemetry = false,
		},
	},
	docker_compose_language_service = {
		telemetry = {
			enableTelemetry = false,
		},
	},
	ltex = {
		ltex = {
			language = "en-GB",
		},
	},
	sqlls = {},
	bashls = {},
	jdtls = {},
	r_language_server = {},
}

M.sources = vim.tbl_keys(M.settings)

return M
