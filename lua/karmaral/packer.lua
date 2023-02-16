return require('packer').startup(function(use)
	-- Package Manager
	use 'wbthomason/packer.nvim'

	if vim.g.vscode then
		-- VSCode Neovim
	else
		-- ordinary Neovim

		use { -- LSP Configuration & Plugins
			'neovim/nvim-lspconfig',
			requires = {
				-- Automatically install LSPs to stdpath for neovim
				'williamboman/mason.nvim',
				'williamboman/mason-lspconfig.nvim',

				-- Useful status updates for LSP
				'j-hui/fidget.nvim',

				-- Additional lua configuration, makes nvim stuff amazing
				'folke/neodev.nvim',
			},
		}

		use { -- Autocompletion
			'hrsh7th/nvim-cmp',
			requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
		}

		use { -- Highlight, edit, and navigate code
			'nvim-treesitter/nvim-treesitter',
			run = function()
				pcall(require('nvim-treesitter.install').update { with_sync = true })
			end,
		}

		use { -- Additional text objects via treesitter
			'nvim-treesitter/nvim-treesitter-textobjects',
			after = 'nvim-treesitter',
		}

		use 'gpanders/editorconfig.nvim'

		-- Git related plugins
		use 'tpope/vim-fugitive'
		use 'tpope/vim-rhubarb'
		use 'lewis6991/gitsigns.nvim'
		use 'aspeddro/gitui.nvim'

		use ({ 'rose-pine/neovim', as = 'rose-pine' })
		use 'navarasu/onedark.nvim' -- Theme inspired by Atom
		use 'nvim-lualine/lualine.nvim' -- Fancier statusline
		use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
		use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
		use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
		use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'} -- Folding

		use {
			'nvim-tree/nvim-tree.lua',
			requires = { 'nvim-tree/nvim-web-devicons' }
		}
		-- Fuzzy Finder (files, lsp, etc)
		use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

		-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
		use { 'nvim-telescope/telescope-fzf-native.nvim',
			run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }


	end

end)
