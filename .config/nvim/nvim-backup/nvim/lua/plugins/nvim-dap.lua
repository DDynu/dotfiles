return {
  -- "mfussenegger/nvim-dap",
  -- event = "VeryLazy",
  -- dependencies = {
  --   "rcarriga/nvim-dap-ui",
  --   "nvim-neotest/nvim-nio",
  --   "jay-babu/mason-nvim-dap.nvim",
  --   "theHamsta/nvim-dap-virtual-text",
  -- },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
    lazy = false,
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle {}
        end,
        desc = "Dap UI",
      },
    },
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
    dependencies = { "mfussenegger/nvim-dap", "nvim-dap-ui" },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
  },
  {
    "nvim-neotest/nvim-nio",
  },
}
