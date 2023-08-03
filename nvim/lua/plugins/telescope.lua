local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  keys = {
    {
      "<leader>sg",
      ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      desc = "Live grep args",
    },
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
  },
}

function M.config()
  local telescope = require("telescope")
  local lga_actions = require("telescope-live-grep-args.actions")
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-n>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-p>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
          ["<C-j>"] = function(...)
            return require("telescope.actions").move_selection_next(...)
          end,
          ["<C-k>"] = function(...)
            return require("telescope.actions").move_selection_previous(...)
          end,
          ["<C-q>"] = function()
            return require("telescope-live-grep-args.actions").quote_prompt()
          end,
          ["<C-i>"] = function()
            return require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " })
          end,
        },
        n = {
          ["<C-j>"] = function(...)
            return require("telescope.actions").move_selection_next(...)
          end,
          ["<C-k>"] = function(...)
            return require("telescope.actions").move_selection_previous(...)
          end,
        },
      },
    },
    extensions = {
      live_grep_args = {
        auto_quoting = true,
        mappings = {
          i = {
            ["<C-q>"] = lga_actions.quote_prompt(),
            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          },
        },
      },
    },
  })
  telescope.load_extension("live_grep_args")
end

return M
