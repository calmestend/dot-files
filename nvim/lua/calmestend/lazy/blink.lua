---@diagnostic disable: undefined-doc-name
return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "enter" },
		appearance = {
			nerd_font_variant = "mono",
			kind_icons = {
				Text = "󰉿",
				Method = "󰊕",
				Function = "󰊕",
				Constructor = "󰒓",

				Field = "󰜢",
				Variable = "󰆦",
				Property = "󰖷",

				Class = "󱡠",
				Interface = "󱡠",
				Struct = "󱡠",
				Module = "󰅩",

				Unit = "󰪚",
				Value = "󰦨",
				Enum = "󰦨",
				EnumMember = "󰦨",

				Keyword = "󰻾",
				Constant = "󰏿",

				Snippet = "󱄽",
				Color = "󰏘",
				File = "󰈔",
				Reference = "󰬲",
				Folder = "󰉋",
				Event = "󱐋",
				Operator = "󰪚",
				TypeParameter = "󰬛",
			},
		},
		signature = { enabled = true },

		completion = {
			documentation = { auto_show = true },
			list = {
				selection = {
					preselect = true,
					auto_insert = true,
				},
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = {
			implementation = "prefer_rust",
			max_typos = function(keyword)
				return math.floor(#keyword / 4)
			end,
			frecency = {
				enabled = true,
				unsafe_no_lock = false,
			},
			use_proximity = true,
			sorts = {
				"score",
				"sort_text",
			},
			prebuilt_binaries = {
				download = true,
				ignore_version_mismatch = false,
				force_version = "1.*",
				force_system_triple = nil,
				extra_curl_args = {},
			},
		},
	},
}
