return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			-- test is working
		}, -- this will use the default setup
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
}
