--[[
 `lvim` is the global options object
]]
reload("user.plugins")
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.colorcolumn = "100"
vim.opt.scrolloff = 5     -- Determines the number of context lines you would like to see above and below the cursor
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true  -- Case-sensitive search when search term contains uppercase characters. Otherwise, case-sensitive search.  timeoutlen = 200, -- Time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.cmdheight = 1

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  -- pattern = "*.lua",
  timeout = 1000,
}
lvim.colorscheme = "tokyonight-moon"
lvim.transparent_window = true

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- centre screen after doing these actions
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["n"] = "nzz"

lvim.keys.insert_mode["jk"] = "<ESC>"

reload("user.telescope")
-- -- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["A"] = { "<cmd>:A<CR>", "Go to associated rails file" }
lvim.builtin.which_key.mappings["R"] = { "<cmd>:R<CR>", "Go to related rails file" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = { "<cmd>Telescope live_grep<CR>", "Search words" }
lvim.builtin.which_key.mappings["W"] = { "<cmd>Telescope grep_string<CR>", "Find word" }
lvim.builtin.which_key.mappings["S"] = {
  name = "+Session",
  l = { "<cmd>SessionManager! load_last_session<cr>", "Load last session" },
  s = { "<cmd>SessionManager! save_current_session<cr>", "Save this session" },
  d = { "<cmd>SessionManager! delete_session<cr>", "Delete session" },
  f = { "<cmd>SessionManager! load_session<cr>", "Search sessions" },
  c = { "<cmd>SessionManager! load_current_dir_session<cr>", "Load current directory session" },
}
lvim.builtin.which_key.mappings["n"] = {
  name = "Neotest",
  a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
  f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File" },
  F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug File" },
  l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
  L = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last" },
  n = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
  N = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
  o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
  x = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
  S = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
}


-- lvim.builtin.telescope.defaults.layout_config.width = 0.5
lvim.builtin.alpha.active = false
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.endwise = {
  enable = true,
}
-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua" },
  {
    command = "prettier",
    -- extra_args = { "--print-width", "100" },
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint_d",
    ---@usage specify which filetypes to enable. By default, providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "javascriptreact" },
  },
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    require("user.theme").telescope_theme()
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})
