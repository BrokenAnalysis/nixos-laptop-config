return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "nil_ls",
        "ts_ls",
        "pyright",
        "emmet_ls",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Keymaps on LSP attach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local map = vim.keymap.set
          local opts = { buffer = ev.buf }
          map("n", "gd",         vim.lsp.buf.definition,      opts)
          map("n", "K",          vim.lsp.buf.hover,           opts)
          map("n", "<leader>ca", vim.lsp.buf.code_action,     opts)
          map("n", "<leader>rn", vim.lsp.buf.rename,          opts)
          map("n", "[d",         vim.diagnostic.goto_prev,    opts)
          map("n", "]d",         vim.diagnostic.goto_next,    opts)
          map("n", "<leader>d",  vim.diagnostic.open_float,   opts)
        end,
      })
    end,
  },
}
