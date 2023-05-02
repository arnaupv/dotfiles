return {
  {
    "ThePrimeagen/harpoon",
    keys = {
      { "<leader>h", ":lua require('harpoon.mark').add_file()<cr>", desc = "[H]arpoon [M]ark" },
      { "<leader>hf", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "[H]arpoon [F]iles" },
      { "<leader>hn", ":lua require('harpoon.ui').nav_next()<cr>", desc = "[H]arpoon [N]ext" },
      { "<leader>hp", ":lua require('harpoon.ui').nav_prev()<cr>", desc = "[H]arpoon [P]revious" },
      { "<leader>sh", ":Telescope harpoon marks<cr>", desc = "[S]earch [H]arpoon" },
    },
  },
}
