-- require './asciidoc.lua'

return {
  'tpope/vim-vinegar',
  'tpope/vim-repeat',
  'pmizio/typescript-tools.nvim',
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',
  'idanarye/vim-merginal',
  { 'git@github.com:akinsho/toggleterm.nvim.git', version = '*', config = true },

  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup()
    end,
  },

  {
    'ggandor/leap.nvim',
    config = function()
      vim.keymap.set({ 'n', 'x', 'o' }, 'f', '<Plug>(leap-forward)')
      vim.keymap.set({ 'n', 'x', 'o' }, 'F', '<Plug>(leap-backward)')
      vim.keymap.set({ 'n', 'x', 'o' }, 'gw', '<Plug>(leap-from-window)')
    end,
  },

  {
    'tpope/vim-fugitive',
    config = function() end,
  },

  {
    'ldelossa/litee.nvim',
    event = 'VeryLazy',
    opts = {
      notify = { enabled = false },
      panel = { orientation = 'bottom', panel_size = 10 },
    },
    config = function(_, opts)
      require('litee.lib').setup(opts)
    end,
  },

  {
    'ldelossa/litee-calltree.nvim',
    dependencies = 'ldelossa/litee.nvim',
    event = 'VeryLazy',
    opts = {
      on_open = 'panel',
      map_resize_keys = false,
    },
    config = function(_, opts)
      require('litee.calltree').setup(opts)
    end,
  },

  {
    'simnalamburt/vim-mundo',
    config = function()
      vim.keymap.set('n', 'tu', ':MundoToggle<CR>', { desc = 'Toggle undo tree' })
    end,
  },

  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-tree/nvim-web-devicons', -- for diffview
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('neogit').setup {}
      vim.keymap.set({ 'n', 'x', 'o' }, '<leader>gg', ':Neogit<CR>', { desc = 'Git status' })
      vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>', { desc = 'Diff' })
      vim.keymap.set('n', '<leader>gH', ':DIffviewFileHistory<CR>', { desc = 'File history' })
    end,
  },
}
