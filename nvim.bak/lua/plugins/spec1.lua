return {
	{ "chrisbra/unicode.vim" },
	{ "numToStr/Comment.nvim" },
	-- {'Thiago4532/mdmath.nvim'},
	{ "chrisbra/unicode.vim" },
	{ "RaafatTurki/hex.nvim" },
	{ "Julian/lean.nvim" },
	{ "iamcco/markdown-preview.nvim" },
	{ "williamboman/mason.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "ray-x/lsp_signature.nvim" },

	{ "sindrets/diffview.nvim" },

	{
		"stevearc/conform.nvim", -- Formatter,
	},
	{ "github/copilot.vim" },
	{ "milanglacier/minuet-ai.nvim" },

	{ "mfussenegger/nvim-dap" },
	{ "nvim-neotest/nvim-nio" },
	{ "rcarriga/nvim-dap-ui" },
	{ "theHamsta/nvim-dap-virtual-text" },

	{ "p00f/clangd_extensions.nvim" },
	{ "feline-nvim/feline.nvim" },
	{ "jbyuki/nabla.nvim" },

	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	{ "mfussenegger/nvim-lint" },

	{ "akinsho/toggleterm.nvim" },
	{ "morhetz/gruvbox" },
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		branch = "main",
		config = function()
			local ts = require("nvim-treesitter")
			local parsers = {
				c,
				cpp,
				cmake,
				dockerfile,
				diff,
				disassembly,
				dot,
				ebnf,
				doxygen,
				cuda,
				typescript,
				markdown,
				markdown_inline,
				bash,
				ocaml,
				objdump,
				nix,
				ninja,
				markdown,
				lua,
				llvm,
				rust,
				vim,
				query,
				make,
				gitignore,
				gitcommit,
				git_config,
			}
			for _, parser in ipairs(parsers) do
				ts.install(parser)
			end
			local patterns = {}

			for _, parser in ipairs(parsers) do
				local parser_patterns = vim.treesitter.language.get_filetypes(parser)
				for _, pp in pairs(parser_patterns) do
					table.insert(patterns, pp)
				end
			end

			-- vim.api.nvim_create_autocmd("FileType", {
			-- 	pattern = patterns,
			-- 	callback = function()
			-- 		vim.treesitter.start()
			-- 	end,
			-- })
		end,
	},
	{ "lukas-reineke/indent-blankline.nvim" },

	{ "nyoom-engineering/oxocarbon.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "romgrk/barbar.nvim" },
	{ "Mofiqul/dracula.nvim" },
	{ "navarasu/onedark.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "savq/melange-nvim" },

	{ "nvim-lualine/lualine.nvim" },

	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim" },

	{ "folke/which-key.nvim" },
}
