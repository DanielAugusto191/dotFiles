local vim = vim

-- complete
vim.keymap.set("i", "(", "()<Esc>i")
vim.keymap.set("i", "{", "{}<Esc>i")
vim.keymap.set("i", "[", "[]<Esc>i")
vim.keymap.set("i", "\"", "\"\"<Esc>i")
vim.keymap.set("i", "'", "''<Esc>i")

-- Move multiple lines
vim.keymap.set("n", "<A-k>", ":m .-2<CR>")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>")

vim.keymap.set("i", "<A-k>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-j>", "<Esc>:m .-2<CR>==gi")

vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")

-- Center cursor

-- Buffer tabs
vim.keymap.set("n", "<A-h>", "<Cmd>BufferPrevious<CR>");
vim.keymap.set("n", "<A-l>", "<Cmd>BufferNext<CR>");
vim.keymap.set("n", "<A-w>", "<Cmd>BufferClose<CR>");
vim.keymap.set("n", "<A-s>", "<Cmd>BufferRestore<CR>");
vim.keymap.set("n", "<A-,>", "<Cmd>BufferMovePrevious<CR>");
vim.keymap.set("n", "<A-.>", "<Cmd>BufferMoveNext<CR>");

local builtin = require('telescope.builtin')

vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {desc = "Search Text"})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
vim.keymap.set('n', 'fr', builtin.lsp_references, {})

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>y", "\"+y")

vim.keymap.set("n", 'K', vim.lsp.buf.hover, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {noremap = true, silent = true, desc = "Goto Definition" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {noremap = true, silent = true, desc = "Goto Declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {noremap = true, silent = true})
vim.keymap.set("n", "ge", vim.lsp.buf.references, {noremap = true, silent = true})
vim.keymap.set("n", "go", vim.lsp.buf.type_definition, {noremap = true, silent = true})
vim.keymap.set("n", "gf", vim.lsp.buf.format, {noremap = true, silent = true})
vim.keymap.set("n", "gs", vim.diagnostic.open_float, {noremap = true, silent = true})
vim.keymap.set("n", "gr", "<Cmd>ClangdToggleInlayHints<CR>", {})

vim.keymap.set("v", "ss", "s", {})
vim.keymap.set("v", "sw", ":s/\\%V", {})
vim.keymap.set("v", "i(", "xi(<CR>pi)<CR>", {})

