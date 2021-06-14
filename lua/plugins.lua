local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " ..
                install_path)
    execute "packadd packer.nvim"
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

packer.init {
  -- compile_path = vim.fn.stdpath('data')..'/site/pack/loader/start/packer.nvim/plugin/packer_compiled.vim',
  git = {
    clone_timeout = 300
  },
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"

    -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
    use {"neovim/nvim-lspconfig"}
    use {"glepnir/lspsaga.nvim", event = "BufRead"}
    use {"kabouzeid/nvim-lspinstall"}
    -- Telescope
    use {"nvim-lua/popup.nvim"}
    use {"nvim-lua/plenary.nvim"}
    use {"tjdevries/astronauta.nvim"}
    use {
        "nvim-telescope/telescope.nvim",
        config = [[require('lv-telescope')]],
        cmd = "Telescope"
    }
    -- Autocomplete
    use {
        "hrsh7th/nvim-compe",
        config = function()
            require("lv-compe").config()
        end
    }

    use {"hrsh7th/vim-vsnip", event = "InsertEnter"}
    use {"rafamadriz/friendly-snippets", event = "InsertEnter"}

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    use {
        "kyazdani42/nvim-tree.lua",
        -- cmd = "NvimTreeToggle",
        config = function()
            require("lv-nvimtree").config()
        end
    }

    use {
        "lewis6991/gitsigns.nvim",

        config = function()
            require("lv-gitsigns").config()
        end,
        event = "BufRead"
    }
    -- whichkey
    use {"folke/which-key.nvim"}

    -- Autopairs
    use {"windwp/nvim-autopairs",
        config = function() require'lv-autopairs' end
    }

    -- Comments
    use {
        "terrortylor/nvim-comment",
        cmd = "CommentToggle",
        config = function()
            require('nvim_comment').setup()
        end
    }

    -- Color
    use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}

    -- Icons
    use {"kyazdani42/nvim-web-devicons"}

    -- Status Line and Bufferline
    use {"glepnir/galaxyline.nvim"}

    -- use {
    --     "romgrk/barbar.nvim",

    --     config = function()
    --         vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>',
    --                                 {noremap = true, silent = true})
    --         vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>',
    --                                 {noremap = true, silent = true})
    --         vim.api.nvim_set_keymap('n', '<S-x>', ':BufferClose<CR>',
    --                                 {noremap = true, silent = true})
    --     end,
    --     event = "BufRead"

    -- }

    -- Extras, these do not load by default

    -- Better motions
    use {
        'phaazon/hop.nvim',
        event = 'BufRead',
        config = function()
            require('lv-hop').config()
        end,
        disable = not O.plugin.hop.active,
        opt = true
    }
    -- Enhanced increment/decrement
    use {
        'monaqa/dial.nvim',
        event = 'BufRead',
        config = function()
            require('lv-dial').config()
        end,
        disable = not O.plugin.dial.active,
        opt = true
    }
    -- Dashboard
    use {
        "ChristianChiarulli/dashboard-nvim",
        event = 'BufWinEnter',
        cmd = {"Dashboard", "DashboardNewFile", "DashboardJumpMarks"},
        config = function()
            require('lv-dashboard').config()
        end,
        disable = not O.plugin.dashboard.active,
        opt = true
    }
    -- Zen Mode
    use {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        -- event = "BufRead",
        config = function()
            require('lv-zen').config()
        end,
        disable = not O.plugin.zen.active
    }
    -- Ranger
    use {
        "kevinhwang91/rnvimr",
        cmd = "Rnvimr",
        config = function()
            require('lv-rnvimr').config()
        end,
        disable = not O.plugin.ranger.active
    }

    -- matchup
    use {
        'andymass/vim-matchup',
        event = "CursorMoved",
        config = function()
            require('lv-matchup').config()
        end,
        disable = not O.plugin.matchup.active
    }

    use {
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = function()
            require("colorizer").setup()
            vim.cmd("ColorizerReloadAllBuffers")
        end,
        disable = not O.plugin.colorizer.active
    }

    use {
        "nacro90/numb.nvim",
        event = "BufRead",
        config = function()
            require('numb').setup {
                show_numbers = true, -- Enable 'number' for the window while peeking
                show_cursorline = true -- Enable 'cursorline' for the window while peeking
            }
        end,
        disable = not O.plugin.numb.active
    }

    -- Treesitter playground
    use {
        'nvim-treesitter/playground',
        event = "BufRead",
        disable = not O.plugin.ts_playground.active
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        branch = "lua",
        event = "BufRead",
        setup = function()

            vim.g.indentLine_enabled = 1
            vim.g.indent_blankline_char = "▏"

            vim.g.indent_blankline_filetype_exclude =
                {"help", "terminal", "dashboard"}
            vim.g.indent_blankline_buftype_exclude = {"terminal"}

            vim.g.indent_blankline_show_trailing_blankline_indent = false
            vim.g.indent_blankline_show_first_indent_level = true
        end,
        disable = not O.plugin.indent_line.active
    }

    -- comments in context
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        event = "BufRead",
        disable = not O.plugin.ts_context_commentstring.active
    }

    -- Symbol Outline
    use {
        'simrat39/symbols-outline.nvim',
        cmd = 'SymbolsOutline',
        disable = not O.plugin.symbol_outline.active
    }
    -- diagnostics
    use {
        "folke/trouble.nvim",
        cmd = 'TroubleToggle',
        disable = not O.plugin.trouble.active
    }
    -- Debugging
    use {
        "mfussenegger/nvim-dap",
        event = "BufRead",
        disable = not O.plugin.debug.active
    }
    -- Better quickfix
    use {
        "kevinhwang91/nvim-bqf",
        event = "BufRead",
        disable = not O.plugin.bqf.active
    }
    -- Floating terminal
    use {
        'numToStr/FTerm.nvim',
        event = "BufRead",
        config = function()
            require'FTerm'.setup({
                     cmd = "cd ~;  tmux new-session -A -s floating",
                     dimensions  = {
                     height = 0.4,
                     width = 0.56,
                     x = 1.3,
                     y = -0.00
                 },
                 border = 'single' -- or 'double'
            })
        end,
        disable = not O.plugin.floatterm.active
    }

    -- Search & Replace
    use {
        'windwp/nvim-spectre',
        event = "BufRead",
        config = function()
            require('spectre').setup()
        end,
        disable = not O.plugin.spectre.active
    }
    -- TODO setup nvim to always cd to Desktop but tcd to the active window project
    -- lsp root with this nvim-tree will follow you
    use {
        "ahmedkhalf/lsp-rooter.nvim",
        event = "BufRead",
        config = function()
            require("lsp-rooter").setup()
        end,
        disable = not O.plugin.lsp_rooter.active
    }
    -- Markdown preview
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && npm install',
        ft = 'markdown',
        disable = not O.plugin.markdown_preview.active
    }
    -- Interactive scratchpad
    use {
        'metakirby5/codi.vim',
        cmd = 'Codi',
        disable = not O.plugin.codi.active
    }
    -- Use fzy for telescope
    use {
        "nvim-telescope/telescope-fzy-native.nvim",
        event = "BufRead",
        disable = not O.plugin.telescope_fzy.active
    }
    -- Use project for telescope
    use {
        "nvim-telescope/telescope-project.nvim",
        event = "BufRead",
        after = "telescope.nvim",
        disable = not O.plugin.telescope_project.active
    }
    -- Sane gx for netrw_gx bug
    use {
        "felipec/vim-sanegx",
        event = "BufRead",
        disable = not O.plugin.sanegx.active
    }
    -- Sane gx for netrw_gx bug
    use {
        "folke/todo-comments.nvim",
        event = "BufRead",
        disable = not O.plugin.todo_comments.active
    }
    -- LSP Colors
    use {
        "folke/lsp-colors.nvim",
        event = "BufRead",
        disable = not O.plugin.lsp_colors.active
    }
    -- Git Blame
    use {
        "f-person/git-blame.nvim",
        event = "BufRead",
        disable = not O.plugin.git_blame.active
    }
    use {
        'ruifm/gitlinker.nvim',
        event = "BufRead",
        config = function()
            require"gitlinker".setup({
                opts = {
                    -- remote = 'github', -- force the use of a specific remote
                    -- adds current line nr in the url for normal mode
                    add_current_line_on_normal_mode = true,
                    -- callback for what to do with the url
                    action_callback = require"gitlinker.actions".open_in_browser,
                    -- print the url after performing the action
                    print_url = false,
                    -- mapping to call url generation
                    mappings = "<leader>gy"
                }
            })

        end,
        disable = not O.plugin.gitlinker.active,
        requires = 'nvim-lua/plenary.nvim'

    }
    -- Lazygit
    use {
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit",
        disable = not O.plugin.lazygit.active
    }
    -- Lazygit
    use {
        "pwntester/octo.nvim",
        event = "BufRead",
        disable = not O.plugin.octo.active
    }
    -- Diffview
    use {
        "sindrets/diffview.nvim",
        event = "BufRead",
        disable = not O.plugin.diffview.active
    }
    -- Easily Create Gists
    use {
        "mattn/vim-gist",
        event = "BufRead",
        disable = not O.plugin.gist.active,
        requires = 'mattn/webapi-vim'
    }
    -- Lush Create Color Schemes
    use {
        "rktjmp/lush.nvim",
        cmd = {"LushRunQuickstart", "LushRunTutorial", "Lushify"},
        disable = not O.plugin.lush.active,
    }
    -- HTML preview
    use {
        'turbio/bracey.vim',
        event = "BufRead",
        run = 'npm install --prefix server',
        disable = not O.plugin.bracey.active
    }
    -- Debugger management
    use {
        'Pocco81/DAPInstall.nvim',
        event = "BufRead",
        disable = not O.plugin.dap_install.active
    }

    -- LANGUAGE SPECIFIC GOES HERE

    -- Latex TODO what filetypes should this be active for?
    use {"lervag/vimtex", ft = "latex", disable = not O.lang.latex.active}

    -- Rust tools
    -- TODO: use lazy loading maybe?
    use {"simrat39/rust-tools.nvim", disable = not O.lang.rust.active}

    -- Elixir
    use {"elixir-editors/vim-elixir",
        ft = {"elixir", "eelixir"},
        disable = not O.lang.elixir.active
    }

-------------------------------------------------------------------------------
    --  Personalization Begins Here


    -- Learning and Reference -------------------------------------------------

    -- INFO: Learning Lua central collections of resources
    -- https://github.com/nanotee/nvim-lua-guide
    -- https://github.com/norcalli/neovim-plugin

    -- https://github.com/rafcamlet/nvim-luapad
    use { 'rafcamlet/nvim-luapad', opt = false }
 -- require_plugin('nvim-luapad')

    -- Learn Vim Motions
    -- https://github.com/ThePrimeagen/vim-be-good
    use 'ThePrimeagen/vim-be-good'

    -- Luarocks
    -- https://github.com/lunarmodules/Penlight
    --use_rocks 'penlight'
    --use_rocks 'luaformatter'

    use { 'sudormrfbin/cheatsheet.nvim',
        opt = true,
        requires = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
        }
    }


    -- prose tools ------------------------------------------------------------
    -- until I decide on one, I'll be enabenabling one markdown plugin at a time

    -- use { 'vimwiki/vimwiki', opt = true }
    -- require_plugin('vim-wiki')

    use 'preservim/vim-lexical'

    use 'plasticboy/vim-markdown'
    use 'reedes/vim-pencil'

    use 'preservim/vim-wordy'

    -- https://github.com/junegunn/limelight.vim
    use { 'junegunn/limelight.vim', opt = true }


    -- Table Editors and Alignment Helpers ------------------------------------

    -- https://github.com/godlygeek/tabular
    use { 'godlygeek/tabular', opt = true }

    -- https://github.com/junegunn/vim-easy-align
    use 'junegunn/vim-easy-align'

    -- Vim Table Mode
    -- https://github.com/dhruvasagar/vim-table-mode
    use { 'dhruvasagar/vim-table-mode', opt = true }
    -- configured in alice-viml/options.vim
    -- There are so many options, OMG, it does formula too
    -- :TableModeToggle
    -- <Leader>ttm starts table mode
    -- <Leader>ttt Tableize!


    -- User Experience and Interface Upgrades ---------------------------------
    -- I'll want this when I'm working on a team
    -- use {'f-person/git-blame.nvim', opt = true}

    -- Reload
    use 'famiu/nvim-reload'

    -- Trigger with <leader>u or :OpenURL
    use  'henrik/vim-open-url'

    -- CtrlSpace
    -- let's see if I can config it in lua, and maybe move vimwiki over
    -- configured in alice-ctrlspace/init.lua
    use 'vim-ctrlspace/vim-ctrlspace'

    -- List Buffers per Tab
    use 'Shougo/tabpagebuffer.vim'

    -- Telescope Plugins
    use 'nvim-telescope/telescope-fzf-writer.nvim'
    use 'nvim-telescope/telescope-dap.nvim'
    use "nvim-telescope/telescope-frecency.nvim"

    -- Mundo (undo tree with diffs)
    -- https://github.com/simnalamburt/vim-mundo
    -- use { 'simnalamburt/vim-mundo', opt = true }

    -- -- both session plugins configured in alice-auto-session/init.lua
    -- -- https://github.com/rmagatti/auto-session
    -- use { 'rmagatti/auto-session', opt = false }
    -- use {
    --         'rmagatti/session-lens',
    --           requires = {
    --             'rmagatti/auto-session',
    --             'nvim-telescope/telescope.nvim'
    --         }
    --     }

    -- tmux navigation uses:
    -- tmux binds: https://github.com/jabirali/tmux-tilish#keybindings
    -- nvim binds:
    use { 'numToStr/Navigator.nvim', opt = false,
        config = function()
            require('Navigator').setup({
                auto_save = false,
                disable_on_zoom = true,
            })
        end
    }


    -- programming assistance -------------------------------------------------

    -- These look interesting
    --
    -- https://github.com/tpope/vim-sleuth
    --
    -- use {"windwp/nvim-ts-autotag", opt = true} --- where is this from
    --
    -- show function signatures from lsp
    -- https://github.com/ray-x/lsp_signature.nvim
    -- not sure if lspsaga is handling this
    -- use {'ray-x/lsp_signature.nvim', opt = true}

    -- EditorConfig
    use 'editorconfig/editorconfig-vim'

    -- CHECK remove these and stick with nvim autopair if compe quits acting up
    -- autopairs and closing
    --use '9mm/vim-closer':\n
    use 'tpope/vim-endwise'

    -- https://github.com/rktjmp/fwatch.nvim
    use 'rktjmp/fwatch.nvim'

    -- https://github.com/tpope/vim-dispatch
    use { 'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

    --  https://github.com/thinca/vim-quickrun
    use 'thinca/vim-quickrun'

    -- Lsp statusline functions
    -- https://github.com/nvim-lua/lsp-status.nvim
    -- use 'nvim-lua/lsp-status.nvim'

    -- Rainbow parentheses
    use 'p00f/nvim-ts-rainbow'


    -- git ------------------ -------------------------------------------------

    -- Tig Explorer
    -- https://github.com/iberianpig/tig-explorer.vim
    use { 'iberianpig/tig-explorer.vim', opt = true }
 -- require_plugin('tig-explorer.vim')

    -- Gina
    -- https://github.com/lambdalisue/gina.vim
    use { 'lambdalisue/gina.vim', opt = true }
 -- require_plugin('gina.vim')

    -- Neogit
    -- https://github.com/TimUntersberger/neogit
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
 -- require_plugin('neogit')


    -- Code Analyzers ---------------------------------------------------------

    -- LSP and Ctags Viewer - https://github.com/liuchengxu/vista.vim
    use 'liuchengxu/vista.vim'
    use 'preservim/tagbar'

    -- Gutentags - https://github.com/ludovicchabant/vim-gutentags
    use { 'ludovicchabant/vim-gutentags', opt = false }
    use { 'skywind3000/gutentags_plus', opt = false }
    -- FIXME figure out the new require syntax
 -- require_plugin('vim-gutentags')
 -- require_plugin('gutentags_plus')


    -- Language Specific ------------------------------------------------------

    -- Fish

    -- I'm not as pleased with vim-fish as I want to be
    -- maybe this is better
    -- https://github.com/khaveesh/vim-fish-syntax
    -- use 'khaveesh/vim-fish-syntax'
    use { 'dag/vim-fish', opt = false }
 -- require_plugin('vim-fish')

    -- Lua

    use { 'euclidianAce/BetterLua.vim', opt = false }
 -- require_plugin('BetterLua.vim')

    -- Typescript/Javascript

    -- syntax hl in tagged templates
    -- https://github.com/Quramy/vim-js-pretty-template
    use 'Quramy/vim-js-pretty-template'
    -- activated by setting filetype on parent file load with
    -- ```
    -- " Register tag name associated the filetype
    -- call jspretmpl#register_tag('gql', 'graphql')
    --
    -- autocmd FileType javascript JsPreTmpl
    -- autocmd FileType javascript.jsx JsPreTmpl
    -- ````




    -- The Pretty Things ------------------------------------------------------

    -- configured in alice-tokyonight/init.lua
    use 'folke/tokyonight.nvim'

    -- Made with Lush
    use 'olimorris/onedark.nvim'

    -- Transparent Themes
    use 'jeffkreeftmeijer/vim-dim'

    -- Light Backgrounds

    -- colorscheme PaperColor
    use { 'NLKNguyen/papercolor-theme', opt = true }

    -- colorscheme pencil
    use 'preservim/vim-colors-pencil'

    -- Emmigrated from previous config

    use 'Rigellute/rigel'
    use 'sliminality/wild-cherry-vim'

    use 'jaredgorski/SpaceCamp'
    use 'aswathkk/DarkScene.vim'
    use 'challenger-deep-theme/vim'
    use { 'kaicataldo/material.vim', opt = true }
    -- , { 'branch': 'main' }

    -- use 'zeis/vim-kolor'
    use { 'tssm/fairyfloss.vim', opt = true }
    use 'TroyFletcher/vim-colors-synthwave'
    use { 'jonathanfilip/vim-lucius', opt = true }
    use { 'swalladge/paper.vim', opt = true }
    use 'liuchengxu/space-vim-dark'
    use 'jayhowie/crystal-cove'

    use 'rakr/vim-one'
    use { 'joshdick/onedark.vim', opt = true }
    use { 'KeitaNakamura/neodark.vim', opt = true }

    -- 16 Color / Esoteric
    use 'romainl/vim-colors'
    use 'romainl/vim-sweet16'
    -- https://github.com/srcery-colors/srcery-vim
    use 'srcery-colors/srcery-vim'

    -- Looks Cool
    use { 'ishan9299/modus-theme-vim', opt = true }
    use 'romgrk/doom-one.vim'
    use { 'Th3Whit3Wolf/spacebuddy', opt = true }

    -- https://github.com/arzg/vim-colors-xcode
    use 'arzg/vim-colors-xcode'

    -- Theme Development
    use 'lifepillar/vim-colortemplate'
    use 'tjdevries/colorbuddy.vim'
    -- local Color, colors, Group, groups, styles = require('colorbuddy').setup()

    -- -- Use Color.new(<name>, <#rrggbb>) to create new colors
    -- -- They can be accessed through colors.<name>
    -- Color.new('background',  '#282c34')
    -- Color.new('red',         '#cc6666')
    -- Color.new('green',       '#99cc99')
    -- Color.new('yellow',      '#f0c674')
    --
    -- -- Define highlights in terms of `colors` and `groups`
    -- Group.new('Function'        , colors.yellow      , colors.background , styles.bold)
    -- Group.new('luaFunctionCall' , groups.Function    , groups.Function   , groups.Function)
    --
    -- -- Define highlights in relative terms of other colors
    -- Group.new('Error'           , colors.red:light() , nil               , s.bold)

end)


-- I am currently tempted, butI will read the docs on the lsp-rooter first
-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
-- "automatically `tcd` to project directories when opening a file
-- Plug 'airblade/vim-rooter'
-- " The public function FindRootDirectory() returns the absolute path to the root directory as a string, if a root directory is found, or an empty string otherwise.
--
-- " change directory for the whole tab
-- let g:rooter_cd_cmd = 'tcd'
--
-- " what triggers a scan
-- let g:rooter_targets = '/,*'
-- " let g:rooter_targets = '*'
-- " let g:rooter_targets = '/,*.yml,*.yaml'
--
-- " how to identify a root directory
-- let g:rooter_patterns = [
--       \ '.git',
--       \ '>~/work',
--       \ '>.config',
--       \ '>~/.homesick/repos/',
--       \ '=/home/alice',
--       \ ]
--
-- " follow file and directory links
-- let g:rooter_resolve_links = 1
--
-- " if blank, will not change directory (can be home or current
-- let g:rooter_change_directory_for_non_project_files = ''
--
-- " manual mode
-- let g:rooter_manual_only = 1
--
-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
