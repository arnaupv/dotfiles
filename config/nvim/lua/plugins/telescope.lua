-- Default configuration has been overwritten: lua/lazyvim/plugins/telescope.nvim
-- As we want to pin versio 0.1.1 for now, in order to avoid inconsistencies and
-- unexpected behavior.
return {
  "telescope.nvim",
  tag = "0.1.1",
  version = "<=0.1.1",
  dependencies = {
    -- project management
    {
      "ahmedkhalf/project.nvim",
      opts = {},
      event = "VeryLazy",
      config = function(_, opts)
        require("project_nvim").setup(opts)
        require("telescope").load_extension("projects")
      end,
      keys = {
        { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
      },
    },
  },
}
