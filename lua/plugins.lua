
require('packer').startup(function(use)
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

    use 'ray-x/go.nvim'
    use 'nvim-treesitter/nvim-treesitter'


    -- Syntax and colors
    use 'sheerun/vim-polyglot'
    use 'dstein64/nvim-scrollview'
    use 'pangloss/vim-javascript'
    use 'maxmellon/vim-jsx-pretty'
    use {'sonph/onehalf', rtp = 'vim'}
    use 'RRethy/nvim-base16'

    -- showing code block with lines
    use {
      'lukas-reineke/indent-blankline.nvim',
      main = 'ibl',
      commit = "3d08501caef2329aba5121b753e903904088f7e6", -- Pin to v3.5.4
      dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- Add dependency
    }



end)

require("ibl").setup({
  indent = { char = "│" }, -- Character used for the indent guide
  scope = { enabled = false }, -- Disable scope highlighting if not needed
})

-- Colorscheme
vim.cmd 'colorscheme gruvbox'
vim.g.coc_global_extensions = {"coc-tsserver"}

