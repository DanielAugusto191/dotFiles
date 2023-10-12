set mouse=a tabstop=4 shiftwidth=4 smarttab autoindent smartindent cindent showcmd number relativenumber encoding=utf8 t_Co=256 noswapfile splitbelow cursorline completeopt=menu,menuone,noselect
""let &t_ut=''

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red


inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha

"" move lines
nnoremap <silent> <A-h> <Cmd>BufferPrevious<CR>
nnoremap <silent> <A-l> <Cmd>BufferNext<CR>
nnoremap <silent> <A-w> <Cmd>BufferClose<CR>
nnoremap <silent> <A-s-w> <Cmd>BufferRestore<CR>
nnoremap <silent> <A-,> <Cmd>BufferMovePrevious<CR>
nnoremap <silent> <A-.> <Cmd>BufferMoveNext<CR>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


call plug#begin()
Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'p00f/clangd_extensions.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'


Plug 'Mofiqul/dracula.nvim'
Plug 'savq/melange-nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }

call plug#end()

syntax enable
set termguicolors
colorscheme melange
let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim', 'rust', 'sml', 'c', 'cpp', 'typescript', 'javascript', 'go']

lua <<EOF
require("mason").setup()
require("telescope").setup()
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {desc = "Search Text"})
vim.keymap.set('n', 'fb', builtin.buffers, {}) 
vim.keymap.set('n', 'fh', builtin.help_tags, {})

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {noremap = true, silent = true, desc = "Goto Definition" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {noremap = true, silent = true, desc = "Goto Declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {noremap = true, silent = true})
vim.keymap.set("n", "go", vim.lsp.buf.type_definition, {noremap = true, silent = true})

vim.keymap.set("n", "gr", "<cmd>ClangdToggleInlayHints<cr>", {})


require("nvim-treesitter").setup {
	ensure_installed = { 'c', 'cpp', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vim' },
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
}

local cmp = require'cmp'
cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
	  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.abort(),
	  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
	  { name = 'nvim_lsp' },
	}, {
	  { name = 'buffer' },
	})
})

require("clangd_extensions").setup()
require("barbar").setup()

require("toggleterm").setup({
	size = 20,
		function(term)
		if term.direction == "horizontal" then
		  return 15
		elseif term.direction == "vertical" then
		  return vim.o.columns * 0.4
		end
	end,
  open_mapping = [[<C-l>]],
  start_in_insert = true,
  direction = 'float',
})
require("mason-lspconfig").setup({
	automatic_installation = true,
	ensure_installed = { "clangd", "rust_analyzer", "cmake"}
})
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.clangd.setup({
})

EOF
