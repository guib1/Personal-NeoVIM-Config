return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "~/obsidian-vault",
      },
    },
    -- Set to true to force the UI to use the terminal instead of a GUI (if applicable)
    ui = {
      enable = true,
    }
  },
}