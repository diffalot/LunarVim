-------------------------------------------------------------------------------`
-- <C-Space> https://github.com/vim-ctrlspace/vim-ctrlspace
--  outdate docs, but very helpful:
--  https://atlas-vim.readthedocs.io/vim/plugged/vim-ctrlspace/README/#status-line

-- vim.g.CtrlSpaceStatuslineFunction = "ctrlspace#api#Statusline()"

vim.g.CtrlSpaceDefaultMappingKey        = "<C-space> "
vim.g.CtrlSpaceLoadLastWorkspaceOnStart = 0
vim.g.CtrlSpaceSaveWorkspaceOnSwitch    = 1
vim.g.CtrlSpaceSaveWorkspaceOnExit      = 1
vim.g.CtrlSpaceUseArrowsInTerm          = 1
vim.g.CtrlSpaceSortHelp                 = 1
vim.g.CtrlSpaceProjectRootMarkers       = {
    ".diffalot",
    ".git",
    ".hg",
    ".svn",
    ".bzr",
    "_darcs",
    "CVS"
}

vim.g.CtrlSpaceGlobCommand = 'rg --color=never --hidden --glob "!.git" --glob "!node_modules" --files'

-- if executable('rg')
-- elseif executable('fd')
--   let g:CtrlSpaceGlobCommand = 'fd --type=file --color=never'
-- elseif executable('ag')
--   let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
-- endif
