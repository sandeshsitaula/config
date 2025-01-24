local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- General key mappings
map('n', '<C-C>', '"+y', opts)
map('v', '<C-C>', '"+y', opts)
map('n', '<C-s>', ':w<CR>', opts)
map('i', '<C-s>', '<C-o>:w<CR>', opts)
map('i', '<C-x>', '<esc>:qa!<cr>', opts)
map('n', '<C-x>', ':qa!<cr>', opts)
map('n', '<C-p>', ':Files<CR>', opts)
map('n', '<F5>', ':buffers<cr>:b<space>', opts)
map('n', '<C-a>', ':buffers<cr>:b<space>', opts)

-- Disable arrow keys
for _, key in ipairs({'<Up>', '<Down>', '<Left>', '<Right>'}) do
    map('n', key, '<Nop>', opts)
    map('i', key, '<Nop>', opts)
    map('c', key, '<Nop>', opts)
end

-- CoC key mappings
map('n', '<silent> gd', '<Plug>(coc-definition)', {})
map('n', '<silent> gy', '<Plug>(coc-type-definition)', {})
map('n', '<silent> gi', '<Plug>(coc-implementation)', {})
map('n', '<silent> gr', '<Plug>(coc-references)', {})

vim.api.nvim_set_keymap('n', '<C-p>', ':FZF<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-p>', ':FZF<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-p>', ':FZF<CR>', { noremap = true })

