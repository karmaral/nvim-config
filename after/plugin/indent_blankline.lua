if vim.g.vscode then
	-- VSCode Neovim
	else
	-- ordinary Neovim
	require('indent_blankline').setup {
		show_current_context = true,
		char = '┊',
		show_trailing_blankline_indent = false,
	}
	-- this is already default but I'm including it for the api
	local LabelHl = vim.api.nvim_get_hl_by_name('Label', true)
	vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', {fg = LabelHl.fg})

	vim.api.nvim_set_hl(0, 'IndentBlanklineChar', {fg = '#222033' })
end

