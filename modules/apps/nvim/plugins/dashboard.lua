return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = {
          "",
          " ██████╗  ██████╗ ███████╗███████╗    ██████╗ ██╗███╗   ██╗███████╗",
          " ██╔══██╗██╔═══██╗██╔════╝██╔════╝    ██╔══██╗██║████╗  ██║██╔════╝",
          " ██████╔╝██║   ██║███████╗█████╗      ██████╔╝██║██╔██╗ ██║█████╗  ",
          " ██╔══██╗██║   ██║╚════██║██╔══╝      ██╔═══╝ ██║██║╚██╗██║██╔══╝  ",
          " ██║  ██║╚██████╔╝███████║███████╗    ██║     ██║██║ ╚████║███████╗",
          " ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═══╝╚══════╝",
          "",
          "              strings attached              ",
          "",
        },
        center = {
          { icon = "  ", desc = "Find File",    key = "f", action = "Telescope find_files" },
          { icon = "  ", desc = "Recent Files", key = "r", action = "Telescope oldfiles" },
          { icon = "  ", desc = "Find Word",    key = "g", action = "Telescope live_grep" },
          { icon = "  ", desc = "New File",     key = "n", action = "enew" },
          { icon = "  ", desc = "Config",       key = "c", action = "edit ~/.config/nvim/init.lua" },
          { icon = "  ", desc = "Quit",         key = "q", action = "qa" },
        },
        footer = {
          "",
          "  NixOS · Rosé Pine · Hyprland",
        },
      },
    })
    vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#c4a7e7" })
    vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#e0def4" })
    vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#6e6a86" })
    vim.api.nvim_set_hl(0, "DashboardKey",    { fg = "#eb6f92" })
    vim.api.nvim_set_hl(0, "DashboardDesc",   { fg = "#908caa" })
    vim.api.nvim_set_hl(0, "DashboardIcon",   { fg = "#9ccfd8" })
  end,
}
