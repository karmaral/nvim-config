if vim.g.vscode then

else
	-- ordinary Neovim
	require('gitsigns').setup {
	  signs = {
	    add = { text = '+' },
	    change = { text = '~' },
	    delete = { text = '_' },
	    topdelete = { text = '‾' },
	    changedelete = { text = '~' },
	  },
	}
end
