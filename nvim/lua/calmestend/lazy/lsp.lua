return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "L3MON4D3/LuaSnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        require("conform").setup({})

				local capabilities = vim.tbl_deep_extend(
					"force",
					{},
					vim.lsp.protocol.make_client_capabilities()
				)


        require("fidget").setup({})

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
                Lua = {
                    format = {
                        enable = true,
                        defaultConfig = {
                            indent_style = "space",
                            indent_size = "2",
                        },
                    },
                },
            },
        })

        vim.lsp.config("gopls", {
            capabilities = capabilities,
        })

        vim.lsp.config("nixd", {
            capabilities = capabilities,
        })

        vim.lsp.config("qmlls", {
            capabilities = capabilities,
        })

        vim.lsp.config("ts_ls", {
            capabilities = capabilities,
        })

        vim.lsp.config("tailwindcss", {
            capabilities = capabilities,
            filetypes = {
                "html",
                "css",
                "scss",
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "vue",
                "svelte",
                "heex",
            },
        })

        vim.lsp.config("zls", {
            capabilities = capabilities,
            root_dir = vim.fs.root(0, { ".git", "build.zig", "zls.json" }),
            settings = {
                zls = {
                    enable_inlay_hints = true,
                    enable_snippets = true,
                    warn_style = true,
                },
            },
        })

        vim.lsp.enable({
            "lua_ls",
            "gopls",
            "nixd",
            "tailwindcss",
            "zls",
						"qmlls",
						"ts_ls"
        })

        vim.g.zig_fmt_parse_errors = 0
        vim.g.zig_fmt_autosave = 0

        vim.diagnostic.config({
            float = {
                focusable = true,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
}
