return {
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonUnisntall" },
	build = ":MasonUpdate",
	config = function()
		require("mason").setup()
	end,
}
