local status, packer = pcall(require, "packer")
if not status then
    print("Packer is not installed")
    return
end

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
    augroup packer_user_config
      autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use "olimorris/onedarkpro.nvim"
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'nvim-treesitter/nvim-treesitter'
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'nvim-telescope/telescope-project.nvim'
    use 'glepnir/dashboard-nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use 'romgrk/barbar.nvim'
    use 'nvim-orgmode/orgmode'
--    use 'williamboman/mason.nvim'
--    use 'williamboman/mason-lspconfig.nvim'
    use 'mfussenegger/nvim-jdtls'
    use 'akinsho/org-bullets.nvim'

    if packer_bootstrap then
        packer.sync()
    end
end)
