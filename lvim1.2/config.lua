--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

vim.opt.relativenumber = true
vim.opt.colorcolumn = "100"
vim.opt.scrolloff = 5 -- Determines the number of context lines you would like to see above and below the cursor
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true -- Case-sensitive search when search term contains uppercase characters. Otherwise, case-sensitive search.  timeoutlen = 200, -- Time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.cmdheight = 1
-- vim.opt.foldmethod = "expr" -- code folding
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight-moon"
lvim.transparent_window = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- centre screen after doing these actions
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["n"] = "nzz"

lvim.keys.insert_mode["jk"] = "<ESC>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
local _, lga_actions = pcall(require, "telescope-live-grep-args.actions")
lvim.builtin.telescope.defaults.mappings = {
	-- for input mode
	i = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<C-n>"] = actions.cycle_history_next,
		["<C-p>"] = actions.cycle_history_prev,
		["<C-s>"] = lga_actions.quote_prompt(),
		["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
	},
	-- for normal mode
	n = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
	},
}

-- Use which-key to add extra bindings with the leader-key prefix
-- If I want to toggleterm with command, copy Astrovim function: https://github.com/AstroNvim/AstroNvim/blob/80f650ab0c7dc3a93c9fe372010919be936d7eb9/lua/core/utils/init.lua#L283
lvim.builtin.which_key.mappings["gO"] = { "<cmd>:OpenInGHFileLines <CR>", "Open in GitHub Repo" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
	"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
	"Live grep args",
}
lvim.builtin.which_key.mappings["W"] = { "<cmd>Telescope grep_string<CR>", "Find word" }
lvim.builtin.which_key.mappings["p"] = {
	name = "+Package",
	I = { "<cmd>Mason<CR>", "Mason Installer" },
	U = { "<cmd>MasonToolsUpdate<CR>", "Mason Update" },
	c = { "<cmd>PackerCompile<cr>", "Compile" },
	i = { "<cmd>PackerInstall<cr>", "Install" },
	r = { "<cmd>lua require('lv-utils').reload_lv_config()<cr>", "Reload" },
	s = { "<cmd>PackerSync<cr>", "Sync" },
	S = { "<cmd>PackerStatus<cr>", "Status" },
	u = { "<cmd>PackerUpdate<cr>", "Update" },
}
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
-- User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = false
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.telescope.pickers.find_files.previewer = nil
lvim.builtin.telescope.pickers.find_files.theme = nil
lvim.builtin.telescope.pickers.git_files.previewer = nil
lvim.builtin.telescope.pickers.git_files.theme = nil
lvim.builtin.telescope.pickers.live_grep.previewer = nil
lvim.builtin.telescope.pickers.live_grep.theme = nil
lvim.builtin.telescope.on_config_done = function(telescope)
	pcall(telescope.load_extension, "live_grep_args")
end
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.endwise = {
	enable = true,
}
lvim.builtin.treesitter.auto_install = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"java",
	"json",
	"lua",
	"python",
	"css",
	"yaml",
	"ruby",
}

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
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

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
		command = "prettier",
		--     ---@usage arguments to pass to the formatter
		--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
		--     extra_args = { "--print-with", "100" },
		--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
		filetypes = { "javascript", "javascriptreact" },
	},
})

-- -- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		command = "eslint_d",
		---@usage specify which filetypes to enable. By default, providers will attach to all the filetypes it supports.
		filetypes = { "javascript", "javascriptreact" },
	},
})

-- Additional Plugins
lvim.plugins = {
	{
		"github/copilot.vim",
		config = function()
			-- copilot assume mapped
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_no_tab_map = true
		end,
	},
	{
		"hrsh7th/cmp-copilot",
		config = function()
			lvim.builtin.cmp.formatting.source_names["copilot"] = "( )"
			table.insert(lvim.builtin.cmp.sources, 2, { name = "copilot" })
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"olimorris/neotest-rspec",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-rspec"),
				},
			})
		end,
	},
	{ "almo7aya/openingh.nvim" },
	{ "nvim-telescope/telescope-live-grep-args.nvim" },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup({
				trigger_events = { "BufLeave" },
			})
		end,
	},
	{ "RRethy/nvim-treesitter-endwise" },
	{
		"shatur/neovim-session-manager",
		requires = "nvim-lua/plenary.nvim",
		require("session_manager").setup({
			autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
		}),
	},
	{
		"sudormrfbin/cheatsheet.nvim",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	},
	{ "tpope/vim-rails" },
	{ "tpope/vim-surround" },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- Autocommand to remember cursor position in file
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   pattern = "*",
--   callback = function()
--     local row, col = unpack(vim.api.nvim_buf_get_mark(0, '"'))
--     if { row, col } ~= { 0, 0 } and row <= vim.api.nvim_buf_line_count(0) then
--       vim.api.nvim_win_set_cursor(0, { row, 0 })
--       if vim.fn.line("w$") ~= row then
--         vim.cmd("norm! zz")
--       end
--     end
--   end,
-- })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "zsh",
	callback = function()
		-- let treesitter use bash highlight for zsh files as well
		require("nvim-treesitter.highlight").attach(0, "bash")
	end,
})
-- vim.api.nvim_create_autocmd("BufReadPost,FileReadPost", {
--   pattern = "*",
--   callback = function()
--     vim.api.nvim_command("normal zR")
--   end,
-- })
