return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use

  { "mbbill/undotree", keys = {
    { "<F4>", "<cmd>UndotreeToggle<cr>", desc = "undotree" },
  } },
  -- "christoomey/vim-tmux-navigator", -- tmux & split window navigation

  "inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash search" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash search"  },
  },
  },
  {
    "voldikss/vim-floaterm",
    lazy = false,
    keys = {
      { "n", "<F12>", ":FloatermToggle<CR>", desc = "FloatermToggle" },
      { "t", "<F12>", "<C-\\><C-n>:FloatermToggle<CR>", desc = "FloatermToggle" },
    },
  },
  {
    "folke/zen-mode.nvim",
    lazy = false,
    dependencies = { "folke/twilight.nvim" },
    keys = {
      { "n", "<leader>zz", ":ZenMode<CR>", desc = "ZenMode" }, -- ZenMode
      { "n", "<leader>zt", ":Twilight<CR>", desc = "Twilight" }, --Twilight
    },
  },
  {
    "RRethy/vim-illuminate",
  },
  {
    "gen740/SmoothCursor.nvim",
    config = function()
      require("smoothcursor").setup({
        type = "fancy",
        fancy = { enable = true },
      })
    end,
  },
  --   event = "LazyFile",
  --   opts = {
  --     delay = 200,
  --     large_file_cutoff = 2000,
  --     large_file_overrides = {
  --       providers = { "lsp" },
  --     },
  --   },
  -- config = function(_, opts)
  --   require("illuminate").configure(opts)
  --
  --   local function map(key, dir, buffer)
  --     vim.keymap.set("n", key, function()
  --       require("illuminate")["goto_" .. dir .. "_reference"](false)
  --     end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
  --   end
  --
  --   map("]]", "next")
  --   map("[[", "prev")
  --
  --   -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
  --   vim.api.nvim_create_autocmd("FileType", {
  --     callback = function()
  --       local buffer = vim.api.nvim_get_current_buf()
  --       map("]]", "next", buffer)
  --       map("[[", "prev", buffer)
  --     end,
  --   })
  -- end,
  -- keys = {
  --   { "]]", desc = "Next Reference" },
  --   { "[[", desc = "Prev Reference" },
  -- },
  -- },
}
