local gl = require('galaxyline')
-- get my theme in galaxyline repo
-- local colors = require('galaxyline.theme').default
local colors = {
    none = 'none',
    black = '#2E2E2E',
    white = '#f8f3f6',
    dark_grey = '#404048',
    yellow = '#DCDCAA',
    dark_yellow = '#D7BA7D',
    cyan = '#4EC9B0',
    green = '#608B4E',
    light_green = '#B5CEA8',
    string_orange = '#CE9178',
    orange = '#FF8800',
    purple = '#C586C0',
    magenta = '#D16D9E',
    grey = '#858585',
    blue = '#569CD6',
    vivid_blue = '#4FC1FF',
    light_blue = '#9CDCFE',
    red = '#D16969',
    error_red = '#F44747',
    info_yellow = '#FFCC66'
}

-- galaxyline themes for Gruvbox and NVCode.
-- Uncomment and change 'colors_colorschemeName'
-- to 'colors' to enable.

-- Colors for Gruvbox
-- local colors_gruvbox = {
--     bg = '#32302F',
--     yellow = '#FABD2F',
--     dark_yellow = '#D79921',
--     cyan = '#689D6A',
--     green = '#608B4E',
--     light_green = '#B8BB26',
--     string_orange = '#D65D0E',
--     orange = '#FE8019',
--     purple = '#B16286',
--     magenta = '#D3869B',
--     grey = '#A89984',
--     blue = '#458588',
--     -- vivid_blue = '#4FC1FF',
--     light_blue = '#83A598',
--     red = '#FB4834',
--     error_red = '#CC241D',
--     info_yellow = '#D79921'
-- }
-- colors for NVCode theme (very minimal changes)
-- local colors_nvcode = {
--     bg = '#2E2E2E',
--     yellow = '#DCDCAA',
--     dark_yellow = '#D7BA7D',
--     cyan = '#4EC9B0',
--     green = '#608B4E',
--     light_green = '#B5CEA8',
--     string_orange = '#CE9178',
--     orange = '#FF8800',
--     purple = '#C586C0',
--     magenta = '#D16D9E',
--     grey = '#729CB3',
--     blue = '#569CD6',
--     vivid_blue = '#4FC1FF',
--     light_blue = '#9CDCFE',
--     red = '#D16969',
--     error_red = '#F44747',
--     info_yellow = '#FFCC66'
-- }

local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

table.insert(gls.left, {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local mode_color = {
                n = colors.blue,
                i = colors.green,
                v = colors.purple,
                [''] = colors.purple,
                V = colors.purple,
                c = colors.magenta,
                no = colors.blue,
                s = colors.orange,
                S = colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.red,
                Rv = colors.red,
                cv = colors.blue,
                ce = colors.blue,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.blue,
                t = colors.blue
            }
            vim.api.nvim_command('hi BufferTypeSeparator guibg=' .. mode_color[vim.fn.mode()])
            vim.api.nvim_command('hi GalaxyBufferType gui=reverse guifg=' .. mode_color[vim.fn.mode()])
            return '▊ '
            --return ' '
        end,
        highlight = {colors.red, colors.bg}
    }
})
print(vim.fn.getbufvar(0, 'ts'))
vim.fn.getbufvar(0, 'ts')

table.insert(gls.left, {
    GitIcon = {
        provider = function()
            return ' '
        end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.grey},
        highlight = {colors.orange, colors.grey}
    }
})

table.insert(gls.left, {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.grey},
        highlight = {colors.cyan, colors.grey}
    }
})

table.insert(gls.left, {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.green, colors.grey}
    }
})

table.insert(gls.left, {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = ' 柳',
        highlight = {colors.blue, colors.grey}
    }
})

table.insert(gls.left, {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.red, colors.grey}
    }
})

table.insert(gls.right, {
    DiagnosticError = {provider = 'DiagnosticError', icon = '  ', highlight = {colors.error_red, colors.grey}}
})
table.insert(gls.right, {DiagnosticWarn = {provider = 'DiagnosticWarn', icon = '  ', highlight = {colors.orange, colors.grey}}})

table.insert(gls.right, {
    DiagnosticHint = {provider = 'DiagnosticHint', icon = '  ', highlight = {colors.vivid_blue, colors.grey}}
})

table.insert(gls.right, {DiagnosticInfo = {provider = 'DiagnosticInfo', icon = '  ', highlight = {colors.info_yellow, colors.grey}}})

table.insert(gls.right, {
    TreesitterIcon = {
        provider = function()
            if next(vim.treesitter.highlighter.active) ~= nil then return ' ' end
            return ''
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.grey},
        highlight = {colors.green, colors.grey}
    }
})

table.insert(gls.right, {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function()
            local tbl = {['dashboard'] = true, [' '] = true}
            if tbl[vim.bo.filetype] then return false end
            return true
        end,
        icon = '  ',
        highlight = {colors.black, colors.grey}
    }
})

table.insert(gls.right, {
    LineInfo = {
        provider = 'LineColumn',
        separator = '  ',
        separator_highlight = {'NONE', colors.grey},
        highlight = {colors.black, colors.grey}
    }
})

-- table.insert(gls.right, {
--     PerCent = {
--         provider = 'LinePercent',
--         separator = ' ',
--         separator_highlight = {'NONE', colors.grey},
--         highlight = {colors.black, colors.grey}
--     }
-- })
-- 
-- table.insert(gls.right, {
--     Tabstop = {
--         provider = function()
--             return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
--         end,
--         condition = condition.hide_in_width,
--         separator = ' ',
--         separator_highlight = {'NONE', colors.grey},
--         highlight = {colors.black, colors.grey}
--     }
-- })
-- 
-- table.insert(gls.right, {
--     BufferType = {
--         provider = 'FileTypeName',
--         condition = condition.hide_in_width,
--         separator = ' ',
--         separator_highlight = {'NONE', colors.grey},
--         highlight = {colors.black, colors.grey}
--     }
-- })
-- 
-- table.insert(gls.right, {
--     FileEncode = {
--         provider = 'FileEncode',
--         condition = condition.hide_in_width,
--         separator = ' ',
--         separator_highlight = {'NONE', colors.grey},
--         highlight = {colors.black, colors.grey}
--     }
-- })
-- 
table.insert(gls.right, {
    Space = {
        provider = function()
            return ' '
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.none},
        highlight = {colors.orange, colors.none}
    }
})

table.insert(gls.short_line_left, {
    BufferType = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = {'NONE', colors.grey},
        highlight = {colors.black, colors.grey}
    }
})

table.insert(gls.short_line_right, {
    BufferIcon = {provider = 'BufferIcon', condition = condition.buffer_not_empty, highlight = {colors.black, colors.grey}}
})

table.insert(gls.short_line_left, {
    FilePath = {provider = 'FilePath', condition = condition.buffer_not_empty, highlight = {colors.black, colors.grey}}
})

table.insert(gls.short_line_left, {
    SFileName = {provider = 'SFileName', condition = condition.buffer_not_empty, highlight = {colors.black, colors.grey}}
})
