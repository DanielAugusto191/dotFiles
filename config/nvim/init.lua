-- Let nvim-cmp own the completion keys; Copilot is mapped explicitly below.
vim.g.copilot_no_tab_map = true

require("config.lazy")
require("config.config")
require("config.lsp")
require("config.keymap")
require("config.symbols")
