vim.opt.matchpairs = vim.opt.matchpairs +  "<:>"

if vim.g.vscode then
	-- VSCode Neovim
else
	-- ordinary Neovim

	vim.g.netrw_liststyle = 3

	vim.opt.nu = true
	vim.opt.rnu = true

	vim.opt.tabstop = 2
	vim.opt.softtabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.expandtab = true

	vim.opt.smartindent = true

	vim.opt.wrap = false

	vim.opt.mouse = 'a'

	vim.opt.breakindent = true

	vim.opt.swapfile = false
	vim.opt.backup = false

	vim.opt.undofile = true
	vim.opt.undodir = os.getenv('USERPROFILE') .. '/.vim/undodir/'

	vim.opt.hlsearch = false
	vim.opt.incsearch = true

	-- Case insensitive searching UNLESS /C or capital in search
	vim.opt.ignorecase = true
	vim.opt.smartcase = true

	vim.opt.updatetime = 50
	vim.o.scrolloff = 8
	vim.wo.signcolumn = 'yes'

	-- Set completeopt to have a better completion experience
	vim.o.completeopt = 'menuone,noselect'
end

-- Yank Highlight
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})
