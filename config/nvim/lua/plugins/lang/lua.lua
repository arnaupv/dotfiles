return {
  "jay-babu/mason-null-ls.nvim",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        "luacheck",
        "stylua",
        -- "selene",
      })
    end

    local null_ls = require("null-ls")
    opts.handlers = {
      function() end, -- disables automatic setup of all null-ls sources
      stylua = function(source_name, methods)
        null_ls.register(null_ls.builtins.formatting.stylua)
      end,
      luacheck = function(source_name, methods)
        null_ls.register(null_ls.builtins.diagnostics.luacheck.with({ extra_args = { "--config", "auto" } }))
      end,
      -- selene = function(source_name, methods)
      --   null_ls.register(null_ls.builtins.diagnostics.selene.with({
      --     condition = function(utils)
      --       return utils.root_has_file({"selene.toml"})
      --     end
      --   }))
      -- end
    }
  end,
}
