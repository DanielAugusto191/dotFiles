return {
	{ "chrisbra/unicode.vim" },
	{ "numToStr/Comment.nvim" },
	-- {'Thiago4532/mdmath.nvim'},
	{ "RaafatTurki/hex.nvim" },
	{ "Julian/lean.nvim" },

	{ "meanderingprogrammer/render-markdown.nvim" },
	{ "williamboman/mason.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "ray-x/lsp_signature.nvim" },

	{ "sindrets/diffview.nvim" },
	{ "stevearc/conform.nvim" },
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
		commit = vim.fn.has("nvim-0.12") == 0 and "7caec274fd19c12b55902a5b795100d21531391f" or nil,
		config = function ()
			local ts = require("nvim-treesitter")
			local parsers = {
				c, cpp, cmake, dockerfile, diff, disassembly, dot, ebnf, doxygen, cuda, typescript, markdown, markdown_inline,
				bash, ocaml, objdump, nix, ninja, markdown, lua, llvm, rust, vim, query, make, gitignore, gitcommit, git_config
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
		end
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
	{
		"lewis6991/gitsigns.nvim",
		config = function ()
			require('gitsigns').setup({
				current_line_blame = true, -- Ativa o git blame sutil inline na linha atual
				current_line_blame_opts = {
					delay = 500,     -- Tempo em ms de espera no cursor antes de exibir o blame
					position = 'eol' -- Exibe no final da linha (End of Line)
				},
				current_line_blame_formatter = '   <author> • <author_time:%Y-%m-%d> • <summary>'
			})
		end
	},
	-- { "folke/which-key.nvim" },
	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		opts = {
			modes = {
				lsp = {
					win = { position = "right" }
				}
			}
		},
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
			{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
			{ "<leader>cs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
			{
				"<leader>cS",
				"<cmd>Trouble lsp toggle<cr>",
				desc = "LSP references/definitions/... (Trouble)"
			},
			{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
			{ "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
			{
				"[q",
				function ()
					if require("trouble").is_open() then
						require("trouble").prev({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cprev)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Previous Trouble/Quickfix Item"
			},
			{
				"]q",
				function ()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cnext)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Next Trouble/Quickfix Item"
			}
		}
	}
}
