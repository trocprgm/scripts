vim.cmd('source /home/rhom/.config/nvim/vimrc')

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- require("mason-lspconfig").setup({
    -- automatic_enable = {
    --     "clangdserver",
    --     "luaserver",
        -- automatic_enable = "true"
-- })


-- vim.lsp.enable('luaserver')
vim.lsp.enable('clangd')

local actions = require('telescope.actions')

-- require('cmp_nvim_lsp').setup()

-- require'cmp'.setup {
--   sources = {
--     { name = 'nvim_lsp' }
--   }
-- }


require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
          '^node_modules/', -- Ignore node_modules directory
          '%.log',         -- Ignore files ending with .log
          'build/',        -- Ignore build directory
	   '.git/',
          '.cache/',
        },
    mappings = {
      i = {
        ["<C-_>"] = actions.move_selection_previous, -- make Ctrl-/ act like Ctrl-p
        ["<C-p>"] = false,                            -- disable original Ctrl-p
        ["?"] = false,                                -- stop Telescope help from opening on Ctrl-/
        ["<F2>"] = actions.which_key
      },
      n = {
        ["<C-_>"] = actions.move_selection_previous,  -- optional: same in normal mode of picker
        ["<F2>"] = actions.which_key
      },
    },
  },
})




vim.lsp.config.clangd = {
    cmd = {
      'clangd',
      -- '--clang-tidy',
      -- '--background-index',
      -- '--offset-encoding=utf-8',
    },
    root_markers = { '.clangd', 'compile_commands.json' },
    filetypes = { 'c'},
    }
