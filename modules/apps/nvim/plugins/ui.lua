return {
  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "rose-pine",
        component_separators = { left = "", right = "" },
        section_separators   = { left = "", right = "" },
      },
    },
  },

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File tree" },
    },
    opts = {
      view = { width = 30 },
      renderer = { group_empty = true },
    },
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "│" },
      scope  = { enabled = true },
    },
  },

  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Which key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
