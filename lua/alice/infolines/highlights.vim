" #12062f #12083e #10ff84 #23512c
" #cf1330 #63746e #323e71 #33c3c3
" #77e55f #c8cff5 #cf1330 #5c1c80
" #e4b37c #ff0883
" #323e71 #67b645 #e4e4e4 #56f04a
" #5c1c80 #dd8308 #e4e4e4 #66f3f3
" #33c3c3 #8308ff #e4e4e4 #ff2c20
" #6f78a8 #069a93
" #405878
" #cf1330 #c5aedc #12083e
" #77e55f #0f080e #b8b8b8 #e7f9f8 #069a93
" #e4b37c #1d2753 #a0a0a0
" #323e71 #171a29 #b0b0b0
" #5c1c80 #060405 #b0b0b0 #069a93
" #33c3c3 #e7f9f8 #1eff8e
" #eff5ea #c0c0c0 #343b79 #e7f9f8 #ff0883
" #8b2992 #b8b8b8 #2c3053 #1d2753 #fd9308
" #10ff84 #171a29 #171a29
" #efefaa #e7f9f8 #069a93
" #64f7cf #0f080e #060405
" #ef73ee #171a29 #060405
" #64f7cf #4a4c63
" #eff5ea
" #12062f
" #101520
" #0c0419 #0f080e #101520 #0c0419 #252f3c #00a6b2 #30343b

function Infolines(root_color, is_mode_activated)
    call InfolinesClear()
    call SchemesGitSignsDark()
    call InfolinesMenuHighlights()
    let g:il_d0='#0c0419' "#0f080e #101520 #0c0419 #252f3c #00a6b2 #30343b


    hi StatusLine                                     guibg=#0f080e guifg=#b8b8b8
    hi StatusLineNC                                   guibg=none    guifg=none
    hi User1                          gui=italic      guibg=#171a29 guifg=#b0b0b0
    hi User2                          gui=bold,italic guibg=#060405 guifg=#b0b0b0

    hi TabLineSel   cterm=bold,italic gui=bold,italic guifg=#c0c0c0 guibg=#343b79
    hi TabLine      cterm=bold        gui=italic      guifg=#b8b8b8 guibg=#2c3053
    hi TabLineFill  cterm=none        gui=none        guifg=#171a29 guibg=#171a29

    hi SignColumn                                     guifg=#0f080e guibg=#060405
    hi VertSplit    cterm=none        gui=none        guifg=#171a29 guifg=#060405
    hi ColorColumn  ctermfg=6 ctermbg=5                             guibg=#4a4c63

endfunction

"    lower                                                 DS  Lumina
"    ifl_panel_bg       ifl_sign_col     ifl_virts_fg  a # 06   2.35%   #060405   
"    ifl_virts_bg       ifl_tab_fill     ifl_stats_bg  c # 17   9.02%   #171a29   
"    ifl_panel_na       ifl_stats_na               ??????????? 13.75 ??
" B  ifl_tab_nact                                      d # 2C  17.25%   #2c3053   
" B  ifl_tab_slct                                      e # 34  20.39%   #343b79   
"                                                                          
" B  ifl_colo_col                                      f # 4A  29.01% U     
"                                                                          
" B  ifl_text_low                                      g # B0  69.01%      
"    ifl_text_mid                                      h # B8  72.16%      
"    ifl_text_hih                                      i # C0  75.29%      
"
"    Dark mode goes from lower luminance to higher
"
"    Light mode goes from lower desaturation to higher
"
"
"Tint C (Very Lightly Complimentary)
"
"
"    let l:start_dark = true  " which direction are we starting from (the
"                             " background color)
"    let l:bg_root =          " tint a (colors will spread from bg 35% to
"                             " lightest, perceptually)
"    let l:fg_root =          " tint b perceptually, goes from
"
"    let l:tint_rt =          " derived from seed color given as argument
"                             " 50% lightness, same hue, 100% saturation
"                             " never shown, but used for mixing calculations
"                             " is main influence of active coloration for
"                             " individual active windows and tabs, inactive fall
"                             " into background coloration
"    let l:ting_co =          " compliment tint to root, used for calculations to
"                             " offset test colors from background colors
















" emergency preparedness
let g:a_ntc_drk='#12083e'
let g:a_ntc_mid='#63746e'
let g:a_ntc_lgt='#c8cff5'
let g:a_ntc_err='#ff0883'
let g:a_ntc_yes='#67b645'
let g:a_ntc_wrn='#dd8308'
let g:a_ntc_see='#8308ff'
let g:a_ntc_lrn='#069a93'

function! SchemesGitSignsDark()
hi GitSignsAdd    gui=reverse guibg=#10ff84 guifg=#23512c
hi GitSignsChange gui=none    guibg=#323e71 guifg=#33c3c3
hi GitSignsDelete gui=reverse guibg=#cf1330 guifg=#5c1c80
endfunction

function! SchemesGitSignsLight()
hi GitSignsAdd    gui=none    guibg=#e4e4e4 guifg=#56f04a
hi GitSignsChange gui=none    guibg=#e4e4e4 guifg=#66f3f3
hi GitSignsDelete gui=none    guibg=#e4e4e4 guifg=#ff2c20
endfunction

" don't know if I'll need this clear...
function! InfolinesClear()
    "hi clear Normal
    hi clear StatusLine
    hi clear StatusLineNC
    hi clear User1
    hi clear User2
    hi clear TabLine
    hi clear TabLineFill
    hi clear TabLineSel
    hi clear SignColumn
    hi clear VertSplit
    hi clear ColorColumn
endfunction

function InfolinesMenuHighlights()
    hi Visual            guibg=#c5aedc guifg=#12083e gui=bold
    hi PmenuSel          ctermfg=0B ctermbg=DarkCyan guifg=#e7f9f8 guibg=#069a93 gui=bold cterm=bold
    hi Pmenu             ctermbg=DarkGrey ctermfg=7 guibg=#1d2753 guifg=#a0a0a0 gui=bold cterm=none

    hi PmenuSbar         ctermbg=0D guibg=#069a93 guifg=mintcream gui=bold,italic cterm=bold
    hi PmenuThumb        guibg=#e7f9f8  ctermbg=0E   guifg=#1eff8e ctermfg=0D gui=bold,italic cterm=bold,italic
    hi ErrorMsg          ctermfg=0f ctermbg=1 guifg=#e7f9f8 guibg=#ff0883 gui=bold cterm=bold
    hi Search            ctermfg=black ctermbg=0c guibg=#1d2753 guifg=#fd9308 gui=italic cterm=italic

    hi WildMenu          ctermfg=0e ctermbg=1 guifg=#e7f9f8   guibg=#069a93 gui=bold,italic cterm=bold
endfunction

command! InfolinesDark call InfolinesDark()
function! InfolinesDark()
    call InfolinesClear()
    call SchemesGitSignsDark()
    call InfolinesMenuHighlights()
    " Tint a little more blue than green and not much less red for pearly greys
    " #101520 Almost Black is the screen background, but things can get darker
    let g:il_d0='#0c0419' "#0f080e #101520 #0c0419 #252f3c #00a6b2 #30343b

    hi StatusLine                                     guibg=#0f080e guifg=#b8b8b8
    hi StatusLineNC                                   guibg=none    guifg=none
    hi User1                          gui=italic      guibg=#171a29 guifg=#b0b0b0
    hi User2                          gui=bold,italic guibg=#060405 guifg=#b0b0b0

    hi TabLineSel   cterm=bold,italic gui=bold,italic guifg=#c0c0c0 guibg=#343b79
    hi TabLine      cterm=bold        gui=italic      guifg=#b8b8b8 guibg=#2c3053
    hi TabLineFill  cterm=none        gui=none        guifg= #171a29 guibg=#171a29

    hi SignColumn                                     guifg=#0f080e guibg=#060405
    hi VertSplit    cterm=none        gui=none        guifg=#171a29 guifg=#060405
    hi ColorColumn  ctermfg=6 ctermbg=5                             guibg=#4a4c63
endfunction

function! InfolinesDefaultDark() " Don't just go hacking on this one for fun... Make a copy.
    hi StatusLine   cterm=bold,reverse gui=bold,reverse
    hi StatusLineNC cterm=reverse gui=reverse
    hi TabLine      cterm=bold,underline ctermfg=15 ctermbg=242 gui=bold,underline guibg= guifg=#14101f
    hi TabLineFill  cterm=reverse gui=reverse
    hi TabLineSel   cterm=bold gui=bold
    hi SignColumn   ctermfg=14 ctermbg=242 guifg=#30343b guibg=Grey
    hi VertSplit    cterm=reverse gui=reverse
endfunction

"NOTE: get more light themes
command! InfolinesLight call InfolinesLight()
function! InfolinesLight()
    call InfolinesClear()
    call SchemesGitSignsLight()
    call InfolinesMenuHighlights()
    " Tint a little more blue than green and not much less red for pearly greys
    " #101520 Almost Black is the screen background, but things can get darker
    let g:il_d0='#0c0419' "#0f080e #101520 #0c0419 #252f3c #00a6b2 #30343b
    " #686868 #8f9898 #b6bfbf #c0cfcf #ccdddd

    hi StatusLine                                 gui=italic      guibg=#bfbfbf guifg=#8f9898
    hi StatusLineNC                               gui=none        guibg=#d8d8d8 guifg=#b6bfbf
    hi User1                                      gui=italic,bold guibg=#dfdfdf guifg=#8f9898
    hi User2                                      gui=bold        guibg=#bfbfbf guifg=#fcfcfc

    hi TabLineSel   cterm=bold,italic             gui=bold,italic guibg=#eeeeee guifg=#8f9898
    hi TabLine      cterm=bold                    gui=bold        guibg=#cfcfcf guifg=#8f9898
    hi TabLineFill  cterm=none                    gui=none        guibg=#cfcfcf guifg=#b6bfbf

    hi SignColumn                                                 guifg=#8f9898 guibg=#dfdfdf
    hi VertSplit    cterm=none                    gui=none        guifg=#b6bfbf
    hi ColorColumn                                          ctermfg=6 ctermbg=5 guibg=#fcfcfc
endfunction

function! InfolinesDefaultLight() " Don't just go hacking on this one for fun... Make a copy.
    set background=light
    hi StatusLine   cterm=bold,reverse gui=bold,reverse
    hi StatusLineNC cterm=reverse gui=reverse
    hi TabLine      ctermbg=7 ctermfg=0 ctermbg=7 guibg=LightGrey gui=underline
    hi TabLineFill  cterm=reverse gui=reverse
    hi TabLineSel   cterm=bold gui=bold
    hi SignColumn   ctermfg=4 guifg=DarkBlue ctermbg=248 guibg=Grey
    hi VertSplit    cterm=reverse gui=reverse
endfunction

command! InfolinesResetDark call InfolinesResetDark()
function! InfolinesResetDark()
    hi clear Normal
    " set bg& one day I'll have a theme that can do all of that, until then
    set background=dark
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
    colorscheme default
    call InfolinesDark()
    let colors_name = "infolines-dark"
endfunction

command! InfolinesResetLight call InfolinesResetLight()
function! InfolinesResetLight()
    hi clear Normal
    " set bg& one day I'll have a theme that can do all of that, until then
    set background=light
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
    call InfolinesLight()
    let colors_name = "infolines-light"
endfunction
