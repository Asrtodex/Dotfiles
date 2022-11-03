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
    use {'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
            -- or                            , branch = '0.1.x',
            requires = { {'nvim-lua/plenary.nvim'} }
        }

    use {"nvim-telescope/telescope-file-browser.nvim",
            config = function()
            require("telescope").setup {
                extensions = {
                    file_browser = {
                        theme = "ivy",
                        -- disables netrw and use telescope-file-browser in its place
                        hijack_netrw = true,
                        mappings = {
                            ["i"] = {
                              -- your custom insert mode mappings
                            },
                            ["n"] = {
                              -- your custom normal mode mappings
                            },
                    },
                 },
                },
            }
            end
        }
    use { "nvim-telescope/telescope-project.nvim",
                require('telescope').setup {
                    extensions = {
                        project = {
                            base_dirs = {
                              '~/projects/django/apps/',
                            },
                            hidden_files = true, -- default: false
                            theme = "dropdown",
                            order_by = "asc",
                            sync_with_nvim_tree = true, -- default false
                        }
                    }
              }
        }
    use {'glepnir/dashboard-nvim'}
    use {"lukas-reineke/indent-blankline.nvim",
            config = function()
                require("indent_blankline").setup { filetype_exclude = { "dashboard" }
            }
            end
        }
    use {'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }
    use {'romgrk/barbar.nvim',}
    use {'nvim-orgmode/orgmode', config = function()
            require('orgmode').setup{}
            end
        }
    use { "williamboman/mason.nvim",
            require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
    }
    use { 'williamboman/mason-lspconfig.nvim',
    }
    use {'mfussenegger/nvim-jdtls'}
    require("telescope").load_extension "file_browser"
    if packer_bootstrap then
        packer.sync()
    end
end)
