return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>ss", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Mostrar archivos" })

    keymap.set(
      "n",
      "<leader>sa",
      ":lua require('harpoon.mark').add_file()<CR>",
      { desc = "Marcar archivo con harpoon" }
    )
    keymap.set(
      "n",
      "<leader>su",
      ":lua require('harpoon.ui').nav_file(1)<CR>",
      { desc = "Cambiar archivo  1 con harpoon" }
    )
    keymap.set(
      "n",
      "<leader>si",
      ":lua require('harpoon.ui').nav_file(2)<CR>",
      { desc = "Cambiar archivo 2 con harpoon" }
    )
    keymap.set(
      "n",
      "<leader>so",
      ":lua require('harpoon.ui').nav_file(3)<CR>",
      { desc = "Cambiar archivo 3 con harpoon" }
    )
    keymap.set(
      "n",
      "<leader>sp",
      ":lua require('harpoon.ui').nav_file(4)<CR>",
      { desc = "Cambiar archivo 4 con harpoon" }
    )
  end,
}
