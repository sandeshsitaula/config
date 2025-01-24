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

-- Enable filetype plugins and indentation
vim.cmd 'filetype plugin indent on'

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

-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? (complete_info().selected == -1 ? "\\<C-n>" : "\\<C-n>\\<C-y>") : "\\<Tab>"', { expr = true, noremap = true, silent = true })
function _G.check_backspace()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use <cr> to confirm completion
vim.api.nvim_set_keymap('i', '<cr>', 'pumvisible() ? coc#pum#confirm() : "<C-g>u<CR>"', { noremap = true, silent = true, expr = true })

vim.cmd [[
let g:save_counter_js_ts = 0

augroup NeoformatAutoFormat
    autocmd!
    " Always format Go files on save
    autocmd BufWritePre *.go Neoformat

    " Always format Python files on save
    " autocmd BufWritePre *.py Neoformat

    " Format JavaScript and TypeScript files after every 5 saves
    autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.py call RunJsTsFormatter()
augroup END

function! RunJsTsFormatter()
    " Increment the save counter for JS/TS
    let g:save_counter_js_ts += 1

    " Only format on every 5th save
    if g:save_counter_js_ts % 5 == 0
        Neoformat
    endif
endfunction
]]


