return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.export.markdown"] = {
          -- extension = "md",
        },
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {},
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        }, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
          },
        },
      },
    })
  end,
}
