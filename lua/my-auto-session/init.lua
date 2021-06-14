require('auto-session').setup {
    log_level = 'info',
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath('data').."/auto-sessions/",
    auto_session_enabled = false,
    auto_save_enabled = true,
    auto_restore_enabled = false,
    auto_session_suppress_dirs = {"/Users/alice", "/Users/alice/Desktop"},
    auto_session_pre_save_cmds = {{"NvimTreeClose"}}
}


require('session-lens').setup {
    prompt_title = 'YEAH SESSIONS',
    shorten_path = true,
    theme_conf = { border = false },
    previewer = true
}
