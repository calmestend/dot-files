return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"stevearc/conform.nvim",
		"L3MON4D3/LuaSnip",
		"j-hui/fidget.nvim",
	},
	config = function()
		require("conform").setup({})
		require("fidget").setup({})

		vim.diagnostic.config({
			underline = true,
			update_in_insert = false,
			virtual_text = {
				spacing = 2,
				source = "if_many",
				prefix = "●",
			},
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = " ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		})

		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			{
				workspace = {
					fileOperations = {
						didRename = true,
						willRename = true,
					},
				},
			}
		)

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local client = vim.lsp.get_client_by_id(args.data.client_id)

				local function map(mode, lhs, rhs, desc, cond)
					if cond == nil or cond then
						vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
					end
				end

				map("n", "gd", vim.lsp.buf.definition, "Goto Definition", client.supports_method("textDocument/definition"))
				map("n", "gr", vim.lsp.buf.references, "References")
				map("n", "gI", vim.lsp.buf.implementation, "Goto Implementation")
				map("n", "gy", vim.lsp.buf.type_definition, "Goto T[y]pe Definition")
				map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
				map("n", "K", vim.lsp.buf.hover, "Hover")
				map("n", "gK", vim.lsp.buf.signature_help, "Signature Help", client.supports_method("textDocument/signatureHelp"))
				map("i", "<c-k>", vim.lsp.buf.signature_help, "Signature Help", client.supports_method("textDocument/signatureHelp"))
				map({"n", "x"}, "<leader>ca", vim.lsp.buf.code_action, "Code Action", client.supports_method("textDocument/codeAction"))
				map({"n", "x"}, "<leader>cc", vim.lsp.codelens.run, "Run Codelens", client.supports_method("textDocument/codeLens"))
				map("n", "<leader>cC", vim.lsp.codelens.refresh, "Refresh & Display Codelens", client.supports_method("textDocument/codeLens"))
				map("n", "<leader>cr", vim.lsp.buf.rename, "Rename", client.supports_method("textDocument/rename"))

			end,
		})

		vim.lsp.enable(
			{ 
				"lua_ls", 
				"gopls", 
			}
		)
	end,
}
