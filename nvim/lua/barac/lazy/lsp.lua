return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	dependencies = {
		"nvimdev/lspsaga.nvim",
		"williamboman/mason.nvim",
	},
	config = function()
		--Ensuring LSP-Config Is Working
		local lsp_config_status, lsp_config = pcall(require, "lspconfig")
		local mason = require("mason")
		mason.setup()

		if not lsp_config_status then
			print("LSP-Config Is Not Working")
			return
		end
		--Ensuring LSP-Saga Is Working
		local lsp_saga_status, lsp_saga = pcall(require, "lspsaga")
		if not lsp_saga_status then
			print("LSP Saga Is Not Working")
			return
		end

		--LSP Saga Setup
		lsp_saga.setup({
			symbol_in_winbar = {
				enable = false,
			},
			lightbulb = {
				enable = false,
			},
			ui = {
				border = "rounded",
				title = false,
			},
		})
		--Disabeling The Sign Column In Diagnostics
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			signs = false,
		})

		--LSP-Config Setup
		-- Keybinds For LSP Servere
		local on_attach = function(client, bufnr)
			local keymap = vim.keymap
			-- keybind Options
			local opts = { noremap = true, silent = true, buffer = bufnr }
			-- Keybinds
			keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)      -- show definition, references
			keymap.set("n", "go", "<cmd>Lspsaga outline<CR>", opts)     -- show LSP outine of current buffer
			keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
			keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
			keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
			keymap.set("n", ";.", "<cmd>Lspsaga hover_doc<CR>", opts)   -- show documentation for what is under cursor
		end

		--Capabilities With Nvim-CMP
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		local servers = {
			"html",
			"ts_ls",
			"lua_ls",
			"emmet_ls",
			"pyright",
			"zls",
			"jdtls",
			"svelte",
			"nixd",
			"clangd",
			"intelephense",
		}

		--Servers Setup
		for _, server in pairs(servers) do
			if server == "lua-language-server" then
				goto continue
			end

			lsp_config[server].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			::continue::
		end

		-- Lua Setup
		lsp_config.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "lua" },
		})

		-- Typescript/Javascript Setup
		lsp_config.ts_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "js", "ts", "tsx", "jsx" },
		})

		-- Svelte Setup
		lsp_config.svelte.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "svelte" },
		})

		lsp_config.ts_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "js", "ts", "tsx", "jsx" },
		})

		-- Python
		lsp_config.pyright.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "py" },
		})

		-- Html Setup
		lsp_config.html.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "html" },
		})

		-- Emmet Setup
		lsp_config.emmet_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "html" },
		})

		-- Zig Setup
		lsp_config.zls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "zig" },
		})

		-- Nix Setup
		lsp_config.nixd.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "nix" },
		})

		-- Java Setup
		lsp_config.jdtls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "java" },
		})

		-- C/C++ Setup
		lsp_config.clangd.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "c", "cpp" },
		})

		-- PHP Setup
		lsp_config.intelephense.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "php", "blade" },
		})
	end,
}
