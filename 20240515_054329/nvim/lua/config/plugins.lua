local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug 'numToStr/Comment.nvim'

Plug('iamcco/markdown-preview.nvim')
Plug('williamboman/mason.nvim')
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason-lspconfig.nvim')
Plug('ray-x/lsp_signature.nvim')

Plug('p00f/clangd_extensions.nvim')
Plug('feline-nvim/feline.nvim')

Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

Plug('akinsho/toggleterm.nvim')
Plug('folke/trouble.nvim')

Plug('nvim-treesitter/nvim-treesitter')
Plug('nvim-treesitter/nvim-treesitter-refactor')
Plug('lukas-reineke/indent-blankline.nvim')

Plug('nvim-tree/nvim-web-devicons')
Plug('romgrk/barbar.nvim')

Plug('Mofiqul/dracula.nvim')
Plug('navarasu/onedark.nvim')
Plug("folke/tokyonight.nvim")
Plug('savq/melange-nvim')

Plug('nvim-lualine/lualine.nvim')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')

vim.call('plug#end')
