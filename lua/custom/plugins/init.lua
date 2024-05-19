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
  {
    'ggandor/leap.nvim',
    config = function()
      vim.keymap.set({ 'n', 'x', 'o' }, 'f', '<Plug>(leap-forward)')
      vim.keymap.set({ 'n', 'x', 'o' }, 'F', '<Plug>(leap-backward)')
      vim.keymap.set({ 'n', 'x', 'o' }, 'gw', '<Plug>(leap-from-window)')
    end,
  },
  'tpope/vim-fugitive',
}
