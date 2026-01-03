-- Set leader to Space
vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- General key mappings
map('n', '<C-C>', '"+y', opts)
map('v', '<C-C>', '"+y', opts)
map('n', '<C-s>', ':w<CR>', opts)
map('i', '<C-s>', '<C-o>:w<CR>', opts)
map('i', '<C-x>', '<esc>:qa!<cr>', opts)
map('n', '<C-x>', ':qa!<cr>', opts)
map('n', '<F5>', ':buffers<cr>:b<space>', opts)

-- Disable arrow keys
for _, key in ipairs({'<Up>', '<Down>', '<Left>', '<Right>'}) do
    map('n', key, '<Nop>', opts)
    map('i', key, '<Nop>', opts)
    map('c', key, '<Nop>', opts)
end

-- CoC key mappings (existing)
map('n', 'gd', '<Plug>(coc-definition)', { silent = true })
map('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
map('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
map('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- FZF mappings (existing)
vim.api.nvim_set_keymap('n', '<C-p>', ':FZF<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-p>', ':FZF<CR>', { noremap = true })

-- Snipe mapping (existing)
vim.keymap.set("n", "<C-a>", require("snipe").open_buffer_menu, { desc = "Open Snipe buffer menu" })

-- Oil: Edit folders like a text buffer
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory in Oil" })


-- Telescope: Modern Fuzzy Finder
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.live_grep, { desc = "Telescope Live Grep (Search Text)" })

-- Harpoon: Quick jump between your 4 most important files
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Menu" })
vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end, { desc = "Harpoon Mark File" })
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)


-- Go Specific (go.nvim)
vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<cr>", { desc = "Add if err block" })

-- First, load the extension (add this line once)
require("telescope").load_extension("undo")

vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "Search Undo History" })
