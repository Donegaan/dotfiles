return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          "__pycache__",
          ".git",
          ".vscode",
          ".DS_Store",
        },
      },
      window = {
        mappings = {
          ["Y"] = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            local value = vim.fn.fnamemodify(path, ":.")
            vim.fn.setreg("+", value)
            print(value)
          end,
        },
      },
    },
  },
}
