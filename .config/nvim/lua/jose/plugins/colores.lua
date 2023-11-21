--return {
--  "NvChad/nvim-colorizer.lua",
--  event = { "BufReadPre", "BufNewFile" },
--  config = true,
--}

return {
  "uga-rosa/ccc.nvim",
  lazy = false,
  opts = {
    highlighter = {
      auto_enable = true,
      lsp = true,
    },
  },
  keys = {
    { "co", "<cmd>CccPick<cr>", desc = "Escoger color" },
    { "cc", "<cmd>CccHighlighterToggle<cr>", desc = "Alternar color" },
    { "cv", "<cmd>CccConvert<cr>", desc = "Editar color" },
  },
}
