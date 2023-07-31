return {
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
      config = function()
        require("telescope").load_extension("live_grep_args")
      end,
    },
    keys = {
      -- disable the keymap to grep files
      -- { "<leader>/", false },
      -- change a keymap
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      -- add a keymap to browse plugin files
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
    opts = {
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
      -- extensions = {
      -- live_grep_args = {
      --   auto_quoting = true,
      --   mappings = {
      -- i = {
      -- ["<C-q>"] = function()
      --   return require("telescope-live-grep-args.actions").quote_prompt()
      -- end,
      -- ["<C-i>"] = function()
      --   return require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " })
      -- end,
      --   },
      -- },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
      -- },
      -- },
    },
  },
}
