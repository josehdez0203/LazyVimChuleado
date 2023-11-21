return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>ql", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
    keymap.set("n", "<leader>qq", "<cmd>SessionSave<CR><cmd>q<cr>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
  end,
  -- "folke/persistence.nvim",
  -- event = "BufReadPre",
  -- opts = { options = vim.opt.sessionoptions:get() },
  -- -- stylua: ignore
  -- keys = {
  --   { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
  --   { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
  --   { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  -- },
}
