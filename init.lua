-- Set basic options
vim.o.autowrite = true
vim.o.errorbells = false
vim.o.nu = true
vim.o.hls = false
vim.o.wrap = false
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.ruler = true
vim.o.showcmd = true
vim.o.list = false
vim.o.relativenumber = true
vim.o.hidden = true
vim.o.mouse = 'a'
vim.o.swapfile = false
vim.o.backup = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.undodir = vim.fn.expand('~/.config/nvim/undodir')
vim.o.undofile = true
vim.o.scrolloff = 8
vim.o.signcolumn = 'yes'
vim.o.cmdheight = 2
vim.o.background = 'dark'
vim.o.encoding = 'UTF-8'
vim.o.omnifunc = 'syntaxcomplete#Complete'

-- Enable filetype plugins and indentation
vim.cmd 'filetype plugin indent on'

-- Set Go specific settings
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_operators = 1
vim.g.go_fmt_autosave = 1
vim.g.go_fmt_command = 'goimports'
vim.g.go_auto_type_info = 1

-- Plugin management with packer.nvim
vim.cmd [[packadd packer.nvim]]
require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Packer can manage itself

    -- Colorscheme
    use 'morhetz/gruvbox'

    -- Undo tree
    use 'mbbill/undotree'

    -- Auto pairs
    use 'jiangmiao/auto-pairs'

    -- CoC for autocompletion
    use {'neoclide/coc.nvim', branch = 'release'}

    -- Secure modelines
    use 'ciaranm/securemodelines'

    -- Editorconfig support
    use 'editorconfig/editorconfig-vim'

    -- Lightline
    use 'itchyny/lightline.vim'

    -- Highlight yanked text
    use 'machakann/vim-highlightedyank'

    -- Enhanced matching
    use 'andymass/vim-matchup'

    -- Neoformat
    use 'sbdchd/neoformat'

    -- FZF
    use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
    use 'junegunn/fzf.vim'

    -- Language support
    use 'sheerun/vim-polyglot'
    use 'dstein64/nvim-scrollview'
    use 'pangloss/vim-javascript'
    use 'maxmellon/vim-jsx-pretty'
    use {'sonph/onehalf', rtp = 'vim'}
    use 'RRethy/nvim-base16'
end)

-- Colorscheme
vim.cmd 'colorscheme gruvbox'

-- Key mappings
vim.api.nvim_set_keymap('n', '<C-C>', '"+y', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-C>', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<c-s>', '<c-o>:w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-x>', '<esc>:qa!<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-x>', ':qa!<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<silent> <C-p>', ':Files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F5>', ':buffers<cr>:b<space>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-a>', ':buffers<cr>:b<space>', { noremap = true, silent = true })

-- Disable arrow keys
for _, key in ipairs({'<Up>', '<Down>', '<Left>', '<Right>'}) do
    vim.api.nvim_set_keymap('n', key, '<Nop>', { noremap = true })
    vim.api.nvim_set_keymap('i', key, '<Nop>', { noremap = true })
    vim.api.nvim_set_keymap('c', key, '<Nop>', { noremap = true })
end

-- CoC settings
vim.g.coc_global_extensions = {"coc-tsserver"}
vim.api.nvim_set_keymap('n', '<silent> gd', '<Plug>(coc-definition)', {})
vim.api.nvim_set_keymap('n', '<silent> gy', '<Plug>(coc-type-definition)', {})
vim.api.nvim_set_keymap('n', '<silent> gi', '<Plug>(coc-implementation)', {})
vim.api.nvim_set_keymap('n', '<silent> gr', '<Plug>(coc-references)', {})

-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? (complete_info().selected == -1 ? "\\<C-n>" : "\\<C-n>\\<C-y>") : "\\<Tab>"', { expr = true, noremap = true, silent = true })
function _G.check_backspace()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use <cr> to confirm completion
vim.api.nvim_set_keymap('i', '<cr>', 'pumvisible() ? coc#pum#confirm() : "<C-g>u<CR>"', { noremap = true, silent = true, expr = true })

-- Show documentation on K
vim.api.nvim_set_keymap('n', 'K', '<CMD>lua show_documentation()<CR>', { noremap = true, silent = true })
function show_documentation()
    local filetype = vim.bo.filetype
    if filetype == 'vim' or filetype == 'help' then
        vim.cmd('h ' .. vim.fn.expand('<cword>'))
    else
        vim.fn.CocActionAsync('doHover')
    end
end

-- Neoformat settings
vim.cmd [[
augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript,golang,go setlocal formatprg=prettier\ --stdin\ --print-width\ 80\ --single-quote\ --trailing-comma\ es5
    autocmd BufWritePre *.js,*.jsx,*.go Neoformat
augroup END
]]

vim.api.nvim_set_keymap('n', '<C-p>', ':FZF<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-p>', ':FZF<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-p>', ':FZF<CR>', { noremap = true })
