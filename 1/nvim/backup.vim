set autoread mouse=a tabstop=4 shiftwidth=4 smarttab autoindent smartindent cindent showcmd number  encoding=utf8 t_Co=256 noswapfile splitbelow cursorline completeopt=menu,menuone,noselect relativenumber
" relativenumber
""let &t_ut=''

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha

"" dont judge me
nnoremap <silent> j jzz
nnoremap <silent> k kzz
nnoremap <silent> <A-h> <Cmd>BufferPrevious<CR>
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
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'ray-x/lsp_signature.nvim'

Plug 'p00f/clangd_extensions.nvim'

Plug 'feline-nvim/feline.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'folke/trouble.nvim'

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
colorscheme dracula
let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'julia', 'vim', 'rust', 'sml', 'c', 'cpp', 'typescript', 'javascript', 'go']

lua <<EOF
require("keymap")
require('feline').setup()
require("mason").setup()
require("telescope").setup()
local builtin = require('telescope.builtin')

vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {desc = "Search Text"})
vim.keymap.set('n', 'fb', builtin.buffers, {}) 
vim.keymap.set('n', 'fh', builtin.help_tags, {})

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>y", "\"+y")

--vim.keymap.set("n", 'K', vim.lsp.buf.hover, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {noremap = true, silent = true, desc = "Goto Definition" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {noremap = true, silent = true, desc = "Goto Declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {noremap = true, silent = true})
vim.keymap.set("n", "go", vim.lsp.buf.type_definition, {noremap = true, silent = true})
vim.keymap.set("n", "gs", vim.diagnostic.open_float, {noremap = true, silent = true})

vim.keymap.set("n", "gr", "<cmd>ClangdToggleInlayHints<cr>", {})


require("nvim-treesitter").setup {
	ensure_installed = { 'c', 'cpp', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vim', 'ocaml', 'sml'},
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
	  ['<CR>'] = cmp.mapping.confirm({ select = true }),
	  ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" })
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
	ensure_installed = { "clangd", "rust_analyzer", "lua_ls", "bashls", "arduino_language_server", "clojure_lsp", "dockerls", "gopls", "html", "jdtls", "tsserver", "kotlin_language_server", "texlab", "marksman", "matlab_ls", "ocamllsp", "jedi_language_server", "julials"}
})
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

require('mason-lspconfig').setup_handlers({
  function(server)
    lspconfig[server].setup({})
  end,
})
lspconfig.millet.setup({})
lspconfig.pyright.setup {}
lspconfig.clangd.setup{}
lspconfig.julials.setup({
})

require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    }
  })

require('trouble').setup()
EOF
