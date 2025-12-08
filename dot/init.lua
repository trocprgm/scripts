vim.cmd('source ~/.vimrc')

local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
          '^node_modules/', -- Ignore node_modules directory
          '%.log',         -- Ignore files ending with .log
          'build/',        -- Ignore build directory
          '.git/',
          '.cache/',
        },
    -- mappings = {
    --   i = {
    --     ["<C-_>"] = actions.move_selection_previous, -- make Ctrl-/ act like Ctrl-p
    --     ["<C-p>"] = false,                            -- disable original Ctrl-p
    --     ["?"] = false,                                -- stop Telescope help from opening on Ctrl-/
    --     ["<F2>"] = actions.which_key
    --   },
    --   n = {
    --     ["<C-_>"] = actions.move_selection_previous,  -- optional: same in normal mode of picker
    --     ["<F2>"] = actions.which_key
    --   },
    -- },
  },
})

require('telescope').setup({
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = false
    }
  }
})

