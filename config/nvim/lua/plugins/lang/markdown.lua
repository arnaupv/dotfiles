return {
  "jay-babu/mason-null-ls.nvim",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "markdownlint", "prettierd" })
    end

    local null_ls = require("null-ls")
    opts.handlers = {
      function() end, -- disables automatic setup of all null-ls sources
      -- prettierd = function(source_name, methods)
      --   null_ls.register(null_ls.builtins.formatting.prettierd.with({
      --     filetypes = { "markdown" },
      --   }))
      -- end,
      markdownlint = function(source_name, methods)
        null_ls.register(null_ls.builtins.diagnostics.markdownlint)
      end,
    }
  end,
}
