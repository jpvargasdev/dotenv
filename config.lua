-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
lvim.transparent_window = true 
lvim.colorscheme = "github_dark"

lvim.plugins = {
  -- Helm ls
  {
    'towolf/vim-helm',
    config = function()
      local configs = require('lspconfig.configs')
      local lspconfig = require('lspconfig')
      local util = require('lspconfig.util')

      if not configs.helm_ls then
        configs.helm_ls = {
          default_config = {
            cmd = {"helm_ls", "serve"},
            filetypes = {'helm'},
            root_dir = function(fname)
              return util.root_pattern('Chart.yaml')(fname)
            end,
          },
        }
      end

      lspconfig.helm_ls.setup {
        filetypes = {"helm"},
        cmd = {"helm_ls", "serve"},
      }
    end
  },
  -- LLM codeium
  {
    'Exafunction/codeium.vim',
    config = function ()
    end
  },
  -- Nx Package
  -- {
  --   'Equilibris/nx.nvim',
  --   dependencies = {
  --     'nvim-telescope/telescope.nvim',
  --   },
  --   config = function()
  --     require("nx").setup {}
  --   end
  -- },
  -- Dashboard plugin
  {
    "willothy/veil.nvim",
    lazy = true,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim"
    },
    config = true,
  },
  -- Terminal image viewer
  -- {"edluffy/hologram.nvim"},

  -- Github blamer
  {"APZelos/blamer.nvim"},

  -- Error shower
  -- {
  --   url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --   lazy = true,
  --   config = function()
  --     require("lsp_lines").setup()
  --   end
  -- },

  -- Barbecue
  -- {
  --   "utilyre/barbecue.nvim",
  --   name = "barbecue",
  --   version = "*",
  --   dependencies = {
  --     "SmiteshP/nvim-navic",
  --     "nvim-tree/nvim-web-devicons", -- optional dependency
  --   },
  --   opts = {
  --     -- configurations go here
  --   },
  -- },
  -- {
  --   'Bekaboo/dropbar.nvim',
  --   -- optional, but required for fuzzy finder support
  --   dependencies = {
  --     'nvim-telescope/telescope-fzf-native.nvim'
  --   },
  -- },

  -- Themes
  {"Mofiqul/dracula.nvim"},
  {"projekt0n/github-nvim-theme"},
  {"mhartington/oceanic-next"},
  {"sainnhe/gruvbox-material"},
  {"AlexvZyl/nordic.nvim"},
  {
    "glepnir/zephyr-nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opt = true
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },

}
vim.g.blamer_enabled = true
vim.diagnostic.config({ virtual_lines = false })

lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.view.width = 35
