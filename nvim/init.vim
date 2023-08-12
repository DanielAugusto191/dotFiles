"Config
set mouse=a tabstop=4 shiftwidth=4 smarttab autoindent smartindent cindent showcmd number relativenumber encoding=utf8 t_Co=256 noswapfile splitbelow cursorline completeopt=menu,menuone,noselect
let &t_ut=''

" Tabs
autocmd VimEnter * tab all

" Keys
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha

" SpeelCheck
inoremap <F3> <ESC>:set spell!<CR>i
"ultilities
"" move lines
nnoremap <C-[> <ESC>:%y+<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
inoremap ` ```
" Plugins
call plug#begin()
Plug 'neovim/nvim-lspconfig'

Plug 'lewis6991/gitsigns.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'folke/neodev.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

Plug 'folke/trouble.nvim'

Plug 'simrat39/rust-tools.nvim'

Plug 'williamboman/mason.nvim'

Plug 'mfussenegger/nvim-lint'

Plug 'mhartington/formatter.nvim'

Plug 'ellisonleao/glow.nvim'

Plug 'michaelb/sniprun', {'do': 'sh install.sh'}

Plug 'folke/tokyonight.nvim'

	call plug#end()

" Themes
syntax enable
colorscheme tokyonight-storm
"" Transparence
highlight normal guibg=000000
highlight nontext guibg=000000

let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim', 'rust', 'sml', 'c', 'cpp', 'typescript', 'javascript', 'go']

lua <<EOF
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.clipboard = 'unnamedplus'
vim.o.undofile = true
vim.o.breakindent = trouble


require("mason").setup()
require("gitsigns").setup()
require("neodev").setup()
require("tokyonight").setup {
    transparent = true,
	terminal_colors = true,
    styles = {
		comments = {italic = true},
    	sidebars = "transparent",
    	floats = "transparent",
    }
}

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
pcall(require('telescope').load_extension, 'fzf')


require("nvim-treesitter").setup {
	ensure_installed = { 'c', 'cpp', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vim' },
	highlight = { enable = true },
	indent = { enable = true },
}
-- CMP

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

cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
}, {
  { name = 'buffer' },
})
})
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
	  { name = 'buffer' }
	}
})
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
	  { name = 'path' }
	}, {
	  { name = 'cmdline' }
	})
})

-- LSP
local on_attach2 = function(_, bufnr)
	print("BUF: " .. bufnr)
	local nmap = function(keys, func, desc)
		if desc then
		  desc = 'LSP: ' .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	nmap('gd', vim.lsp.buf.definitionn '[G]oto [D]efinition')
	nmap('gr', require('telescopenbuiltin').lsp_references, '[G]oto [R]eferences')
	nmap('gI', vim.lsp.buf.implennntation, '[G]oto [I]mplementation')
	nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, 'Hover Documentation')
	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
	nmap('<leader>e', vim.diagnostic.open_float, 'Open floating diagnostic message')

	-- Lesser used LSP functionality
	nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<leader>wl', function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
	vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.clangd.setup {};
lspconfig.ccls.setup {
	capabilities = capabilities,
    on_attach = function(_, bufnr)
    	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
    end,
	--on_attach = on_attach2,
	init_options = {
		compilationDatabaseDirectory = "build";
		index = {
		  threads = 0;
		};
		clang = {
		  excludeArgs = { "-frounding-math"} ;
		};
		cache = {
			directory = '/tmp/ccls-cache',
		}
	},
}

lspconfig.rust_analyzer.setup({
 -- on_attach=on_attach,
 settings = {
	 ["rust-analyzer"] = {
		 imports = {
			 granularity = {
				 group = "module",
			 },
			 prefix = "self",
		 },
		 cargo = {
			 buildScripts = {
				 enable = true,
			 },
		 },
		 procMacro = {
			 enable = true
		 },
	 }
 }
})
lspconfig.millet.setup {
	capabilities = capabilities,
    on_attach = function(_, bufnr)
    	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
    end,
--	on_attach = on_attach2,
}
lspconfig.tsserver.setup {}

-- MARKDOWN

require("glow").setup()

-- SNIPRUN

require("sniprun").setup({
	display = {"Classic"}, -- https://github.com/michaelb/sniprun
})

-- TERMINAL

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
});

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- TABs
map('n', '<A-S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-tab>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- RUST

local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
});

-- ICONS

require('nvim-web-devicons').setup{
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 color_icons = true;
 default = true;
}

require("trouble").setup();


EOF
