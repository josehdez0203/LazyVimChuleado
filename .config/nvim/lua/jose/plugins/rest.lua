return {
  "rest-nvim/rest.nvim",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<space>mc", "<Plug>RestNvim", { desc = "RestNvim" } },
    { "<space>mv", "<Plug>RestNvimPreview", { desc = "RestNvim Preview" } },
    { "<space>ml", "<Plug>RestNvimLast", { desc = "RestNvim Last" } },
  },
  config = function()
    require("rest-nvim").setup({
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Keep the http file buffer above|left when split horizontal|vertical
      result_split_in_place = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Encode URL before making request
      encode_url = true,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response body [optional]
        -- set them to nil if you want to disable them
        formatters = {
          json = "jq",
          -- html = function(body)
          -- 	return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
          -- end,
        },
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = ".env",
      custom_dynamic_variables = {},
      yank_dry_run = true,
    })
  end,
}
