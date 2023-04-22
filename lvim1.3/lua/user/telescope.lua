local actions = require("telescope.actions")

lvim.builtin.telescope.layout_config.width = 0.9
lvim.builtin.telescope.defaults.layout_config = {
  -- prompt_position = "top",
  height = 0.9,
  width = 0.9,
  bottom_pane = {
    height = 25,
    preview_cutoff = 120,
  },
  center = {
    height = 0.4,
    preview_cutoff = 40,
    width = 0.5,
  },
  cursor = {
    preview_cutoff = 40,
  },
  horizontal = {
    preview_cutoff = 120,
    preview_width = 0.6,
  },
  vertical = {
    preview_cutoff = 40,
  },
  flex = {
    flip_columns = 150,
  },
}

for key, _ in pairs(lvim.builtin.telescope.pickers) do
  if key ~= "planets" then
    lvim.builtin.telescope.pickers[key].previewer = nil
    lvim.builtin.telescope.pickers[key].theme = nil
    lvim.builtin.telescope.pickers[key].layout_strategy = nil
  end
end

lvim.builtin.telescope.pickers.find_files.previewer = nil
lvim.builtin.telescope.pickers.find_files = nil
lvim.builtin.telescope.pickers.git_files.previewer = nil
lvim.builtin.telescope.pickers.git_files = nil
lvim.builtin.telescope.pickers.live_grep.previewer = nil
lvim.builtin.telescope.pickers.live_grep.theme = nil
lvim.builtin.telescope.defaults.path_display = nil
-- lvim.builtin.telescope.theme = "dropdown"

-- lvim.builtin.telescope.defaults.initial_mode = "insert"
-- lvim.builtin.telescope.defaults.sorting_strategy = "ascending"
lvim.builtin.telescope.defaults.layout_strategy = "flex"
lvim.builtin.telescope.defaults.prompt_prefix = "  "
lvim.builtin.telescope.defaults.selection_caret = "❯ "
lvim.builtin.telescope.defaults.mappings.i["<esc>"] = actions.close
lvim.builtin.telescope.defaults.winblend = 10


-- lvim.builtin.telescope.defaults.borderchars = {
--   prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
--   results = { " ", " ", " ", " ", " ", " ", " ", " " },
--   preview = { " ", " ", " ", " ", " ", " ", " ", " " },
-- }

-- lvim.builtin.telescope.defaults.borderchars = {
--   prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
--   results = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
--   preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
-- }

-- lvim.builtin.telescope.defaults.layout_strategy = "vertical"
-- lvim.builtin.telescope.defaults                = {
--   vimgrep_arguments = {
--     "rg",
--     "--color=never",
--     "--no-heading",
--     "--with-filename",
--     "--line-number",
--     "--column",
--     "--smart-case",
--   },
--   prompt_prefix = "   ",
--   selection_caret = "  ",
--   entry_prefix = "  ",
--   initial_mode = "insert",
--   selection_strategy = "reset",
--   sorting_strategy = "ascending",
--   layout_strategy = "horizontal",
--   layout_config = {
--     horizontal = {
--       prompt_position = "top",
--       preview_width = 0.55,
--       results_width = 0.8,
--     },
--     vertical = {
--       mirror = false,
--     },
--     width = 0.87,
--     height = 0.80,
--     preview_cutoff = 120,
--   },
--   file_sorter = require("telescope.sorters").get_fuzzy_file,
--   file_ignore_patterns = { "node_modules" },
--   generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
--   path_display = { "truncate" },
--   winblend = 0,
--   border = {},
--   borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
--   color_devicons = true,
--   set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
--   file_previewer = require("telescope.previewers").vim_buffer_cat.new,
--   grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
--   qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
--   -- Developer configurations: Not meant for general override
--   buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
--   mappings = {
--     n = { ["q"] = require("telescope.actions").close },
--   }
-- }
-- lvim.builtin.treesitter.context_commentstring.enable_autocmd = true
-- lvim.builtin.treesitter.context_commentstring.config.lua = { "//%s", "[[%s]]" }
