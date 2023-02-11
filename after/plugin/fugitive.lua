if vim.g.vscode then
else
	-- ordinary Neovim
	vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
end
