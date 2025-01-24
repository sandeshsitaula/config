-- Load basic settings
require('settings')

-- Load plugins
require('plugins')

-- Load keymaps
require('keymap')

require('go_nvim')

vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })

