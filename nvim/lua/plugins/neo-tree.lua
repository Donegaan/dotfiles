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
            -- local content = node.path
            -- relative
            local content = node.path:gsub(state.path, ""):sub(2)
            vim.fn.setreg('"', content)
            vim.fn.setreg("1", content)
            vim.fn.setreg("+", content)
          end,
        },
      },
    },
  },
}
