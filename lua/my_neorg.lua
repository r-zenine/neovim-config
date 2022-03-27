local M = {}

function M.setup()
  require("neorg").setup {
    load = {
      ["core.defaults"] = {},
      ["core.norg.concealer"] = {},
      ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            work_notes = "~/workspace/notes",
            notes = "~/Documents/notes",
          },
        },
      },
    },
  }
end

return M
