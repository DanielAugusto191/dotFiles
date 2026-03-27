local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug 'numToStr/Comment.nvim'
Plug 'Thiago4532/mdmath.nvim'
Plug 'chrisbra/unicode.vim'
Plug 'RaafatTurki/hex.nvim'
Plug 'Julian/lean.nvim'

Plug('iamcco/markdown-preview.nvim')
Plug('williamboman/mason.nvim')
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason-lspconfig.nvim')
Plug('ray-x/lsp_signature.nvim')

Plug('sindrets/diffview.nvim')

Plug('stevearc/conform.nvim') -- Formatter
Plug('github/copilot.vim')
Plug('milanglacier/minuet-ai.nvim')

-- Debug
Plug('mfussenegger/nvim-dap')
Plug('nvim-neotest/nvim-nio')
Plug('rcarriga/nvim-dap-ui')
Plug('theHamsta/nvim-dap-virtual-text')

Plug('p00f/clangd_extensions.nvim')
Plug('feline-nvim/feline.nvim')
Plug('jbyuki/nabla.nvim')

Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('mfussenegger/nvim-lint')

Plug('akinsho/toggleterm.nvim')
Plug('morhetz/gruvbox')
Plug('nvim-treesitter/nvim-treesitter')
Plug('lukas-reineke/indent-blankline.nvim')

Plug('nyoom-engineering/oxocarbon.nvim')

Plug('nvim-tree/nvim-web-devicons')
Plug('romgrk/barbar.nvim')

-- Themes
Plug('Mofiqul/dracula.nvim')
Plug('navarasu/onedark.nvim')
Plug("folke/tokyonight.nvim")
Plug('savq/melange-nvim')

Plug('nvim-lualine/lualine.nvim')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-telescope/telescope-fzf-native.nvim')

Plug('folke/which-key.nvim')

vim.call('plug#end')
