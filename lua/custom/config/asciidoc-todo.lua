local states = {
  empty = {
    [''] = true,
  },
  todo = {
    ['[ ]'] = true,
    ['TODO'] = true,
  },
  doing = {
    ['DOING'] = true,
  },
  done = {
    ['[x]'] = true,
    ['DONE'] = true,
  },
}

local function parse_state(text)
  if text == '' then
    return 'empty'
  end

  for k, v in pairs(states) do
    if v[text] then
      return k
    end
  end
end

local function render_state(state)
  if state == 'empty' then
    return ''
  elseif state == 'todo' then
    return 'TODO '
  elseif state == 'doing' then
    return 'DOING '
  elseif state == 'done' then
    return 'DONE '
  end
end

local state_transitions = {
  empty = 'todo',
  todo = 'doing',
  doing = 'done',
  done = 'empty',
}

local function invert_table(table)
  local s = {}
  for k, v in pairs(table) do
    s[v] = k
  end
  return s
end

local backward_state_transitions = invert_table(state_transitions)

local get_next_state = function(curr_state, rev)
  if rev then
    return backward_state_transitions[curr_state]
  else
    return state_transitions[curr_state]
  end
end

local function get_curr_state(text)
  local bullet_regex = vim.regex [[\v^\s*[\*-]+ \zs((\[ \]|\[x\]|TODO|DOING|DONE) )?\ze.*$]]
  local start_col, end_col = bullet_regex:match_str(text)

  if start_col == nil then
    return nil
  end

  local state_text = string.sub(text, start_col + 1, end_col - 1)
  local curr_state = parse_state(state_text)

  return curr_state, start_col, end_col
end

local function toggle(text, rev)
  local curr_state, start_col, end_col = get_curr_state(text)

  if curr_state then
    return render_state(get_next_state(curr_state, rev)), start_col, end_col
  end
end

local function toggle_curr_line(opts)
  opts = opts or {}

  local line_number = vim.api.nvim_win_get_cursor(0)[1]
  local curr_line = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1]

  local new_state, start_col, end_col = toggle(curr_line, opts.backwards)

  if new_state ~= nil then
    vim.api.nvim_buf_set_text(0, line_number - 1, start_col, line_number - 1, end_col, { new_state })
  end
end

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = '*.adoc',
  callback = function()
    vim.keymap.set('n', '<D-CR>', toggle_curr_line, { desc = 'Toggle todo state' })
    vim.keymap.set('n', '<leader>td', toggle_curr_line, { desc = 'Toggle todo state' })

    vim.keymap.set('n', '<D-S-CR>', function()
      toggle_curr_line { backwards = true }
    end, { desc = 'Toggle todo state' })
    vim.keymap.set('n', '<leader>tD', function()
      toggle_curr_line { backwards = true }
    end, { desc = 'Toggle todo state' })
  end,
})
