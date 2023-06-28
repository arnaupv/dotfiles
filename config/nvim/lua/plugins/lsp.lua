return {
  -- mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Javascript
        -- "eslint_d",
        -- "deno",
        -- Python
        "pyright",
        -- Docker
        "dockerfile-language-server",
        "docker-compose-language-service",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        -- https://alpha2phi.medium.com/modern-neovim-debugging-and-testing-8deda1da1411
        --
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "off",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
        },
      },
      -- setup = {
      --   pyright = function(_, opts)
      --     local lsp_utils = require("plugins.lsp.utils")
      --     lsp_utils.on_attach(function(client, buffer)
      --         -- stylua: ignore
      --         if client.name == "pyright" then
      --           vim.keymap.set("n", "<leader>tC", function() require("dap-python").test_class() end, { buffer = buffer, desc = "Debug Class" })
      --           vim.keymap.set("n", "<leader>tM", function() require("dap-python").test_method() end, { buffer = buffer, desc = "Debug Method" })
      --           vim.keymap.set("v", "<leader>tS", function() require("dap-python").debug_selection() end, { buffer = buffer, desc = "Debug Selection" })
      --         end
      --     end)
      --   end,
      -- },
    },
  },
  -- nav-buddy
  {
    "SmiteshP/nvim-navbuddy",
    -- event = "LspAttach",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "SmiteshP/nvim-navic" },
      { "MunifTanjim/nui.nvim" },
      { "numToStr/Comment.nvim" },
    },
    opts = {
      window = {
        size = "80%",
        border = "rounded",
        sections = {
          left = {
            size = "20%",
            border = nil, -- You can set border style for each section individually as well.
          },
          mid = {
            size = "60%",
            border = nil,
          },
          right = {
            -- No size option for right most section. It fills to
            -- remaining area.
            border = nil,
            preview = "leaf", -- Right section can show previews too.
            -- Options: "leaf", "always" or "never"
          },
        },
      },
      lsp = { auto_attach = true },
    },
  },
  -- nav-navic
  {
    "SmiteshP/nvim-navic",
    event = "LspAttach",
    dependencies = {
      { "neovim/nvim-lspconfig" },
    },
  },
  -- mason-null-ls
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    opts = {
      ensure_installed = {},
      automatic_setup = false,
      automatic_installation = true,
      -- handlers = {},
    },
  },
  -- custom language specific extension modules
  { import = "plugins.lang.java" },
  { import = "plugins.lang.markdown" },
  { import = "plugins.lang.lua" },
  { import = "plugins.lang.sh" },
  { import = "plugins.lang.python" },
  { import = "plugins.lang.docker" },
  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local nls = require("null-ls")
      nls.setup({
        debounce = 150,
        save_after_format = false,
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
      })
    end,
  },
}
