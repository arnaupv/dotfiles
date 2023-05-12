return {
  -- nav-buddy
  {
    "miversen33/netman.nvim",
    config = function()
      require("netman")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      popup_border_style = "rounded",
      default_component_configs = {
        name = {
          highlight_opened_files = "all",
        },
      },
      sources = {
        "filesystem", -- Neotree filesystem source
        "netman.ui.neo-tree", -- The one you really care about 😉
      },
    },
  },
}
