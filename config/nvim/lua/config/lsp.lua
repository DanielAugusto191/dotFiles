local vim = vim
require("mason-lspconfig").setup({
	automatic_installation = true,
	automatic_enable = true,
	ensure_installed = { "clangd", "ruff", "pyright"},
})
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.lsp.enable('bashls')
vim.lsp.config('clangd', {
  cmd = {
    "clangd",
    "--background-index=false",
    "-j=4",
    "--pch-storage=disk",
    "--clang-tidy=false",
    "--completion-style=detailed",
  },
})
vim.lsp.enable('clangd')

require "lsp_signature".setup({
	bind = true, -- This is mandatory, otherwise border config won't get registered.
	handler_opts = {
		border = "rounded"
	}
})


vim.lsp.enable('bashls');

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
