return {
  {
    "vim-test/vim-test",
    opts = {
      setup = {},
    },
    config = function(plugin, opts)
      vim.g["test#strategy"] = "neovim"
      vim.g["test#neovim#term_position"] = "belowright"
      vim.g["test#neovim#preserve_screen"] = 1

      -- Set up vim-test
      for k, _ in pairs(opts.setup) do
        opts.setup[k](plugin, opts)
      end
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-plenary" },
    opts = function(_, opts)
      vim.list_extend(opts.adapters, {
        require("neotest-plenary"),
      })
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "vim-test/vim-test",
      "nvim-neotest/neotest-vim-test",
    },
    opts = function(_, opts)
      vim.list_extend(opts.adapters, {
        require("neotest-vim-test")({ ignore_file_types = { "python", "vim", "lua" } }),
      })
    end,
  },
}
