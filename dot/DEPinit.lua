-- local luaserver = ("/home/rhom/.config/nvim/luaserver")
-- vim.lsp.enable('/home/rhom/.config/nvim/luaserver')

local clangd = ("/home/rhom/.config/nvim/clangd.lua")

-- /home/rhom/.config/nvim/clangd.lua
-- local matlab_ls = ("/home/rhom/.config/nvim/matlab_ls")
-- local pylsp = ("/home/rhom/.config/nvim/pylsp")

vim.opt.runtimepath:append ".local/share/nvim/plugged/mason.nvim/$PATH"
vim.opt.runtimepath:append ".local/share/nvim/mason/"
vim.opt.runtimepath:append "/home/rhom/.local/share/nvim/lazy/lazy.nvim/lua/lazy/"
vim.opt.runtimepath:append ".config/nvim"

-- vim.cmd('source /home/rhom/.config/nvim/vimrc')
vim.cmd('source /home/rhom/scripts/dot/vimrc')

-- require("mason").setup({
--     ui = {
--         icons = {
--             package_installed = "✓",
--             package_pending = "➜",
--             package_uninstalled = "✗"
--         }
--     }
-- })




-- vim.lsp.config["matlab_ls"] = {
  -- cmd = { "/home/rhom/.local/share/nvim/mason/packages/matlab-language-server/matlab-language-server"  },
  -- cmd = {       '/home/rhom/.config/nvim/matlab_ls' },
    -- filetypes = { 'matlab', 'm'},
-- }

-- vim.lsp.enable('matlab_ls')
--
vim.lsp.config["clangd"] = {
    cmd = {
      '/home/rhom/.config/nvim/clangd',
      '--clang-tidy',
      '--background-index',
      '--offset-encoding=utf-8',
    },
    root_markers = { '.clangd', 'compile_commands.json' },
    filetypes = { 'c'},
 }
vim.lsp.enable('/home/rhom/.config/nvim/clangd')
--
-- vim.lsp.with()
--
-- vim.lsp.config["pylsp"] = {
--   cmd = { 'pylsp' },
--   filetypes = { 'python' },
--   root_markers = {
--     'pyproject.toml',
--     'setup.py',
--     'setup.cfg',
--     'requirements.txt',
--     'Pipfile',
--     '.git',
--   },
-- }
--
-- vim.lsp.enable('pylsp')


-- local actions = require('telescope.actions')

--
-- require('telescope').setup({
--   defaults = {
--     file_ignore_patterns = {
--           '^node_modules/', -- Ignore node_modules directory
--           '%.log',         -- Ignore files ending with .log
--           'build/',        -- Ignore build directory
-- 	   '.git/',
--           '.cache/',
--         },
--     mappings = {
--       i = {
--         ["<C-_>"] = actions.move_selection_previous, -- make Ctrl-/ act like Ctrl-p
--         ["<C-p>"] = false,                            -- disable original Ctrl-p
--         ["?"] = false,                                -- stop Telescope help from opening on Ctrl-/
--         ["<F2>"] = actions.which_key
--       },
--       n = {
--         ["<C-_>"] = actions.move_selection_previous,  -- optional: same in normal mode of picker
--         ["<F2>"] = actions.which_key
--       },
--     },
--   },
-- })
--
