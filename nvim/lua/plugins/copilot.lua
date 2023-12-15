local M = {
  "zbirenbaum/copilot.lua",
}

function M.config()
  require("copilot").setup({
    copilot_node_command = vim.fn.expand("$HOME") .. "/.asdf/installs/nodejs/lts/bin/node", -- Node.js version must be > 16.x
    filetypes = {
      markdown = true,
      help = true,
    },
  })
end

return M
