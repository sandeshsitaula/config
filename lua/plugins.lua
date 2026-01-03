
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' 

    -- Colorscheme & UI
    use 'morhetz/gruvbox'
    use 'rebelot/kanagawa.nvim'
    use 'itchyny/lightline.vim'
    use 'dstein64/nvim-scrollview'
    
    -- Indent lines (Pinned version)
    use {
      'lukas-reineke/indent-blankline.nvim',
      main = 'ibl',
      commit = "3d08501caef2329aba5121b753e903904088f7e6",
    }

    -- CoC for autocompletion
    use {'neoclide/coc.nvim', branch = 'release'}

    -- Language Specific (Go, JS, JSX)
    use 'ray-x/go.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'pangloss/vim-javascript'
    use 'maxmellon/vim-jsx-pretty'
    
    -- Utilities
    use 'machakann/vim-highlightedyank'
    use 'andymass/vim-matchup'
    use 'sbdchd/neoformat'
    use 'ciaranm/securemodelines'
    use 'editorconfig/editorconfig-vim'

    -- FZF (Keeping for legacy support)
    use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
    use 'junegunn/fzf.vim'

    -- High-speed recent buffer switching
    use { 'leath-dub/snipe.nvim', config = function() require("snipe").setup() end }

    -- Edit your folder structure like a text buffer
    use { 'stevearc/oil.nvim', config = function() require("oil").setup() end }

    -- Smart comment toggling with gc or gb
    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

    -- Powerful fuzzy finder for text and files (will use for text only)
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { {'nvim-lua/plenary.nvim'} } }

    -- Lightweight automatic bracket closer
    use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }

    -- Instant jumping between your 4 most important files
    use { "ThePrimeagen/harpoon", branch = "harpoon2", requires = { {"nvim-lua/plenary.nvim"} } }


    -- 2. Telescope Undo (Searchable History)
    use { "debugloop/telescope-undo.nvim" }

    -- 3. ToggleTerm (Popup Terminal)
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<C-_>]], -- Ctrl + / to open/close
        direction = 'horizontal', -- Opens at the bottom like a drawer
      })
    end}

end)

require("ibl").setup({
  indent = { char = "│" }, -- Character used for the indent guide
  scope = { enabled = false }, -- Disable scope highlighting if not needed
})

-- Colorscheme
-- vim.cmd 'colorscheme gruvbox'

vim.g.coc_global_extensions = {"coc-tsserver"}

