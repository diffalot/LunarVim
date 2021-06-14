vim.cmd('set shell=zsh')
require('default-config')
vim.cmd('luafile ' .. CONFIG_PATH .. '/lv-config.lua')
require('settings')
require('plugins')
require('colorscheme')
require('lv-utils')
require('keymappings')
require('lv-galaxyline')
require('lv-nvimtree') -- This plugin must be required somewhere before colorscheme.  Placing it after will break navigation keymappings
require('lv-treesitter')
require('lv-which-key')
require('lsp')
if O.lang.emmet.active then require('lsp.emmet-ls') end

-- personal configs without major load order requirements
require('my-ctrlspace')
require('alice.viml')

-- setup last so status line can be added to in other configs
require('alice.overdriver') -- Theme Overrides (requires globals)
require('alice.infolines') -- begin statusline setup so plugins can add to it
vim.cmd('source '..CONFIG_PATH..'/lua/alice/infolines/status-end.vim')
