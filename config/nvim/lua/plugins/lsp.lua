return {
  -- mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        "stylua",
        "selene",
        "luacheck",
        "eslint_d",
        "shellcheck",
        "deno",
        "shfmt",
        -- Python
        "pyright",
        "black",
        "isort",
        "flake8",
        -- Java
        "semgrep",
        "google-java-format",
        -- Docker
        "dockerfile-language-server",
        "docker-compose-language-service",
        "hadolint",
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
  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local nls = require("null-ls")
      nls.setup({
        debounce = 150,
        save_after_format = false,
        sources = {
          -- nls.builtins.formatting.prettierd,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.fish_indent,
          -- nls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
          -- nls.builtins.formatting.eslint_d,
          -- nls.builtins.diagnostics.shellcheck,
          nls.builtins.formatting.shfmt,
          nls.builtins.diagnostics.markdownlint,
          -- nls.builtins.diagnostics.luacheck,
          nls.builtins.formatting.prettierd.with({
            filetypes = { "markdown" }, -- only runs `deno fmt` for markdown
          }),
          nls.builtins.diagnostics.selene.with({
            condition = function(utils)
              return utils.root_has_file({ "selene.toml" })
            end,
          }),
          -- nls.builtins.code_actions.gitsigns,
          nls.builtins.formatting.isort,
          nls.builtins.formatting.black.with({ extra_args = { "--line-length=120", "-t", "py37" } }),
          nls.builtins.diagnostics.flake8.with({ extra_args = { "--max-line-length=120" } }),
          -- JAVA
          nls.builtins.formatting.google_java_format,
          nls.builtins.diagnostics.semgrep.with({ extra_args = { "--config", "auto" } }),
          -- Docker
          nls.builtins.diagnostics.hadolint,
        },
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
      })
    end,
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
  -- custom language specific extension modules
  { import = "plugins.lang.java" },
}
