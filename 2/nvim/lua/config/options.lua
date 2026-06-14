-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

  -- Transparent background
vim.cmd([[
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=
]])

vim.g.autoformat = false
vim.g.snacks_animate = false

vim.o.background = "dark"

vim.opt.colorcolumn = "81"
-- vim.cmd('Copilot disable')
-- vim.cmd([[colorscheme dracula]])
vim.opt.foldenable = false
vim.opt.laststatus = 3
vim.opt.shell = "zsh"

vim.diagnostic.config({ virtual_text = true, underline = true })


-- my colors

vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222222" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#cccccc", italic = true })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#FF0000", italic = true })

vim.api.nvim_set_hl(0, "@lsp.typemod.function.cpp", { fg = "#00FF00", bold = true })
vim.api.nvim_set_hl(0, "@lsp.type.function.cpp", { fg = "#00FF00", bold = true })
vim.api.nvim_set_hl(0, "@lsp.typemod.parameter.functionScope.cpp", { fg = "#00FF00" })
vim.api.nvim_set_hl(0, "@type.builtin.cpp", { fg = "#FF0000" })
vim.api.nvim_set_hl(0, "ctype", { fg = "#FF0000" })
vim.api.nvim_set_hl(0, "cpptype", { fg = "#FF0000" })
vim.api.nvim_set_hl(0, "cppString", { fg = "#ffb133" })
vim.api.nvim_set_hl(0, "@string.cpp", { fg = "#ffb133" })
vim.api.nvim_set_hl(0, "cConditional", { fg = "#ff3de2" })
vim.api.nvim_set_hl(0, "cRepeat", { fg = "#ff3de2" })
vim.api.nvim_set_hl(0, "cStorageClass", { fg = "#ff3de2" })
vim.api.nvim_set_hl(0, "@lsp.typemod.namespace.globalScope.cpp", { fg = "#ff5917" })
vim.api.nvim_set_hl(0, "@lsp.typemod.class.fileScope.cpp", { fg = "#002fff" })
vim.api.nvim_set_hl(0, "@lsp.typemod.operator.userDefined.cpp", { fg = "#ff00f7" })
vim.api.nvim_set_hl(0, "@keyword.import.cpp", { fg = "#ff00f7" })
vim.api.nvim_set_hl(0, "@lsp.typemod.method.cpp", { fg = "#00ffd0" })
vim.api.nvim_set_hl(0, "@lsp.typemod.class.globalScope.cpp", { fg = "#0066ff" })
vim.api.nvim_set_hl(0, "@lsp.typemod.method.classScope.cpp", { fg = "#00ff6e" })
vim.api.nvim_set_hl(0, "cDefine", { fg = "#6a00ff" })
vim.api.nvim_set_hl(0, "cInclude", { fg = "#6a00ff" })
vim.api.nvim_set_hl(0, "cStatement", { fg = "#6a00ff" })
vim.api.nvim_set_hl(0, "cppStatement", { fg = "#6a00ff" })
vim.api.nvim_set_hl(0, "cStructure", { fg = "#ffb133" })
vim.api.nvim_set_hl(0, "cppStructure", { fg = "#ffb133" })


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
