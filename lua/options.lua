require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- Highlights both the line and column of the cursor.
o.wrap = false -- Disable word wrap
o.expandtab = true -- Use spaces instead of tabs
o.shiftwidth = 4 -- Set indentation width to 4 spaces
o.tabstop = 4 -- Set tab width to 4 spaces- o.cursorlineopt ='both' -- to enable cursorline!
-- Set folding method and level for Treesitter
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevel = 99 -- Opens all folds by default
o.foldenable = true
o.foldlevelstart = 99 -- Ensures all folds are open when opening a file
o.foldcolumn = "0"
o.foldtext = ""
