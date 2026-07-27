local vim = vim

-- ToggleTerm
vim.keymap.set("n", "<C-k>", ":ToggleTerm size=10 direction=horizontal<CR>")
vim.keymap.set("n", "<C-l>", ":ToggleTerm size=10 direction=float<CR>")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n>:ToggleTerm<CR>")

-- complete
vim.keymap.set("i", "(", "()<Esc>i")
vim.keymap.set("i", "{", "{}<Esc>i")
vim.keymap.set("i", "[", "[]<Esc>i")
vim.keymap.set("i", "\"", "\"\"<Esc>i")
vim.keymap.set("i", "`", "```")

-- Move multiple lines
vim.keymap.set("n", "<A-k>", ":m .-2<CR>")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>")
vim.keymap.set("i", "<A-k>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-j>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")

-- Copilot
vim.keymap.set("i", "<C-,>", "<Esc>:Copilot disable<CR>a")
vim.keymap.set("i", "<C-.>", "<ESc>:Copilot enable<CR>a")
vim.g.copilot_no_tab_map = true
vim.g.copilot_enabled = false

-- Config
vim.keymap.set({ "n", "i", "v" }, "<leader>0", ":lua require('nabla').toggle_virt()<CR>")
vim.keymap.set({ "n", "i", "v" }, "<leader>1", ":set relativenumber!<CR>")
vim.keymap.set({ "n", "i", "v" }, "<leader>2", ":set cursorline!<CR>")


-- Buffer tabs
vim.keymap.set("n", "<A-h>", "<Cmd>BufferPrevious<CR>");
vim.keymap.set("n", "<A-l>", "<Cmd>BufferNext<CR>");
vim.keymap.set("n", "<A-w>", "<Cmd>BufferClose<CR>");
vim.keymap.set("n", "<A-s>", "<Cmd>BufferRestore<CR>");
vim.keymap.set("n", "<A-,>", "<Cmd>BufferMovePrevious<CR>");
vim.keymap.set("n", "<A-.>", "<Cmd>BufferMoveNext<CR>");

-- Misc
vim.keymap.set("n", "<Tab>", "<C-w>w");
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>y", "\"+y")

local builtin = require('telescope.builtin')
local conform = require("conform")


-- Find files
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, { desc = "Search Text" })
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
vim.keymap.set('n', 'fr', builtin.lsp_references, {})
vim.keymap.set('n', 'fs', builtin.planets, {})


-- LSP
vim.keymap.set("n", 'K', vim.lsp.buf.hover, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "Goto Definition" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Goto Declaration" })
vim.keymap.set("n", "gb", vim.lsp.buf.implementation, { noremap = true, silent = true, desc = "Goto Implementation" })
vim.keymap.set("n", "ge", vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { noremap = true, silent = true })
vim.keymap.set("n", "gf", vim.lsp.buf.format, { noremap = true, silent = true })
vim.keymap.set("n", "gs", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "gk", vim.lsp.buf.signature_help, { noremap = true, silent = true })
-- vim.keymap.set("n", "gr", "<Cmd>ClangdToggleInlayHints<CR>", {})
vim.keymap.set("n", "gr", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
	{ noremap = true, desc = "Inlay Hints" })
vim.keymap.set("n", "gn", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "gm", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- Substitute
vim.keymap.set("v", "ss", "s", {})
vim.keymap.set("v", "sw", ":s/", {})
vim.keymap.set("v", "i(", "xi(<ESC>pli)<ESC>", {})

-- DEBUG
local dap = require('dap')
local dapui = require('dapui')

--open dapui
vim.keymap.set("n", "<leader>dd", function() dapui.toggle() end, { desc = "Toggle DAP UI" })

vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Continue" })
vim.keymap.set("n", "<leader>de", function() dap.run_to_cursor() end, { desc = "Run to cursor" })
vim.keymap.set("n", "<leader>dr", function() dap.restart() end, { desc = "Pause" })
vim.keymap.set("n", "<leader>dt", function() dap.terminate() end, { desc = "Terminate" })
vim.keymap.set("n", "<leader>dv", function() dap.step_over() end,{ desc = "Step over"})
vim.keymap.set("n", "<leader>df", function() dap.step_into() end,{ desc = "Step into"})
vim.keymap.set("n", "<leader>dg", function() dap.step_out() end, { desc = "Step out"})

-- GIT
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", { desc = "Git Blame Line" })
vim.keymap.set("n", "<leader>gc", function()
  require("telescope.builtin").git_commits({
    attach_mappings = function(_, map)
      -- Define que ao apertar Enter (<CR>) no commit selecionado:
      map("i", "<CR>", function(prompt_bufnr)
        local selection = require("telescope.actions.state").get_selected_entry()
        require("telescope.actions").close(prompt_bufnr)
        -- Abre o Diffview usando o hash do commit selecionado
        vim.cmd("DiffviewOpen " .. selection.value)
      end)
      return true
    end,
  })
end, { desc = "Search Commits and Open Diff" })

-- resize window
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { desc = 'Decrease Height' })
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { desc = 'Increase Height' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease Width' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase Width' })

