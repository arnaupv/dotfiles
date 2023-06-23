return {
  -- { "nvim-neotest/neotest-plenary" },
  { "arnaupv/neotest-plenary", branch = "make-dap-available-in-the-adapter" },
  -- {
  --   dir = "/home/pontsoul/Documents/Lab/NvimPlugins/neotest-plenary/",
  --   config = true,
  --   dev = true,
  -- },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-plenary" } },
  },
}
