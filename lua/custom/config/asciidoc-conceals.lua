local function conceal_links()
  vim.api.nvim_set_hl(0, 'Conceal', { bg = 'NONE', fg = '#00cf37' })
  -- vim.bo.conceallevel = 1

  vim.cmd [[
    call matchadd('Conceal', '\S\+\[\ze\(.\)\+\]', 10, -1, { 'conceal': '↖︎' })
    call matchadd('Conceal', '\S\+\[.\+\zs\]', 10, -1, { 'conceal': '↖︎' })
  ]]
end

local augroup = vim.api.nvim_create_augroup('asciidoc', {})
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.adoc',
  group = augroup,
  callback = function()
    conceal_links()
  end,
})
