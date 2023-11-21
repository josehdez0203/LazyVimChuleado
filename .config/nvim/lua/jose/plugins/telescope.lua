return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<C-/>", "<cmd>Telescope find_files<cr>", desc = "Archivos" },
    { "<C-p>", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<C-b>", "<cmd>Telescope oldfiles<cr>", desc = "Historial de archivos" },
    { "<C-g>", "<cmd>Telescope live_grep<cr>", desc = "Buscar en todos lados" },
    { "<C-t>", "<cmd>Telescope help_tags<cr>", desc = "Buscar Ayuda" },
    { "<C-m>", "<cmd>Telescope keymaps<cr>", desc = "Buscar Key mappings" },
  },

  -- opts = function(_, opts)
  --   local telescope = require("telescope")
  --   telescope.load_extension("fzf")
  --   local function flash(prompt_bufnr)
  --     require("flash").jump({
  --       pattern = "^",
  --       label = { after = { 0, 0 } },
  --       search = {
  --         mode = "search",
  --         exclude = {
  --           function(win)
  --             return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
  --           end,
  --         },
  --       },
  --       action = function(match)
  --         local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
  --         picker:set_selection(match.pos[1] - 1)
  --       end,
  --     })
  --   end
  --   opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
  --     mappings = {
  --       n = { s = flash },
  --       i = { ["<c-s>"] = flash },
  --     },
  --   })
  -- end,
}
