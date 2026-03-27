local vim = vim
require("mason-lspconfig").setup({
	automatic_installation = true,
	automatic_enable = true,
	ensure_installed = { "clangd", "rust_analyzer", "lua_ls", "bashls", "arduino_language_server", "clojure_lsp", "dockerls", "gopls", "html", "jdtls", "kotlin_language_server", "texlab", "marksman", "matlab_ls", "ocamllsp", "jedi_language_server", "julials", "nil_ls", "millet", "mlir-lsp-server"},
})
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.lsp.enable('bashls')

require "lsp_signature".setup({
	bind = true, -- This is mandatory, otherwise border config won't get registered.
	handler_opts = {
		border = "rounded"
	}
})

-- require('mason-lspconfig').setup_handlers({
-- 	function(server)
-- 		lspconfig[server].setup({})
-- 	end,
-- })

vim.lsp.enable('bashls');

vim.lsp.enable('mlir-lsp-server');
vim.lsp.config('mlir-lsp-server', {
  cmd = {"/home/pc2/llvm-project/build/bin/mlir-lsp-server"},
  filetypes = {"mlir"},
})

vim.lsp.enable('mlir-pdll-lsp-server');
vim.lsp.config('mlir-pdll-lsp-server', {
  cmd = {"/home/pc2/llvm-project/build/bin/mlir-pdll-lsp-server"},
  filetypes = {"pdll"},
})

vim.lsp.enable('millet');
-- lspconfig.pyright.setup {}
-- lspconfig.clangd.setup({
-- 	settings = {
-- 		clangd = {
-- 			InlayHints = {
-- 				Enabled = true,
-- 				DeducedTypes = true,
-- 			},
-- 		},
-- 	}
-- })

vim.lsp.enable('rust_analyzer')
vim.lsp.enable('lua_ls')--
vim.lsp.enable('nil_ls')
-- .setup({
-- 	settings = {
-- 		["nil"] = {
-- 			formatting = {
-- 				command = { "nixpkgs-fmt" },
-- 			},
-- 		},
-- 	},
-- })
vim.lsp.enable('julials');
vim.lsp.enable('ocamllsp');
