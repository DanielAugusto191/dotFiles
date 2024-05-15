local vim = vim

require("config")
vim.cmd([[
set autoread shiftwidth=4 mouse=a smarttab autoindent smartindent cindent showcmd number  encoding=utf8 t_Co=256 noswapfile splitbelow cursorline completeopt=menu,menuone,noselect syntax=true termguicolors colorcolumn=81

let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'julia', 'vim', 'rust', 'sml', 'c', 'cpp', 'typescript', 'javascript', 'go']

"" must tu be be}fore colorscheme
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red
]])

vim.cmd('colorscheme dracula')

require("telescope").setup()

require("Comment").setup()
require("ibl").setup()
require('feline').setup()
require('lualine').setup()
require("mason").setup()
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
