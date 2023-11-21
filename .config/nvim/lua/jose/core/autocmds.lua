-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("jhc_highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = {
--     "sql",
--     "mysql",
--     "plsql",
--   },
--   callback = function()
--     vim.schedule(db_completion)
--   end,
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "http",
--   callback = function()
--     local buff = tonumber(vim.fn.expand("<abuf>"), 10)
--     vim.keymap.set("n", "<leader>pn", "<Plug>RestNvim", { noremap = true, buffer = buff })
--     vim.keymap.set("n", "<leader>pl", "<Plug>RestNvimLast", { noremap = true, buffer = buff })
--     vim.keymap.set("n", "<leader>pp", function()
--       rest_nvim.run(true)
--     end, { noremap = true, buffer = buff })
--   end,
-- })
