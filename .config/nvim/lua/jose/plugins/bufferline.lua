return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      --mode = "tabs",
      separator_style = "slant",
      always_show_bufferline = true,
    },
  },
  keys = {
    { "<tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Move right" },
    { "<s-tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Move left" },
  },
}
