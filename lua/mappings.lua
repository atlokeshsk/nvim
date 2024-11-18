require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- terminal
map("t", "jk", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
