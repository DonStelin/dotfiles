return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
		check_ts = true,
		ts_config = {
			["*"] = { "string" },
		},
		enable_check_bracket_line = true,
		enable_moveright = true,
		enable_afterquote = true,
		map_bs = true,
	},
}
