local vim = vim
vim.cmd([[
  set textwidth=80 autoread shiftwidth=2 mouse=a smarttab showcmd number  encoding=utf8 t_Co=256 noswapfile splitbelow cursorline completeopt=menu,menuone,noselect syntax=true termguicolors colorcolumn=81 foldmethod=manual relativenumber smartindent autoindent linebreak

  set rtp^="/home/pc2/.opam/default/share/ocp-indent/vim"
  set clipboard+=unnamedplus

  let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'julia', 'vim', 'rust', 'sml', 'c', 'cpp', 'typescript', 'javascript', 'go', 'c++=cpp']

  "" must tu be be}fore colorscheme
  " au ColorScheme * hi Normal ctermbg=none guibg=none
  " au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=

  colorscheme dracula

]])

vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222222" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#cccccc", italic = true })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#FF0000", italic = true })

vim.api.nvim_set_hl(0, "@lsp.typemod.function.globalScope.cpp", { fg = "#00FF00", bold = true })
vim.api.nvim_set_hl(0, "@lsp.typemod.parameter.functionScope.cpp", { fg = "#00FF00"})
vim.api.nvim_set_hl(0, "ctype", { fg = "#FF0000"})
vim.api.nvim_set_hl(0, "cpptype", { fg = "#FF0000"})
vim.api.nvim_set_hl(0, "cppString", { fg = "#ffb133"})
vim.api.nvim_set_hl(0, "cConditional", { fg = "#ff3de2"})
vim.api.nvim_set_hl(0, "cRepeat", { fg = "#ff3de2"})
vim.api.nvim_set_hl(0, "cStorageClass", { fg = "#ff3de2"})
vim.api.nvim_set_hl(0, "@lsp.typemod.namespace.globalScope.cpp", { fg = "#ff5917"})
vim.api.nvim_set_hl(0, "@lsp.typemod.class.fileScope.cpp", { fg = "#002fff"})
vim.api.nvim_set_hl(0, "@lsp.typemod.operator.userDefined.cpp", { fg = "#ff00f7"})
vim.api.nvim_set_hl(0, "@lsp.typemod.method.readonly.cpp", { fg = "#00ffd0"})
vim.api.nvim_set_hl(0, "@lsp.typemod.class.globalScope.cpp", { fg = "#0066ff"})
vim.api.nvim_set_hl(0, "@lsp.typemod.method.classScope.cpp", { fg = "#00ff6e"})
vim.api.nvim_set_hl(0, "cDefine", { fg = "#6a00ff"})
vim.api.nvim_set_hl(0, "cInclude", { fg = "#6a00ff"})
vim.api.nvim_set_hl(0, "cStatement", { fg = "#6a00ff"})
vim.api.nvim_set_hl(0, "cppStatement", { fg = "#6a00ff"})
vim.api.nvim_set_hl(0, "cStructure", { fg = "#ffb133"})
vim.api.nvim_set_hl(0, "cppStructure", { fg = "#ffb133"})

vim.o.background = "dark"
-- vim.cmd('Copilot disable')
-- vim.cmd([[colorscheme dracula]])
vim.opt.foldenable = false
vim.opt.laststatus = 3
vim.opt.shell = "zsh"

vim.diagnostic.config({ virtual_text = true, underline = true })

-- vim.api.nvim_create_autocmd("BufWritePost", {
--     callback = function(ev)
--       vim.diagnostic.enable()
--     end,
--     desc = "Redo virtual text",
-- })
local augroup = vim.api.nvim_create_augroup
vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = "*:n", -- Triggers when *any* mode changes TO normal mode ('n')
	group = augroup("diagnostic", { clear = true }),
	callback = function()
		vim.diagnostic.enable()
	end,
	desc = "Trigger an action when entering normal mode",
})

-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("bufread", { clear = true }),
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.cmd('normal! g`"zz')
		end
	end,
})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("tYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
})

require("telescope").setup()
require("diffview").setup()
require("hex").setup()
require("Comment").setup()
require("ibl").setup()
require("feline").setup()
require("mason").setup()
require("lean").setup()

require("onedark").setup({
})

require("dracula").setup({
	transparent_bg = true,
	colors = {
		bg = "#000000",
	},
	lualine_bg_color = "#0000ff",
})
require("lualine").setup({
	options = {
		theme = "onedark",
	},
})

-- debug
local dap = require("dap")
require("dapui").setup()
require("nvim-dap-virtual-text").setup()

dap.adapters.codelldb = {
	type = "executable",
	command = "codelldb",
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		runInTerminal = false,
	},
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- require("copilot").setup({
--   	suggestion = {
-- 		auto_trigger = true,
-- 		keymap = {
-- 		  accept = "<C-CR>",
-- 		},
-- 	},
-- });

require("conform").setup({
	formatting = {
		ocamlformat = {
			extra_args = { "--profile", "janestreet" },
		},
	},
})

-- require("nvim-treesitter").setup({
-- 	ensure_installed = {
-- 		"c",
-- 		"cpp",
-- 		"lua",
-- 		"python",
-- 		"rust",
-- 		"tsx",
-- 		"typescript",
-- 		"vim",
-- 		"ocaml",
-- 		"sml",
-- 		"haskell",
-- 		"nix",
-- 		"mlir",
-- 	},
-- 	auto_install = true,
-- 	highlight = { enable = true },
-- 	indent = { enable = true },
-- })

local cmp = require("cmp")
cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
	}),
	sources = cmp.config.sources({ { name = "minuet" } }, { { name = "nvim_lsp" } }, { { name = "buffer" } }),
})

require("clangd_extensions").setup()
require("barbar").setup()

require("toggleterm").setup({
	size = 20,
	function(term)
		if term.direction == "horizontal" then
			return 20
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<C-l>]],
	start_in_insert = true,
	hide_numbers = true,
	direction = "float",
})
