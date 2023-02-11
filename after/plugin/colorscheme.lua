vim.o.termguicolors = true

function ApplyColor(color)
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

if vim.g.vscode then
	-- VSCode Neovim
	ApplyColor('default')
else
	-- ordinary Neovim
	ApplyColor('rose-pine')
end
