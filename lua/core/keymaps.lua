vim.g.mapleader = "\\"

-- Open Neotree bind
vim.keymap.set("n", "'", function()
  require("neo-tree.command").execute({ toggle = true })
end, { desc = "Toggle Neo-tree" })

-- Open bottom terminal
vim.keymap.set("n", "<leader>t", function()
  require("toggleterm").exec("", 1)
end, { desc = "Abrir terminal em baixo" })

-- Run gradle tasks
vim.keymap.set("n", "<leader>gj", function()
  require("toggleterm").exec("gradle run", 1)
end, { desc = "Gradle: Run Project" })

-- Only build
vim.keymap.set("n", "<leader>gb", function()
  require("toggleterm").exec("gradle build", 1)
end, { desc = "Gradle: Build" })

-- Test Gradle 
vim.keymap.set("n", "<leader>gt", function()
  require("toggleterm").exec("gradle test", 1)
end, { desc = "Gradle: Run Tests" })

-- General Commands

-- Disable arrow keys for navigation
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Easily split windows
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", { desc = "[W]indow Split [V]ertical" })
vim.keymap.set("n", "<leader>wh", ":split<cr>", { desc = "[W]indow Split [H]orizontal" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

-- Exit Vim's terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Close window
vim.keymap.set("n", "<leader>cw", ":close<cr>", { desc = "Close window"})
