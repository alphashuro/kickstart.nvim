-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'tpope/vim-vinegar',
  'tpope/vim-repeat',
  'pmizio/typescript-tools.nvim',
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup()
    end,
  },
  { 'tpope/vim-dadbod' },
  { 'kristijanhusak/vim-dadbod-ui' },
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
    config = function()
      vim.keymap.set({ 'n', 'x', 'o' }, '<leader>gg', ':Git<CR>', { desc = 'Git status' })
    end,
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
    'AndrewRadev/splitjoin.vim',
    config = function()
      vim.keymap.set('n', 'gS', ':SplitjoinSplit<CR>', { desc = 'Split' })
      vim.keymap.set('n', 'gJ', ':SplitjoinJoin<CR>', { desc = 'Join' })
    end,
  },

  {
    'simnalamburt/vim-mundo',
    config = function()
      vim.keymap.set('n', 'tu', ':MundoToggle<CR>', { desc = 'Toggle undo tree' })
    end,
  },

  'idanarye/vim-merginal',
}
