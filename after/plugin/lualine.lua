if vim.g.vscode then
	--- VSCode Neovim
	else
	-- ordinary Neovim
	require('lualine').setup {
		options = {
			icons_enabled = false,
			theme = 'rose-pine',
			component_separators = '|',
			section_separators = '',
		}
	}
end
