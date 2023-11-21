return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "lunarvim/Onedarker.nvim" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-emoji",
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Left>"] = cmp.mapping.abort(),
          ["<Right>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "emoji" },
        }),
        formatting = {
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = defaults.sorting,
      }
    end,
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    event = "BufEnter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = {
      toggler = {
        line = "<c-.>",
        -- block = "<c-.>",
      },
      -- opleader = {
      --   line = "<c-.>",
      -- },
      --      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    },
    -- keys = {
    --   { "<c-.>", "gcc", desc = "Comment" },
    --   { "<c-.>", "gc", desc = "Bloque comment" },
    -- },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "" },
        change = { text = "" },
        delete = { text = "󰆴" },
        topdelete = { text = "󰗨" },
        changedelete = { text = "󱂨" },
        untracked = { text = "󰃆" },
      },
      signcolumn = true,
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        actions = {
          open_file = {
            quit_on_open = true,
            resize_window = true,
            window_picker = {
              enable = false,
            },
          },
        },
      })
    end,
    -- keys = {
    --   { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer", remap = true },
    --   { "<leader>E", "<cmd>NvimTreeFindFile<cr>", desc = "Busca Archivo", remap = true },
    -- },
  },
  {
    "voldikss/vim-floaterm",
    lazy = false,
  },
  {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "prettier",
        "css-lsp",
        "emmet-language-server",
        "gofumpt",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- disable the keymap to grep files
      { "<leader>/", false },
      { "<leader>ff", false },
      { "<leader>fb", false },
      -- { "<leader>/", "<cmd>Telescope find_files<cr>", desc = "Buscar Archivos" },
      { "<C-/>", "<cmd>Telescope find_files<cr>", desc = "Archivos" },
      { "<C-p>", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<C-b>", "<cmd>Telescope oldfiles<cr>", desc = "Historial de archivos" },
      { "<C-g>", "<cmd>Telescope live_grep<cr>", desc = "Buscar en todos lados" },
    },
  },
  { "mbbill/undotree" },
  {
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
  },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "terryma/vim-multiple-cursors",
    event = "BufEnter",
    config = function()
      vim.g.multi_cursor_use_default_mapping = 0
      -- Default mapping
      vim.g.multi_cursor_start_word_key = "<C-n>"
      vim.g.multi_cursor_select_all_word_key = "<A-n>"
      vim.g.multi_cursor_start_key = "g<C-n>"
      vim.g.multi_cursor_select_all_key = "g<A-n>"
      vim.g.multi_cursor_next_key = "<C-n>"
      vim.g.multi_cursor_prev_key = "<C-p>"
      vim.g.multi_cursor_skip_key = "<C-x>"
      vim.g.multi_cursor_quit_key = "<Esc>"
    end,
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   config = function()
  --     ---@diagnostic disable-next-line: missing-fields
  --     require("nvim-treesitter.configs").setup({
  --       textobjects = {
  --         move = {
  --           enable = true,
  --           -- set_jumps = true, -- whether to set jumps in the jumplist
  --           lookahead = true,
  --           keymaps = {
  --             ["aa"] = "@parameter.outer",
  --             ["ia"] = "@parameter.inner",
  --             ["af"] = "@function.outer",
  --             ["if"] = "@function.inner",
  --             ["ac"] = "@class.outer",
  --             ["ic"] = "@class.inner",
  --             ["ai"] = "@conditional.outer",
  --             ["ii"] = "@conditional.inner",
  --             ["al"] = "@loop.outer",
  --             ["il"] = "@loop.inner",
  --             ["at"] = "@comment.outer",
  --             ["it"] = "@comment.inner",
  --           },
  --           -- goto_next_start = {
  --           --   ["oa"] = "@function.outer",
  --           --   ["]]"] = { query = "@class.outer", desc = "Next class start" },
  --           --   ["]o"] = "@loop.*",
  --           --   ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
  --           --   ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
  --           -- },
  --           -- goto_next_end = {
  --           --   ["]M"] = "@function.outer",
  --           --   ["]["] = "@class.outer",
  --           -- },
  --           -- goto_previous_start = {
  --           --   ["[m"] = "@function.outer",
  --           --   ["[["] = "@class.outer",
  --           -- },
  --           -- goto_previous_end = {
  --           --   ["[M"] = "@function.outer",
  --           --   ["[]"] = "@class.outer",
  --           -- },
  --           -- goto_next = {
  --           --   ["]d"] = "@conditional.outer",
  --           -- },
  --           -- goto_previous = {
  --           --   ["[d"] = "@conditional.outer",
  --           -- },
  --         },
  --       },
  --     })
  --   end,
  -- },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        alpha = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    config = true,
  },
  -- {
  --   "nvim-neorg/neorg",
  --   build = ":Neorg sync-parsers",
  --   lazy = false,
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("neorg").setup({
  --       load = {
  --         ["core.export.markdown"] = {
  --           -- extension = "md",
  --         },
  --         ["core.defaults"] = {}, -- Loads default behaviour
  --         ["core.concealer"] = {},
  --         ["core.completion"] = {
  --           config = {
  --             engine = "nvim-cmp",
  --           },
  --         }, -- Adds pretty icons to your documents
  --         ["core.dirman"] = { -- Manages Neorg workspaces
  --           config = {
  --             workspaces = {
  --               notes = "~/notes",
  --             },
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")
      require("rainbow-delimiters.setup")({
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          commonlisp = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          latex = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
        blacklist = { "c", "cpp" },
      })
    end,
  },
  {
    "rest-nvim/rest.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
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
  },
  -- {
  --   "stevearc/conform.nvim",
  --   dependencies = { "mason.nvim" },
  --   lazy = true,
  --   cmd = "ConformInfo",
  --   keys = {
  --     {
  --       "<leader>cF",
  --       function()
  --         require("conform").format({ formatters = { "injected" } })
  --       end,
  --       mode = { "n", "v" },
  --       desc = "Format Injected Langs",
  --     },
  --   },
  --   init = function()
  --     -- Install the conform formatter on VeryLazy
  --     require("lazyvim.util").on_very_lazy(function()
  --       require("lazyvim.util").format.register({
  --         name = "conform.nvim",
  --         priority = 100,
  --         primary = true,
  --         format = function(buf)
  --           local plugin = require("lazy.core.config").plugins["conform.nvim"]
  --           local Plugin = require("lazy.core.plugin")
  --           local opts = Plugin.values(plugin, "opts", false)
  --           require("conform").format(Util.merge(opts.format, { bufnr = buf }))
  --         end,
  --         sources = function(buf)
  --           local ret = require("conform").list_formatters(buf)
  --           ---@param v conform.FormatterInfo
  --           return vim.tbl_map(function(v)
  --             return v.name
  --           end, ret)
  --         end,
  --       })
  --     end)
  --   end,
  --   opts = function()
  --     local plugin = require("lazy.core.config").plugins["conform.nvim"]
  --     -- if plugin.config ~= M.setup then
  --     --   Util.error({
  --     --     "Don't set `plugin.config` for `conform.nvim`.\n",
  --     --     "This will break **LazyVim** formatting.\n",
  --     --     "Please refer to the docs at https://www.lazyvim.org/plugins/formatting",
  --     --   }, { title = "LazyVim" })
  --     -- end
  --     ---@class ConformOpts
  --     local opts = {
  --       -- LazyVim will use these options when formatting with the conform.nvim formatter
  --       format = {
  --         timeout_ms = 3000,
  --         async = false, -- not recommended to change
  --         quiet = false, -- not recommended to change
  --       },
  --       ---@type table<string, conform.FormatterUnit[]>
  --       formatters_by_ft = {
  --         javascript = { "prettier" },
  --         typescript = { "prettier" },
  --         javascriptreact = { "prettier" },
  --         typescriptreact = { "prettier" },
  --         svelte = { "prettier" },
  --         css = { "prettier" },
  --         scss = { "prettier" },
  --         html = { "prettier" },
  --         json = { "prettier" },
  --         yaml = { "prettier" },
  --         markdown = { "prettier" },
  --         graphql = { "prettier" },
  --         lua = { "stylua" },
  --         python = { "isort", "black" },
  --       },
  --       -- The options you set here will be merged with the builtin formatters.
  --       -- You can also define any custom formatters here.
  --       ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
  --       formatters = {
  --         injected = { options = { ignore_errors = true } },
  --         -- # Example of using dprint only when a dprint.json file is present
  --         -- dprint = {
  --         --   condition = function(ctx)
  --         --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
  --         --   end,
  --         -- },
  --         --
  --         -- # Example of using shfmt with extra args
  --         -- shfmt = {
  --         --   prepend_args = { "-i", "2", "-ci" },
  --         -- },
  --       },
  --       format_on_save = {
  --         lsp_fallback = true,
  --         async = false,
  --         timeout_ms = 500,
  --       },
  --     }
  --     return opts
  --   end,
  -- },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          svelte = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          graphql = { "prettier" },
          lua = { "stylua" },
          python = { "isort", "black" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end,
  },
}
