-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  if vim.g.vscode then
    -- VSCode Neovim
  else
    -- ordinary Neovim
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
        require("rose-pine").setup()
        vim.cmd('colorscheme rose-pine')
      end
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('mbbill/undotree')
    use('theprimeagen/harpoon')
    use('tpope/vim-fugitive')

    use('aspeddro/gitui.nvim')

    use('lukas-reineke/indent-blankline.nvim')

    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},         -- Required
        {'hrsh7th/cmp-nvim-lsp'},     -- Required
        {'hrsh7th/cmp-buffer'},       -- Optional
        {'hrsh7th/cmp-path'},         -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},     -- Optional

        -- Snippets
        {'L3MON4D3/LuaSnip'},             -- Required
        {'rafamadriz/friendly-snippets'}, -- Optional
      }
    }

    use {
      "kevinhwang91/nvim-ufo",
      opt = true,
      event = { "BufReadPre" },
      wants = { "promise-async" },
      requires = "kevinhwang91/promise-async",
      config = function()
        require("ufo").setup {
          provider_selector = function(bufnr, filetype)
            return { "lsp", "treesitter" }
          end,
        }
        vim.keymap.set("n", "zR", require("ufo").openAllFolds)
        vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      end,
    }

  end

end)
