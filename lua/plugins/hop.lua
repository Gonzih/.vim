-- Hop.nvim configuration (modern replacement for easymotion)
require('hop').setup()

-- Key mappings for hop
vim.keymap.set('', '<Leader>f', function()
  require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR })
end, { remap = true })

vim.keymap.set('', '<Leader>F', function()
  require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR })
end, { remap = true })

vim.keymap.set('', '<Leader>w', function()
  require('hop').hint_words()
end, { remap = true })

vim.keymap.set('', '<Leader>l', function()
  require('hop').hint_lines()
end, { remap = true })