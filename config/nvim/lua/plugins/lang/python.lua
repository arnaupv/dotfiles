return {
  "jay-babu/mason-null-ls.nvim",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "black", "isort", "flake8" })
    end

    local null_ls = require("null-ls")
    opts.handlers = {
      -- function() end, -- disables automatic setup of all null-ls sources
      black = function(source_name, methods)
        null_ls.register(null_ls.builtins.formatting.black.with({
          extra_args = { "--line-length=120", "-t", "py37" },
        }))
      end,
      isort = function(source_name, methods)
        null_ls.register(null_ls.builtins.formatting.isort)
      end,
      flake8 = function(source_name, methods)
        null_ls.register(null_ls.builtins.diagnostics.flake8)
      end,
    }
  end,
}
