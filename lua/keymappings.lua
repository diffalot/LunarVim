-- nvim-compe key map
vim.cmd('inoremap <silent><expr> <C-Space> compe#complete()')
vim.cmd("inoremap <silent><expr> <CR>      compe#confirm('<CR>')")
vim.cmd("inoremap <silent><expr> <C-e>     compe#close('<C-e>')")
vim.cmd("inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })")
vim.cmd("inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })")

-- I haven't seen any issues with this
--
---- TODO fix this
---- Terminal window navigation
--vim.cmd([[
--  tnoremap <C-h> <C-\><C-N><C-w>h
--  tnoremap <C-j> <C-\><C-N><C-w>j
--  tnoremap <C-k> <C-\><C-N><C-w>k
--  tnoremap <C-l> <C-\><C-N><C-w>l
--  inoremap <C-h> <C-\><C-N><C-w>h
--  inoremap <C-j> <C-\><C-N><C-w>j
--  inoremap <C-k> <C-\><C-N><C-w>k
--  inoremap <C-l> <C-\><C-N><C-w>l
--  tnoremap <Esc> <C-\><C-n>
--]])

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

vim.cmd('vnoremap p "0p')
vim.cmd('vnoremap P "0P')

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- I hate escape
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Toggle the QuickFix window
vim.api.nvim_set_keymap('', '<C-q>', ':call QuickFixToggle()<CR>', {noremap = true, silent = true})

-- close buffer INFO: found a menu item to close a buffer in CtrlSpace
--vim.api.nvim_set_keymap("n", "<leader>c", ":bdelete<CR>",  {noremap = trtue, silent = true})

-- Move between Tabs with Ctrl + Alt and the left and right arrows
vim.api.nvim_set_keymap('n', '<C-A-Right>', ':tabnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-A-Left>',  ':tabprevious<CR>', {noremap = true, silent = true})
-- Cycle Buffers with Ctrl + Alt and the Up and Down Arrows
vim.api.nvim_set_keymap('n', '<C-A-Up>',   ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-A-Down>', ':bprevious<CR>', {noremap = true, silent = true})


-- TODO: Check on this after a restart, it may not be broken, it may have just
-- changed since it was startd
-- TODO: find out what the lua equivalent to sourcing a file is
-- FIXME: Is currently only working to move to and from tmux to nvim and within tmux
-- I will check plugin configs.
-- _move between windows with alt and home row_, also moves throuh tmux windows,
-- I'm not sure how, but I suspect rutning on easy-mode in the tmux and vim
-- matched set of plugins also turned on these alt bindings with the arrow keys
-- so now ctrl + arrows is for cycling through buffers and tabs, and alt and
-- arrows is navigation.
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', {silent = true})
-- pre restart: alt + homerow moves across tmux panels, even back, but not
-- between vim windows? probably needs restart for setting to take effect.

-- CHECK: not working pre reboot
-- I wouldn't mind replacing these... or even better: since ctrl + A + arro
-- move through buffers and tabs, what if these did too?
-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})
-- pre restart: C+h an C+l move to and from tmux but nowhere else

-- C-Shift arrows to resize windows (cannot be mapped to just C-A arrows because
-- mak uses those for switdhing desktops and the zoomed way out fiew of all the
-- desktops.
vim.api.nvim_set_keymap('n', '<C-S-Up>', ':resize +2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-S-Down>', ':resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-S-Left>', ':vertical resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-S-Right>', ':vertical resize +2<CR>', {silent = true})
--
-- move between windows with arrows
-- vim.api.nvim_set_keymap('n', '<C-Up>',    '<C-w>h', {silent = true})
-- vim.api.nvim_set_keymap('n', '<C-Down>',  '<C-w>j', {silent = true})
-- vim.api.nvim_set_keymap('n', '<C-Left>',  '<C-w>k', {silent = true})
-- vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', {silent = true})
-- vim.api.nvim_set_keymap('v', 'p', '"0p', {silent = true})
-- vim.api.nvim_set_keymap('v', 'P', '"0P', {silent = true})

-- vim.cmd('inoremap <expr> <TAB> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <S-TAB> (\"\\<C-p>\")')

-- vim.api.nvim_set_keymap('i', '<C-TAB>', 'compe#complete()', {noremap = true, silent = true, expr = true})

-- vim.cmd([[
-- map p <Plug>(miniyank-autoput)
-- map P <Plug>(miniyank-autoPut)
-- map <leader>n <Plug>(miniyank-cycle)
-- map <leader>N <Plug>(miniyank-cycleback)
-- ]])
