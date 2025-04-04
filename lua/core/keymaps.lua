vim.g.mapleader = "\\"
-- Esc to tab
vim.keymap.set("i", "<tab>", "<esc>l", { desc = "Back to normal mode" })
-- Open Neotree bind
vim.keymap.set("n", "'", function()
  require("neo-tree.command").execute({ toggle = true })
end, { desc = "Toggle Neo-tree" })
-- Executar taks gradle Java
vim.keymap.set("n", "<leader>gj", function()
  require("toggleterm").exec("gradle run", 1)
end, { desc = "Gradle: Run Project" })

-- Build apenas
vim.keymap.set("n", "<leader>gb", function()
  require("toggleterm").exec("gradle build", 1)
end, { desc = "Gradle: Build" })

-- Testes
vim.keymap.set("n", "<leader>gt", function()
  require("toggleterm").exec("gradle test", 1)
end, { desc = "Gradle: Run Tests" })
